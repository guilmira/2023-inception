# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guilmira <guilmira@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/23 13:04:18 by guilmira          #+#    #+#              #
#    Updated: 2023/11/23 15:00:46 by guilmira         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= inception
#--------------------------------------------------------------------------------------------------------------PATHS
COMPOSE-PATH	= ./srcs

#--------------------------------------------------------------------------------------------------------------SOURCES
SRCS		= --file $(COMPOSE-PATH)/docker-compose.yaml
NAME-BACK	= backNGINX
NAME-DB		= dbMARIA
NAME-FRONT	= frontWP
#--------------------------------------------------------------------------------------------------------------COMMANDS
REMOVE		= docker system prune --force
#--------------------------------------------------------------------------------------------------------------RULES
$(NAME):
	docker-compose $(SRCS) up --detach
	@echo $(GREEN) "$(NAME) running. Containers up." $(NONE)

all: $(NAME)

exe:
	docker exec -ti $(NAME-BACK) sh

exe1:
	docker exec -ti $(NAME-DB) sh

exe2:
	docker exec -ti $(NAME-FRONT) sh

clean:
	docker-compose $(SRCS) down

stop:
	docker-compose $(SRCS) stop

kill:
	docker-compose $(SRCS) kill


fclean: clean
	@$(REMOVE)

re:
	docker-compose $(SRCS) restart


.PHONY: all exe stop kill clean fclean re
#--------------------------------------------------------------------------------------------------------------FORMAT
NONE='\033[0m'
GREEN='\033[1;32m'