Inception:
	sudo mkdir -p /home/theodore/data
	sudo docker-compose -f srcs/docker-compose.yml up --build

bonus:
	sudo mkdir -p /home/theodore/data
	sudo docker-compose -f srcs/docker-compose.bonus.yml up --build

clean:
	sudo docker-compose -f srcs/docker-compose.bonus.yml down

fclean:
	@sudo sh ./.fclean.sh

fcleandata: fclean
	sudo rm -rf /home/theodore/data
