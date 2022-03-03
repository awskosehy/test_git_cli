# test git cli

## How to run
```
docker pull kosehy/dood_env:v2
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock kosehy/dood_env:v2
docker-compose down -v
SQL=test.sql
NUM=4
NUM=$NUM SQL=$SQL docker-compose up
```

## How to run if new sql is added
```
git add .;git commit -m "add ???.sql"; git push
nano token
docker rmi kosehy/dood_env:v2
docker build -t kosehy/dood_env:v2 .
docker push kosehy/dood_env:v2
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock kosehy/dood_env:v2
```

```

docker-compose down -v
SQL=???.sql
NUM=?
NUM=$NUM SQL=$SQL docker-compose up
```