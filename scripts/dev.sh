#!/bin/sh
set -ev

env COMPOSE_FILE=docker-compose.dev.yml \
    docker compose up -d --build
