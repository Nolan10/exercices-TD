docker pull postgres:latest

docker network create my-network

docker run -d --name postgres-db --network my-network `
    -e POSTGRES_USER=jhon -e POSTGRES_PASSWORD=doe -e POSTGRES_DB=jhondoe `
    postgres:latest

docker build -t my-postgres-client .

docker run -it --rm --name client1 --network my-network my-postgres-client `

docker run -it --rm --name client2 my-postgres-client `
