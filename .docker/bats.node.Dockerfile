FROM node:18.7.0-alpine3.16

LABEL maintainer="Airscript <dev.airscript@gmail.com>"

ARG APP_DIR=app

RUN \
  apk update && \
  apk add bash && \
  npm install -g bats \
  mkdir ${APP_DIR}

WORKDIR /${APP_DIR}

COPY . .

ENTRYPOINT ["bash", "bats"]