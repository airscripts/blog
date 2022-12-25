const CACHE_VERSION = "1.9.0";
const SUPPORTED_METHODS = ["GET"];
const NOT_FOUND_PAGE = "/404.html";
const OFFLINE_PAGE = "/offline/index.html";
const NOT_FOUND_CACHE_FILES = ["/404.html"];
const SITE_URL = "https://blog.airscript.it";
const OFFLINE_CACHE_FILES = ["/offline/index.html"];

const BASE_CACHE_FILES = [
  "/logo.svg",
  "/logo-256x256.png",
  "/logo-512x512.png",
  "/favicon.ico",
  "/manifest.json",
  "/mstile-70x70.png",
  "/mstile-144x144.png",
  "/mstile-150x150.png",
  "/mstile-310x150.png",
  "/mstile-310x310.png",
  "/favicon-16x16.png",
  "/favicon-32x32.png",
  "/browserconfig.xml",
  "/apple-touch-icon.png",
  "/safari-pinned-tab.svg",
  "/android-chrome-192x192.png",
  "/android-chrome-512x512.png",
  "/maskable-android-chrome-192x192.png",
  "/maskable-android-chrome-512x512.png",
];

const CACHE_VERSIONS = {
  notFound: "404-v" + CACHE_VERSION,
  assets: "assets-v" + CACHE_VERSION,
  content: "content-v" + CACHE_VERSION,
  offline: "offline-v" + CACHE_VERSION,
};

const MAX_TTL = {
  "/": 3600,
  js: 86400,
  html: 3600,
  css: 86400,
  json: 86400,
};

const CACHE_BLACKLIST = [
  // (str) => {
  //   return !str.startsWith(SITE_URL) && !str.startsWith("http://localhost");
  // },
];

function isBlacklisted(url) {
  return CACHE_BLACKLIST.length > 0
    ? !CACHE_BLACKLIST.filter((rule) => {
        return typeof rule === "function" ? !rule(url) : false;
      }).length
    : false;
}

function getFileExtension(url) {
  let extension = url.split(".").reverse()[0].split("?")[0];
  return extension.endsWith("/") ? "/" : extension;
}

function getTTL(url) {
  let extension = getFileExtension(url);

  return typeof url === "string"
    ? typeof MAX_TTL[extension] === "number"
      ? MAX_TTL[extension]
      : null
    : null;
}

function installServiceWorker() {
  return Promise.all([
    caches.open(CACHE_VERSIONS.assets).then((cache) => {
      return cache.addAll(BASE_CACHE_FILES);
    }),

    caches.open(CACHE_VERSIONS.offline).then((cache) => {
      return cache.addAll(OFFLINE_CACHE_FILES);
    }),

    caches.open(CACHE_VERSIONS.notFound).then((cache) => {
      return cache.addAll(NOT_FOUND_CACHE_FILES);
    }),
  ]).then(() => {
    return self.skipWaiting();
  });
}

function cleanupCache(keys) {
  Promise.all(
    keys.map((key) => {
      return caches.delete(key);
    })
  )
    .then(() => {
      resolve();
    })

    .catch((err) => {
      reject(err);
    });
}

function cleanupLegacyCache() {
  let currentCaches = Object.keys(CACHE_VERSIONS).map((key) => {
    return CACHE_VERSIONS[key];
  });

  return new Promise((resolve, reject) => {
    caches
      .keys()

      .then((keys) => {
        return (legacyKeys = keys.filter((key) => {
          return !~currentCaches.indexOf(key);
        }));
      })

      .then((legacy) => {
        legacy.length ? cleanup(legacy) : resolve();
      })

      .catch(() => {
        reject();
      });
  });
}

function precacheUrl(url) {
  if (!isBlacklisted(url)) {
    caches.open(CACHE_VERSIONS.content).then((cache) => {
      cache
        .match(url)

        .then((response) => {
          return !response ? fetch(url) : null;
        })

        .then((response) => {
          return response ? cache.put(url, response.clone()) : null;
        });
    });
  }
}

self.addEventListener("install", (event) => {
  event.waitUntil(Promise.all([installServiceWorker(), self.skipWaiting()]));
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    Promise.all([
      cleanupLegacyCache(),
      self.clients.claim(),
      self.skipWaiting(),
    ]).catch(() => {
      self.skipWaiting();
    })
  );
});

self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.open(CACHE_VERSIONS.content).then((cache) => {
      return cache
        .match(event.request)

        .then((response) => {
          if (!response) return null;
          let date = null;
          let headers = response.headers.entries();

          for (let pair of headers) {
            if (pair[0] === "date") date = new Date(pair[1]);
          }

          if (!date) return response;
          let ttl = getTTL(event.request.url);
          let age = parseInt((new Date().getTime() - date.getTime()) / 1000);
          if (!ttl || age <= ttl) return response;

          return new Promise((resolve) => {
            return fetch(event.request.clone())
              .then((res) => {
                if (res) cache.put(event.request, res.clone()), resolve(res);
                else resolve(response);
              })

              .catch(() => {
                resolve(response);
              });
          }).catch(() => {
            return response;
          });
        })

        .then((response) => {
          if (response) return response;
          else {
            return fetch(event.request.clone())
              .then((response) => {
                if (response.status < 400) {
                  let isMethodSupported = ~SUPPORTED_METHODS.indexOf(
                    event.request.method
                  );

                  if (isMethodSupported && !isBlacklisted(event.request.url)) {
                    cache.put(event.request, response.clone());
                  }

                  return response;
                } else {
                  return caches.open(CACHE_VERSIONS.notFound).then((cache) => {
                    return cache.match(NOT_FOUND_PAGE);
                  });
                }
              })

              .then((response) => {
                if (response) return response;
              })

              .catch(() => {
                return caches
                  .open(CACHE_VERSIONS.offline)

                  .then((offlineCache) => {
                    return offlineCache.match(OFFLINE_PAGE);
                  });
              });
          }
        })

        .catch((error) => {
          console.error("Error in fetch handler:", error);
          throw error;
        });
    })
  );
});

self.addEventListener("message", (event) => {
  if (typeof event.data === "object" && typeof event.data.action === "string") {
    switch (event.data.action) {
      case "cache":
        precacheUrl(event.data.url);
        break;

      default:
        console.log("Unknown action: " + event.data.action);
        break;
    }
  }
});
