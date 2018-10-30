Build Image:
```sh
docker build -t my-nginx:v1.0.0 .
```

Run Container:
```sh
docker run --rm --name my -p 8080:80 my-nginx
```

Run Container w/ volume mounted:
```sh
docker run --rm --name my -p 8080:80 -v $(pwd)/www:/data/www my-nginx
```

Make chagnes to source code, build and tag new version:
```sh
docker build -t my-nginx:v1.1.0 .
docker tag my-nginx:v1.1.0 my-nginx:latest
docker image ls
```
