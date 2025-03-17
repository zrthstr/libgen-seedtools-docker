
test: test-libgenseedtools test-transmission

test-transmission:
	docker-compose run --rm --remove-orphans --no-deps transmission transmission-daemon --version

test-libgenseedtools:
	docker-compose run --rm --remove-orphans --no-deps seedtools --version

shell-libgenseedtools:
	docker-compose run --rm --remove-orphans --entrypoint=sh --no-deps seedtools 

shell-transmission:
	docker-compose run --rm --remove-orphans --entrypoint=sh --no-deps seedtools 

up:
	docker-compose up

down:
	echo down

log:
	echo logs

generate-config:
	docker-compose run --rm --remove-orphans --no-deps seedtools generate-config
	echo now edit / patch for path

fetch:
	docker-compose run --rm --remove-orphans --no-deps seedtools fetch

edit-config-libgen-seedools:
	echo  e c l s

edit-config-transmission:
	echo e c t

build:
	docker-compose build --no-cache

reread-config-tranmission:
	echo kill -HUP 1234


