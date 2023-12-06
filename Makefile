# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guilmira <guilmira@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/23 13:04:18 by guilmira          #+#    #+#              #
#    Updated: 2023/12/06 13:16:46 by guilmira         ###   ########.fr        #
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
	git commit -m "2"
	git push

exe:
	docker exec -ti $(NAME-BACK) bash

exe1:
	docker exec -ti $(NAME-DB) bash

logs:
	docker logs $(NAME-FRONT)
	docker logs $(NAME-DB)
	docker logs $(NAME-BACK)

kill0:
	docker kill container-wordpress
	docker rmi -f image-wordpress
	

kill1:
	docker kill $(NAME-DB)
	docker container prune --force
	docker rmi --force image-database

exe2:
	docker exec -ti $(NAME-FRONT) bash

clean:
	docker-compose $(SRCS) kill
	docker container prune --force

stop:
	docker-compose $(SRCS) stop

kill:
	docker-compose $(SRCS) kill


fclean: clean
	@$(REMOVE)
	docker rmi $$(docker image ls -a -q)
	docker volume prune -f
	docker volume rm volume-frontend volume-database

re:
	docker-compose $(SRCS) restart


.PHONY: all exe stop kill clean fclean re
#--------------------------------------------------------------------------------------------------------------FORMAT
NONE='\033[0m'
GREEN='\033[1;32m'