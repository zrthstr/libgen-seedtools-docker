DC = docker compose
#DC = COMPOSE_DOCKER_CLI_BUILD=1 docker compose
DC_EXEC = $(DC) exec
DC_RUN_NO_DEPS = $(DC) run --no-deps --rm --remove-orphans

.PHONY: test libgen-seedtools-test transmission-test libgen-seedtools-shell transmission-shell \
        system-up system-up-foreground system-down system-logs system-build \
        libgen-seedtools-generate-config libgen-seedtools-fetch transmission-reload-config \
        transmission-count

################################
##### PROD and OPS section #####
################################
system-up:
	$(DC) up -d

system-up-foreground:
	$(DC) up

system-down:
	$(DC) down

system-logs:
	$(DC) logs

system-build:
	$(DC) build --no-cache

libgen-seedtools-generate-config:
	$(DC_RUN_NO_DEPS) libgen-seedtools generate-config
	@echo "Run 'sh helper/patch_config.sh' to patch data/config.json to standard config for docker compose setup"

libgen-seedtools-fetch:
	$(DC_RUN_NO_DEPS) libgen-seedtools fetch

transmission-reload-config:
	$(DC_EXEC) transmission kill -HUP 1

###############################
#### DEBUG and DEV secion #####
###############################
test: libgen-seedtools-test transmission-test

transmission-test:
	$(DC_RUN_NO_DEPS) transmission transmission-daemon --version
	$(DC_RUN_NO_DEPS) transmission transmission-remote --version

libgen-seedtools-test:
	$(DC_RUN_NO_DEPS) libgen-seedtools --version

transmission-count:
	$(DC_EXEC) transmission transmission-remote --list

libgen-seedtools-shell:
	$(DC_EXEC) libgen-seedtools /bin/sh

transmission-shell:
	$(DC_EXEC) transmission /bin/sh
