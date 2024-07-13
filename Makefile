postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres createdb --username=root --owner=root bank

dropdb:
	docker exec -it postgres dropdb bank

migrate-up:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" --verbose up

migrate-down:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" --verbose down

.PHONY: postgres createdb dropdb migrate-up migrate-down
