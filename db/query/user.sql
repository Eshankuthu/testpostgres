
-- name: CreateUser :one
INSERT INTO users (
  first_name,
  full_name,
  last_name,
  account_type
) VALUES (
  $1, $2, $3, $4
) RETURNING *;