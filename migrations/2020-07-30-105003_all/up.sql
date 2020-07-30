-- Your SQL goes here
CREATE TABLE persons (
    id              SERIAL PRIMARY KEY,
    date_added      TIMESTAMP NOT NULL,
    name            TEXT NOT NULL,
    email           TEXT,
    phone           VARCHAR(30),
    tags            TEXT[] NOT NULL
)