FROM alpine:3.16 AS runner
  LABEL maintainer="Airscript <dev.airscript@gmail.com>"
  WORKDIR /tmp
  COPY tmp/ /tmp/

  RUN \
    apk update && \
    sh /tmp/scripts/install/bash.sh && \
    bash /tmp/scripts/install/make.sh && \
    bash /tmp/scripts/install/npm.sh && \
    bash /tmp/scripts/install/bats.sh

  ENTRYPOINT ["./scripts/tests.docker-entrypoint.sh"]
  CMD ["bats"]
