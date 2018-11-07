#!/usr/bin/env bash

TEN="0 1 2 3 4 5 6 7 8 9"
FIVE="0 1 2 3 4 5"

docker network create foo

# start 10 nginx instances
for N in $TEN; do
  docker run --rm -d --name "nginx-$N" --network foo nginx
done

# start 20 curlers, which which will continuously curl the nginx servers
for N in $TEN; do
  docker run --rm -d --name "curler-0$N" --network foo -e URL="nginx-$N" -e SLEEP="0.25s" curler
done
for N in $TEN; do
  docker run --rm -d --name "curler-1$N" --network foo -e URL="nginx-$N" -e SLEEP="0.25s" curler
done

# start 5 random-primes
for N in $FIVE; do
 docker run --rm -d --name "random-primes-$N" random-primes
done
