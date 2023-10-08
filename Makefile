COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up: env
	@docker compose -f $(COMPOSE_FILE) up -d --build

down:
	@docker compose -f $(COMPOSE_FILE) down

stop:
	@docker compose -f $(COMPOSE_FILE) stop

start:
	@docker compose -f $(COMPOSE_FILE) start

ps:
	@docker compose -f $(COMPOSE_FILE) ps

fclean: env
	@docker system prune --all --force --volumes
	@docker network prune --force

env:
	@test -f ./srcs/.env || cp ~/.env ./srcs/.env


# stop all containers, and Remove all unused images, and Remove unused volumes
# docker network rm $(docker network ls -q) 2> /dev/null
# docker volume rm $(docker volume ls -q)
