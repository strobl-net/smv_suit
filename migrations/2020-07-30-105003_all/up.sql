CREATE TYPE currency AS ENUM ('eur', 'usd');
CREATE TYPE branch AS ENUM ('digital', 'cash');

CREATE TABLE persons (
    id              SERIAL                  ,
    name            TEXT        NOT NULL    ,
    email           TEXT                    ,
    phone           VARCHAR(30)             ,
    tags            TEXT[]      NOT NULL    ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)
);

CREATE TABLE organisations (
    id              SERIAL                  ,
    name            TEXT        NOT NULL    ,
    description     TEXT                    ,
    site            TEXT                    ,
    location        TEXT                    ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_entities (
    id              SERIAL                  ,
    description     TEXT                    ,
    organisation    INT         UNIQUE      ,
    person          INT         UNIQUE      ,
    iban            VARCHAR(40)             ,
    bic             VARCHAR(15)             ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)                        ,
    CONSTRAINT fk_organisation
        FOREIGN KEY (organisation)
                REFERENCES organisations(id)
                ON DELETE CASCADE           ,
    CONSTRAINT  fk_person
        FOREIGN KEY (person)
                REFERENCES persons(id)
                ON DELETE CASCADE
);

CREATE TABLE products (
    id              SERIAL                  ,
    name            TEXT        NOT NULL    ,
    description     TEXT                    ,
    change          INT                     ,
    currency        CURRENCY                ,
    provider        INT                     ,
    tags            TEXT[]                  ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)                        ,
    CONSTRAINT fk_provider
        FOREIGN KEY (provider)
            REFERENCES transaction_entities(id)
            ON DELETE SET NULL
);

CREATE TABLE money_nodes (
    id              SERIAL                  ,
    branch          BRANCH      NOT NULL    ,
    change          INT         NOT NULL    ,
    currency        CURRENCY    NOT NULL    ,
    processed       BOOLEAN     NOT NULL    ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)
);

CREATE TABLE transactions (
    id              SERIAL                  ,
    description     TEXT                    ,
    sender          INT         NOT NULL    ,
    sender_local    BOOLEAN     NOT NULL    ,
    receiver        INT         NOT NULL    ,
    receiver_local  BOOLEAN     NOT NULL    ,
    money_node      INT         NOT NULL UNIQUE,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)                        ,
    CONSTRAINT fk_sender
        FOREIGN KEY (sender)
                REFERENCES transaction_entities(id)
                ON DELETE SET NULL          ,
    CONSTRAINT  fk_receiver
        FOREIGN KEY (receiver)
                REFERENCES transaction_entities(id)
                ON DELETE SET NULL          ,
    CONSTRAINT fk_money_node
        FOREIGN KEY (money_node)
                REFERENCES money_nodes(id)
                ON DELETE SET NULL
);

CREATE TABLE bills (
    id              SERIAL                  ,
    received        TIMESTAMP   NOT NULL    ,
    processed       TIMESTAMP               ,
    products        INT[]                   ,
    responsible     INT                     ,
    transaction     INT         NOT NULL UNIQUE,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)                        ,
    CONSTRAINT  fk_responsible
        FOREIGN KEY (responsible)
            REFERENCES persons(id)
            ON DELETE SET NULL              ,
    CONSTRAINT fk_transaction
        FOREIGN KEY (transaction)
            REFERENCES transactions(id)
            ON DELETE SET NULL
);

CREATE TABLE depodraws (
    id               SERIAL                  ,
    description      TEXT                    ,
    transaction_up   INT         NOT NULL UNIQUE,
    transaction_down INT         NOT NULL UNIQUE,
    added            TIMESTAMP   NOT NULL    ,
    changed          TIMESTAMP               ,
    PRIMARY KEY (id)                         ,
    CONSTRAINT fk_transaction_up
        FOREIGN KEY (transaction_up)
            REFERENCES transactions(id)
            ON DELETE SET NULL               ,
    CONSTRAINT fk_transaction_down
        FOREIGN KEY (transaction_down)
            REFERENCES transactions(id)
            ON DELETE SET NULL
);

