FROM docker:28.2.2-dind-alpine3.21 AS runner
  LABEL maintainer="Airscript <francesco@airscript.it>"
  WORKDIR /home
  COPY tmp/ /home/

  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh && \
    make install-npm && \
    make install-python3 && \
    make install-gpp && \
    make install-devcontainer-cli

  ENTRYPOINT [ ".docker/scripts/devcontainer.docker-entrypoint.sh" ]
  CMD ["devcontainer"]