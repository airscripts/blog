FROM alpine:3.16

LABEL maintainer="Airscript <dev.airscript@gmail.com>"

ENV BLOG_PORT=25001
ENV BLOG_INTERFACE=0.0.0.0

ARG BLOG_DIR=app

RUN apk update
RUN apk add git
RUN apk add hugo

RUN mkdir ${BLOG_DIR}
WORKDIR /${BLOG_DIR}

COPY . .
RUN git submodule update --init --recursive

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["hugo"]

EXPOSE ${BLOG_PORT}
