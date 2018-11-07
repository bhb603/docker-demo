package main

import (
	"fmt"
	"log"
	"math/rand"
	"time"
)

const SLEEP time.Duration = 200 * time.Millisecond
const MAX_N int = 1000000000

func IsPrime(val int) bool {

	if val < 2 {
		return false
	}

	for i := 2; i < val; i++ {
		if val%i == 0 {
			return false
		}
	}

	return true
}

func main() {

	seed := time.Now().UnixNano()

	log.Printf("random seed = %d", seed)
	rand.Seed(seed)

	for {
		x := rand.Intn(MAX_N)
		if IsPrime(x) {
			fmt.Println()
			log.Printf("%d is prime\n", x)
		} else {
			fmt.Print(".")
		}
		time.Sleep(SLEEP)
	}
}
