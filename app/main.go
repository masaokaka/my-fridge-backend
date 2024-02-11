package main

import (
	"myfridge-backend/db"
	"myfridge-backend/routes"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

var server = createMux()

func main() {
	db.Init()

	routes.RegisterRoutes(server)

	port := os.Getenv("API_PORT")
	server.Logger.Fatal(server.Start(port))
}

func createMux() *echo.Echo {
	e := echo.New()

	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.Gzip())

	return e
}
