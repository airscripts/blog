const locale =
  navigator.languages && navigator.languages.length
    ? navigator.languages[0]
    : navigator.language;

const defaultLanguage = "en";
const language = locale ? locale.split("-")[0] : defaultLanguage;
var OneSignal = window.OneSignal || [];

OneSignal.push(function () {
  OneSignal.SERVICE_WORKER_PARAM = { scope: "/js/notifications/" };
  OneSignal.SERVICE_WORKER_PATH = "js/notifications/worker.js";
  OneSignal.SERVICE_WORKER_UPDATER_PATH = "js/notifications/worker.js";

  OneSignal.init({
    persistNotification: true,
    notificationClickHandlerAction: "navigate",
    appId: "b11e178e-35e4-4e25-ba77-18c2fb03fc8a",
    safari_web_id: "web.onesignal.auto.364542e4-0165-4e49-b6eb-0136f3f4eaa9",

    welcomeNotification: {
      title: getTranslation(language, "title"),
      message: getTranslation(language, "message"),
    },

    promptOptions: {
      slidedown: {
        prompts: [
          {
            type: "push",
            autoPrompt: true,

            text: {
              acceptButton: getTranslation(language, "accept"),
              cancelButton: getTranslation(language, "cancel"),
              actionMessage: getTranslation(language, "action"),
            },

            delay: {
              pageViews: 1,
              timeDelay: 3,
            },
          },
        ],
      },
    },
  });
});
