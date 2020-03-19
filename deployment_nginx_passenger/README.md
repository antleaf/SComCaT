# Deployment

To build, you *must* run docker from the parent directory to this one
```bash
docker build -t antleaf_rails_app_server -f ./deployment_nginx_passenger/Dockerfile .
```

## Run to get console access
```bash
docker run --name antleaf_rails_app_server --rm -it antleaf_rails_app_server
docker exec -it antleaf_rails_app_server /bin/bash
```

## Run normally
```bash
docker run --name antleaf_rails_app_server --rm -p 80:80 antleaf_rails_app_server
```