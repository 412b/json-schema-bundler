FROM node:18.2.0-alpine

LABEL maintainer="Daniel Schröder <daniel.schroeder@skriptfabrik.com>"

ARG JSON_SCHEMA_BUNDLER_VERSION=latest

ENV JSON_SCHEMA_BUNDLER_VERSION=${JSON_SCHEMA_BUNDLER_VERSION}
ENV NODE_ENV=production

COPY . /opt/json-schema-bundler-${JSON_SCHEMA_BUNDLER_VERSION}

RUN set -eux; \
    npm --prefix /opt/json-schema-bundler-${JSON_SCHEMA_BUNDLER_VERSION} install; \
    rm -Rf ~/.npm; \
    ln -s /opt/json-schema-bundler-${JSON_SCHEMA_BUNDLER_VERSION}/json-schema-bundler-cli.js /usr/local/bin/json-schema-bundler

ENTRYPOINT [ "json-schema-bundler" ]
