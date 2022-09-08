Inception:
	docker-compose -f srcs/docker-compose.yml up --build

bonus:
	docker-compose -f srcs/docker-compose.bonus.yml up --build

clean:
	docker-compose -f srcs/docker-compose.bonus.yml down

fclean:
	sh ./.fclean.sh
