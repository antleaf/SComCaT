# Deployment

## Building
To build, you *must* run docker from the parent directory to this one
```bash
docker build -t antleaf_rails_app_server -f ./deployment_nginx_passenger/Dockerfile .
```

## Publishing

```bash
docker image tag antleaf_rails_app_server:latest antleaf/antleaf_rails_app_server:1.0
docker login
docker push antleaf/antleaf_rails_app_server:1.0
```


## Running

### Create bridge network
```bash
docker network create my-net
```

### Run postgres
```bash
docker run \
    --name postgres-scomcat \
    --env-file=./deployment_nginx_passenger/env_variables.txt \
    -v /opt/data/postgres_databases/postgres_db_scomcat:/var/lib/postgresql/data \
    --rm \
    --network my-net \
    --publish 5432:5432 \
    postgres
```

## To get console access to application
```bash
docker run \
    --name antleaf-rails-app-server \
    --rm \
    -it \
    --env-file=./deployment_nginx_passenger/env_variables.txt \
    antleaf_rails_app_server
    
docker exec -it antleaf-rails-app-server /bin/bash
su - app
```

## Run normally
```bash
docker run \
    --name antleaf-rails-app-server \
    --rm \
    --network my-net \
    --publish 80:80 \
    --env-file=./deployment_nginx_passenger/env_variables.txt \
    antleaf_rails_app_server
```