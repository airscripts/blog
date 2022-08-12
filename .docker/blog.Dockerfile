FROM alpine:3.16

LABEL maintainer="Airscript <dev.airscript@gmail.com>"

ENV BLOG_PORT=25001
ENV BLOG_INTERFACE=0.0.0.0

ARG BLOG_DIR=app
ARG BLOG_BUILD_ENV=docker

RUN apk update && apk add hugo && mkdir ${BLOG_DIR}

WORKDIR /${BLOG_DIR}

COPY . .

RUN sh ./scripts/git.sh ${BLOG_BUILD_ENV} && sh ./scripts/submodules.sh ${BLOG_BUILD_ENV}

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]

CMD ["hugo"]

EXPOSE ${BLOG_PORT}