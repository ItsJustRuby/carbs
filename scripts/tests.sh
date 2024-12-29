#!/bin/sh
set -ev

env COMPOSE_PATH_SEPARATOR=: \
    COMPOSE_FILE=docker-compose.dev.yml:docker-compose.tests.yml \
    docker compose up -d --build
