-- Your SQL goes here
CREATE TABLE persons (
    id              SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    email           TEXT,
    phone           VARCHAR(30),
    tags            TEXT[] NOT NULL,
    date_added      TIMESTAMP NOT NULL
)