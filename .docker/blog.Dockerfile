FROM alpine:3.16

LABEL maintainer="Airscript <dev.airscript@gmail.com>"

ENV BLOG_PORT=25001
ENV BLOG_INTERFACE=0.0.0.0

ARG BLOG_DIR=app
ARG BLOG_BUILD_ENVIRONMENT=docker

RUN \
  apk update && \
  apk add bash && \
  apk add hugo && \
  mkdir ${BLOG_DIR}

WORKDIR /${BLOG_DIR}

COPY . .

RUN \
  sh ./scripts/install/git.sh ${BLOG_BUILD_ENVIRONMENT} && \
  sh ./scripts/shared/git-submodules.sh ${BLOG_BUILD_ENVIRONMENT}

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]

CMD ["hugo"]

EXPOSE ${BLOG_PORT}
