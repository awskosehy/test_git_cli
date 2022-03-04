# test git cli
## setup the docker environment
```
#download github auth token from github and change to token file
docker pull kosehy/dood_env:v2
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock kosehy/dood_env:v2
```

## run docker-compose with variables
```
docker-compose down -v
SQL=db.sql
NUM=4
NUM=$NUM SQL=$SQL docker-compose up
```
