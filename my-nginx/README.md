
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
