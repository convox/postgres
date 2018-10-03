.PHONY: all build release

all: build

build:
	docker build -t convox/postgres .
	docker build -t convox/postgres:9 9/
	docker build -t convox/postgres:10 10/

release: build
	docker push convox/postgres
	docker push convox/postgres:9
	docker push convox/postgres:10
