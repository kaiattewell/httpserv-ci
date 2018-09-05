.PHONY = Jenkins

NAME= python-http-server

delete:
	@docker stop ${NAME}
	@docker rm ${NAME}
	@docker rmi localhost:5000/${NAME}

compile: delete
	@docker build -t localhost:5000/${NAME}:latest .

run: compile
	@docker run -d -p 9000:9000 --name ${NAME} localhost:5000/${NAME} 

