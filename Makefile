DC = docker compose
DC_EXEC = $(DC) exec
DC_RUN_NO_DEPS = $(DC) run --no-deps --rm --remove-orphans

.PHONY: test test-libgenseedtools test-transmission shell-libgenseedtools shell-transmission up down log generate-config fetch edit-config-libgen-seedools edit-config-transmission build reread-config-tranmission


################################
##### PROD and OPS section #####
################################

up:
	$(DC) up -d

up-foreground:
	$(DC) up

down:
	$(DC) down

log:
	$(DC) logs

generate-config:
	$(DC_RUN_NO_DEPS) libgen-seedtools generate-config
	run `sh patch_config.sh` to patch data/config.json to standard config for docker compose setup

fetch:
	$(DC_RUN_NO_DEPS) libgen-seedtools fetch

build:
	$(DC) build --no-cache

reread-config-tranmission:
	$(DC_EXEC) transmission kill -HUP 1



###############################
#### DEBUG and DEV secion #####
###############################

test: test-libgenseedtools test-transmission

test-transmission:
	$(DC_RUN_NO_DEPS) transmission transmission-daemon --version
	$(DC_RUN_NO_DEPS) transmission transmission-remote --version

test-libgenseedtools:
	$(DC_RUN_NO_DEPS) libgen-seedtools --version

test-count-transmission:
	$(DC_EXEC) transmission transmission-remote --list

shell-libgenseedtools:
	$(DC_EXEC) libgen-seedtools /bin/sh

shell-transmission:
	$(DC_EXEC) transmission /bin/sh
