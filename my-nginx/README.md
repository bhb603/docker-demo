
Build Image:
```
docker build -t my-nginx:latest .
```

Run Container:
```
docker run --rm --name my -p 8080:80 my-nginx
```

Run Container w/ volume mounted:
```
docker run --rm --name my -p 8080:80 -v $(pwd)/www:/data/www my-nginx
```
