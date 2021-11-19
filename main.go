package main

import (
	"context"
	"database/sql"
	"fmt"

	"testpostgres/db/sqlc/db"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "root"
	password = "secret"
	dbname   = "test"
)

func main() {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)
	conn, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	db := db.New(conn)

	user, err := db.CreateUser(context.Background(), db.CreateUserParams{
		id:   1,
		name: "eshan",
		bio:  "Photography",
	})
	CheckError(err)

	defer db.Close()

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully connected!")
}

func CheckError(err error) {
	if err != nil {
		panic(err)
	}
}
