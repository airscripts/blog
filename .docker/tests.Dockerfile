FROM alpine:3.16

LABEL maintainer="Airscript <dev.airscript@gmail.com>"

ARG APP_DIR=app

RUN \
  apk update && \
  apk add npm && \
  apk add bash && \
  apk add make && \
  npm install -g bats \
  mkdir ${APP_DIR}

WORKDIR /${APP_DIR}

COPY . .

ENTRYPOINT ["./scripts/tests.docker-entrypoint.sh"]

CMD ["bats"]