CREATE TABLE statement_of_accounts (
    id              SERIAL                  ,
    description     TEXT                    ,
    starting        TIMESTAMP   NOT NULL    ,
    ending          TIMESTAMP   NOT NULL    ,
    added           TIMESTAMP   NOT NULL    ,
    changed         TIMESTAMP               ,
    PRIMARY KEY (id)
);

-- DEFAULT VALUES
-- TODO

-- TEST VALUES, COMMENT THIS IN PRODUCTION!
INSERT INTO persons (name, email, phone, tags, added) VALUES ('Sebastian', 'Sebastian@Test.com', '020-74023-234', '{admin, developer, smv}', NOW());
INSERT INTO persons (name, email, phone, tags, added) VALUES ('Max Mustermann', 'Max@Mustermann.de', '020-23436-123', '{smv}', NOW());
INSERT INTO persons (name, email, phone, tags, added) VALUES ('Maxina Mustermann', 'Maxina@Mustermann.de', '020-76562-123', '{smv, party_leader}', NOW());

INSERT INTO organisations (name, added) VALUES ('SMV Local', NOW());
INSERT INTO organisations (name, added) VALUES ('SMV Digital', NOW());
INSERT INTO organisations (name, site, added) VALUES ('Amazon', 'amazon.com', NOW());
INSERT INTO organisations (name, description, site, location, added) VALUES ('Edika X', 'lebensmittel', 'edika.com', '032740 Munich Street X', NOW());

INSERT INTO transaction_entities (description, organisation, added) VALUES ('smv local', 1, NOW());
INSERT INTO transaction_entities (description, organisation, added) VALUES ('smv digital', 2, NOW());
INSERT INTO transaction_entities (description, organisation, added) VALUES ('amazon', 3, NOW());
INSERT INTO transaction_entities (description, organisation, added) VALUES ('local supermarket', 4, NOW());

INSERT INTO products (name, description, change, currency, provider, added) VALUES ('Flat Screen TV', 'television in 2020 lul', 133372, 'eur', 3, NOW());
INSERT INTO products (name, description, change, currency, provider, added) VALUES ('Banana', 'A delicious and long fruit', 99, 'eur', 4, NOW());
INSERT INTO products (name, description, change, currency, provider, added) VALUES ('Apple', 'A round fruit', 69, 'eur', 4, NOW());


INSERT INTO money_nodes (branch, change, currency, processed, added)
    VALUES ('digital', 8000, 'eur', true, now());

INSERT INTO money_nodes (branch, change, currency, processed, added)
    VALUES ('digital', -4000, 'eur', true, now());
INSERT INTO money_nodes (branch, change, currency, processed, added)
    VALUES ('cash', 4000, 'eur', true, now());

INSERT INTO money_nodes (branch, change, currency, processed, added)
    VALUES ('cash', -168, 'eur', true, now());


INSERT INTO transactions (description, sender, sender_local, receiver, receiver_local, money_node, added)
    VALUES ('starter money', 1, false, 1, true, 1, now());

INSERT INTO transactions (description, sender, sender_local, receiver, receiver_local, money_node, added)
    VALUES ('withdraw account side', 2, false, 1, true, 2, now());
INSERT INTO transactions (description, sender, sender_local, receiver, receiver_local, money_node, added)
    VALUES ('withdraw cash side', 2, false, 1, true, 3, now());

INSERT INTO transactions (description, sender, sender_local, receiver, receiver_local, money_node, added)
    VALUES ('test buy for Edika', 1, true, 4, true, 4, now());


INSERT INTO depodraws (description, transaction_up, transaction_down, added)
    VALUES ('first withdraw', 3, 2, now());


INSERT INTO bills (received, processed, products, responsible, transaction, added)
    VALUES (now(), now(), '{2, 3}', 1, 4, now())