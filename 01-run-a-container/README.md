# Run a Container

One of the most basic things you can do with Docker is run a container. The command looks like this:
```sh
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

## Example: Run an nginx server in a Docker container:

```sh
docker run --rm --name my-server -p 8080:80 -d nginx
```
- `--rm` tells Docker to auto remove the container when it's done or stopped. If this option is omitted Docker will leave around stopped containers on your machine
- `--name my-server` gives the container a descriptive name that you choose. This is not required, and if omitted Docker will autogenerate a funny name like `jovial_heisenberg`
- `-p 8080:80` bind port 8080 of the host machine (e.g. your laptop) to port 80 of the running container (which is where nginx happens to listen). This allows us to visit http://localhost:8080 on your host and be forwarded to the containerized server
- `-d` detaches the container from your terminal and runs in the background. If omitted, the container will run in the foreground, printing to STDOUT until it's done or you `CTRL-C`
- `nginx` is the name of the image

If this is the first time using the nginx image, the command will output something like this:
```
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
f17d81b4b692: Pull complete
d5c237920c39: Pull complete
a381f92f36de: Pull complete
Digest: sha256:b73f527d86e3461fd652f62cf47e7b375196063bbbd503e853af5be16597cb2e
Status: Downloaded newer image for nginx:latest
0428fbb4e169565a29bd1e9598c0ada6346ab4e0df758c2a6a59e4092a878d31
```
So what's happening?
1. Docker tries to find the image named `nginx` on your machine. Since it doesn't exist, it checks [Docker Hub](https://hub.docker.com/explore/) by default
2. Docker finds the [official nginx image in Docker Hub](https://hub.docker.com/_/nginx/) and downloads it. (Note that this step could also be performed explicitly with `docker pull nginx` before the `docker run` command). Now the nginx image has been downloaded and should be visible when listing local images:
  ```sh
  docker image ls
  REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
  nginx               latest              dbfc48660aeb        2 weeks ago         109MB
  ```
3. Docker runs the `my-server` **container** from the `nginx` **image** with the designated options and configuration.


### Now What?

Interact with your new container!
- List all running containers
  ```sh
  docker ps
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
11bd7af0926d        nginx               "nginx -g 'daemon of…"   6 seconds ago       Up 4 seconds        0.0.0.0:8080->80/tcp   my-server
  ```
- Since this is an nginx server, let's  visit in a browser: checkout http://localhost:8080
- Follow the logs:
  ```sh
  docker logs -f my-server
  ```
- `docker exec` let's us execute an arbitrary command in a running container
  - Print the environment:
    ```sh
    docker exec my-server env
    ```
  - `exec` an interactive bash terminal, then changes some files on the running container
    ```sh
    docker exec -it my-server bash
    cat /etc/nginx/conf.d/default.conf
    echo "<h1>Hello brown bag</h1>" > /usr/share/nginx/html/index.html
    ```
- Stop the container
  ```sh
  docker stop my-server
  ```

Note that containers are ephemeral. If we start up the nginx server again, it will start from the base nginx image, with no knowledge of the changes made in the previous container to `/usr/share/nginx/html/index.html`
```sh
docker run --rm -p 8080:80 nginx
# checkout http://localhost:8080 again
[CTRL-C]
```
