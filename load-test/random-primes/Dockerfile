FROM golang:1.11.1 AS builder

WORKDIR /go/src/github.com/bhb603/random-primes

COPY main.go main.go

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /bin/random-prime main.go

FROM alpine:latest
COPY --from=builder /bin/random-prime /bin/random-prime
CMD ["/bin/random-prime"]
