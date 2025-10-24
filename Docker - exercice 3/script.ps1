docker run -d --name postgres_cli `
    -e POSTGRES_USER=john `
    -e POSTGRES_DB=doe `
    -e POSTGRES_PASSWORD=johndoe `
    postgres:latest

docker run -d --name postgres_envfile `
    --env-file ./.env `
    postgres:latest

New-Item -ItemType Directory -Force -Path ./data | Out-Null
docker run -d --name postgres_bind `
    --env-file ./.env `
    -v ${PWD}/data:/var/lib/postgresql/data `
    postgres:latest

docker volume create db-storage
docker run -d --name postgres_volume `
    --env-file ./.env `
    --mount source=db-storage,target=/var/lib/postgresql/data `
    postgres:latest
