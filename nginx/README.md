Run an nginx container:
```sh
docker run --rm -d --name my-server -p 8080:80 nginx
chrome http://localhost:8080
```

See the image and container:
```sh
docker image ls
docker ps
```

Exec a command on the running container:
```sh
docker exec my-server env
```

Exec an interactive bash terminal, and change some files:
```sh
docker exec -it my-server bash
cat /etc/nginx/conf.d/default.conf
echo "<h1>Hello brown bag</h1>" > /usr/share/nginx/html/index.html
```

Stop the container:
```sh
docker stop my-server
```
