# Build an Image

Using a prebuilt image like `nginx` can be useful, but most likely you'll want to build your own custom images.

```sh
docker build [OPTIONS] PATH
```

In this directory, we have a `Dockerfile` containing build instructions, and some source code, so we can build a custom nginx image.
1. Build the custom image:
  ```sh
  cd /path/to/docker-demo/02-build-an-image
  docker build -t my-project/server:v1.0.0 .
  ```
  - `-t my-project/server:v1.0.0` tags the image
  - `.` is the path of the **build context** (in this case the current working dir), which contains the files we want to send to the image (nginx.conf, www/index.html) as well as the `Dockerfile` itself
2. Run a container from our new image:
  ```sh
  docker run --rm -p 8080:80 my-project/server:v1.0.0
  ```
3. What happens if we edit `./www/index.html`?
4. Re-start the container, this time with the current directory mounted as a volume in the container:
  ```sh
  docker run --rm -p 8080:80 -v $(pwd)/www:/data/www my-project/server:v1.0.0
  ```
5. Save changes to source code (e.g. `./www/index.html`), build and tag new version:
  ```sh
  docker build -t my-project/server:v1.1.0 .
  docker image ls
  ```
6. Now run the new v1.1.0:
  ```sh
  docker run --rm -p 8080:80 my-project/server:v1.1.0
  ```
  We can also run v1.0.0 simultaneously! (must use a different host port):
  ```sh
  docker run --rm -p 8081:80 my-project/server:v1.0.0
  ```
