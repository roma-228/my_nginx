run:
	docker network create my_network
	docker build -t mynginx .
	docker container run -d --name webserver1 -i mynginx
	docker container run -d --name webserver2 -i mynginx
	docker network disconnect bridge webserver1
	docker network connect my_network webserver1
	docker network disconnect bridge webserver2
	docker network connect my_network webserver2
stop:
	docker rm -f  webserver1
	docker rm -f  webserver2
	docker image rm mynginx
	docker network rm my_network
