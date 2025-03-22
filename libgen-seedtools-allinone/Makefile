NAME = libgen-seedtools-allinone

run:
	docker run -d --name $(NAME) ghcr.io/zrthstr/$(NAME)

fetch:
	docker exec $(NAME) libgen-seedtools fetch

edit:
	docker exec -it $(NAME) /bin/sh

