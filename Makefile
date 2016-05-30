build:
	docker build -t convox/mysql --rm=true .

debug:
	docker run -i -t --entrypoint=sh convox/mysql

run:
	docker run -i -p 3306:3306 convox/mysql
