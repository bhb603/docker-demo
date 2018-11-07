# Load Test

Put docker to the test and see how many containers can run under load on one machine!

Build the images:
```sh
docker build -t curler ./curler
docker build -t random-primes ./random-primes
```

Run a boatload of them:
```sh
./up.sh
```

Track system usage:
```sh
docker stats
```

Bring it all down:
```sh
docker stop $(docker ps -q)
```
