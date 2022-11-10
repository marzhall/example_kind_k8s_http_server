package main

import (
	"log"
	"net/http"
	"os"
	"path/filepath"
)

func main() {

	var (
		dir string
	)

	dir, _ = filepath.Abs(filepath.Dir(os.Args[0]))
	h := http.FileServer(http.Dir(dir))
	print("running")
	log.Fatal(http.ListenAndServe("0.0.0.0:8080", h))
}
