# Docker Compose command variables
DC = COMPOSE_DOCKER_CLI_BUILD=1 docker compose
DC_RUN = $(DC) run --rm --remove-orphans
DC_RUN_NO_DEPS = $(DC_RUN) --no-deps

# Targets
.PHONY: test test-libgenseedtools test-transmission shell-libgenseedtools shell-transmission up down log generate-config fetch edit-config-libgen-seedools edit-config-transmission build reread-config-tranmission

test: test-libgenseedtools test-transmission

test-transmission:
	$(DC_RUN_NO_DEPS) transmission transmission-daemon --version

test-libgenseedtools:
	$(DC_RUN_NO_DEPS) seedtools --version

shell-libgenseedtools:
	$(DC_RUN_NO_DEPS) --entrypoint=sh seedtools 

shell-transmission:
	$(DC_RUN_NO_DEPS) --entrypoint=sh seedtools 

up:
	$(DC) up

down:
	echo down

log:
	echo logs

generate-config:
	$(DC_RUN_NO_DEPS) seedtools generate-config
	echo now edit / patch for path

fetch:
	$(DC_RUN_NO_DEPS) seedtools fetch

edit-config-libgen-seedools:
	echo e c l s

edit-config-transmission:
	echo e c t

build:
	$(DC) build --no-cache

reread-config-tranmission:
	echo kill -HUP 1234
