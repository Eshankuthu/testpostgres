CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "account_type" varchar NOT NULL,
  "created_date" timestamptz DEFAULT 'now()',
  "updated_date" timestamptz DEFAULT 'now()'
);

CREATE TABLE "subscriptions" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigserial,
  "type" varchar NOT NULL,
  "subscribe_date" timestamptz DEFAULT 'now()',
  "cancel_date" timestamptz DEFAULT 'now()',
  "renew_date" timestamptz DEFAULT 'now()',
  "termination_date" timestamptz DEFAULT 'now()',
  "next_charge_date" timestamptz DEFAULT 'now()'
);

CREATE TABLE "alert" (
  "user_id" bigserial,
  "alert_type" varchar NOT NULL,
  "coin" varchar NOT NULL,
  "last_sent" timestamptz DEFAULT 'now()'
);

CREATE TABLE "articles" (
  "author_id" bigserial,
  "type" varchar NOT NULL,
  "view" varchar NOT NULL,
  "title" varchar NOT NULL,
  "body" varchar NOT NULL,
  "created_date" timestamptz DEFAULT 'now()',
  "updated_date" timestamptz DEFAULT 'now()'
);

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "alert" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "articles" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id");
