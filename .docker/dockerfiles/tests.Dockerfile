FROM alpine:3.17 AS runner
  LABEL maintainer="Airscript <francesco@airscript.it>"
  WORKDIR /tmp
  COPY tmp/ /tmp/

  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh && \
    make install-npm && \
    make install-bats

  ENTRYPOINT [".docker/scripts/tests.docker-entrypoint.sh"]
  CMD ["bats"]
