NAME			=	inception

VOL_MDB			=	srcs_mariadb

VOL_WPS			=	srcs_wordpress

VOLUMES			=	$(VOL_MDB) $(VOL_WPS)

DIR_SRC			=	srcs/

CONFIG_PATH		=	$(DIR_SRC)docker-compose.yml

VOL_PATH		=	/Users/hferraud/data/

VOL_MARIADB		=	$(VOL_PATH)mariadb/

VOL_WORDPRESS	=	$(VOL_PATH)wordpress/

VOL_DIRS		=	$(VOL_MARIADB) $(VOL_WORDPRESS)

.PHONY:	all
all:	$(NAME)

$(NAME):	$(VOL_DIRS)
					docker compose -f $(CONFIG_PATH) up --build

.PHONY:	build
build:
					docker compose -f $(CONFIG_PATH) up --build

.PHONY:	fclean
fclean:				clean
					docker image rm nginx mariadb wordpress -f

.PHONY:	clean
clean:
					rm -rf $(VOL_DIRS)
					docker compose -f $(CONFIG_PATH) down
					docker volume rm $(VOLUMES) -f

.PHONY: re
re:
	$(MAKE) fclean
	$(MAKE) all

$(VOL_DIRS):
					mkdir -p $@