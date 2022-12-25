FROM alpine:3.17 AS runner
  LABEL maintainer="Airscript <francesco@airscript.it>"
  WORKDIR /tmp
  COPY tmp/ /tmp/

  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh && \
    make install-curl && \
    make install-circleci-cli

  ENTRYPOINT [ ".docker/scripts/ci.docker-entrypoint.sh" ]
  CMD ["circleci"]
