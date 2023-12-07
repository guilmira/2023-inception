# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guilmira <guilmira@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/23 13:04:18 by guilmira          #+#    #+#              #
#    Updated: 2023/12/07 18:07:44 by guilmira         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= inception
#--------------------------------------------------------------------------------------------------------------PATHS
COMPOSE-PATH	= ./srcs
#--------------------------------------------------------------------------------------------------------------SOURCES
SRCS		= --file $(COMPOSE-PATH)/docker-compose.yaml
NAME-BACK	= container-nginx
NAME-DB		= container-mariadb
NAME-FRONT	= container-wordpress
#--------------------------------------------------------------------------------------------------------------COMMANDS
REMOVE		= docker system prune --force
#--------------------------------------------------------------------------------------------------------------RULES
$(NAME):
	docker-compose $(SRCS) up --detach
	@echo $(GREEN) "$(NAME) running. Containers up." $(NONE)

all: $(NAME)

git:
	git add .
	git commit -m "standard commit"
	git push

exe:
	docker exec -ti $(NAME-BACK) bash

logs:
	docker logs $(NAME-FRONT)
	docker logs $(NAME-DB)
	docker logs $(NAME-BACK)

clean:
	docker-compose $(SRCS) kill
	docker container prune --force

kill:
	docker-compose $(SRCS) kill

fclean: clean
	@$(REMOVE)
	docker rmi $$(docker image ls -a -q)
	docker volume rm volume-frontend volume-database

re:
	docker-compose $(SRCS) restart

.PHONY: all exe kill clean fclean re
#--------------------------------------------------------------------------------------------------------------FORMAT
NONE='\033[0m'
GREEN='\033[1;32m'