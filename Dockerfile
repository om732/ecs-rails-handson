FROM node:12.16.0-alpine as node
FROM ruby:2.7.0-alpine

ENV BUNDLER_VERSION 2.1.4

COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN apk add --no-cache \
    tzdata \
    build-base \
    linux-headers \
    mariadb-dev \
    && gem install bundler -v $BUNDLER_VERSION

WORKDIR /app

COPY Gemfile* /app/

RUN bundle install \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . /app

RUN mkdir -p log tmp/pids tmp/sockets

EXPOSE 3000
