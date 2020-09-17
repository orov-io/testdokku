package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	port := "8080"

	// Starts a new Gin instance with no middle-ware
	r := gin.New()

	// Define handlers
	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Hello World!")
	})
	r.GET("/ping", func(c *gin.Context) {
		c.String(http.StatusOK, "pong")
	})

	// Listen and serve on defined port
	log.Printf("Listening on port %s", port)
	r.Run(":" + port)
}
