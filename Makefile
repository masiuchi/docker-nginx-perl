build:
	docker-compose build

start:
	docker-compose up

reload:
	docker-compose kill -s HUP app

fetch:
	curl localhost:8080

