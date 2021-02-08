package main

import (
	"log"
	"net/http"

	"github.com/mannion007/go-simple/pkg/healthcheck"
)

func main() {
	s := &http.Server{
		Addr: ":8080",
	}

	hh := healthcheck.Handler{}

	http.Handle("/healthcheck", hh)

	log.Fatal(s.ListenAndServe())
}
