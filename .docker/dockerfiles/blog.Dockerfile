FROM alpine:3.16 AS builder
  ARG BLOG_BUILD_ENVIRONMENT=docker
  WORKDIR /home
  COPY . .

  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh

  RUN \
    make install-git environment=${BLOG_BUILD_ENVIRONMENT} && \
    make git-submodules environment=${BLOG_BUILD_ENVIRONMENT}

FROM alpine:3.16 AS runner
  LABEL maintainer="Airscript <dev.airscript@gmail.com>"
  ENV BLOG_PORT=25001
  ENV BLOG_INTERFACE=0.0.0.0
  WORKDIR /home
  COPY --from=builder /home ./
  
  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh && \
    make install-hugo
  
  ENTRYPOINT [".docker/scripts/blog.docker-entrypoint.sh"]
  CMD ["hugo"]
  EXPOSE ${BLOG_PORT}
