test: docker_build_test
	docker-compose up -d
	docker-compose exec -T test go test ./...
	docker-compose down

unit_test: 
	go test `go list ./... | grep -v "e2e_test"`

docker_build_test:
	docker build -t test .