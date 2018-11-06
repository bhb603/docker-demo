# Docker Compose

The core Docker API (`docker build`, `docker run`, etc) is very powerful, and can be used to run just about anything. However remembering complex configurations, e.g. `docker run --rm -d -e API_KEY=foo -p 3000:300 -v $(pwd):/app my-image bundle exec rails server` is cumbersome. Even more so for multi-container systems.

Docker Compose solves this problem. It is a tool which allows complex, multi-container systems to be defined in a relatively straightforward yaml file. Then `docker-compose` can spin everything up in a single command:
```sh
docker-compose up
```

This directory contains source code for a sinatra web application, a Dockerfile for building that service, and a docker-compose file which defines our multi service setup. In this case we have two services:
  - `web`: the sinatra web server and application code
  - `mongo`: MongoDB

And one volume `mongo_data`, used to persist the DB across containers.

Start it up:
```sh
docker-compose up -d
```

Useful commands:
```sh
# list docker-compose services
docker-compose ps

# follow the logs of ALL services
docker-compose logs -f

# follow the logs of just one service
docker-compose logs -f web

# exec
docker-compose exec web bash
```

Bring it down:
```sh
docker-compose down
```
