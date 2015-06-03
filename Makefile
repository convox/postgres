build:
	docker build -t convox/postgres --rm=true .

debug:
	docker run -i -t --entrypoint=sh convox/postgres

run:
	docker run -i -p 5432:5432 convox/postgres
