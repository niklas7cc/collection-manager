CREATE DATABASE tcg_collection;


CREATE TABLE card (
    card_id int NOT NULL,
    card_name varchar(255),
    card_number int,
    expansion_max_number int,
    expansion_id int,
    rarity_id int,
    condition_id int,
    language_id int,
    image_path varchar(255),
    CONSTRAINT pk_card PRIMARY KEY (card_id)
);


CREATE TABLE expansion (
    expansion_id int NOT NULL,
    expansion_name varchar(255),
    release_date date,
    expansion_max_number int,
    CONSTRAINT pk_expansion PRIMARY KEY (expansion_id)
);

CREATE TABLE pokemon (
    pokemon_id int NOT NULL,
    pokemon_name varchar(255),
    pokedex_number int,
    CONSTRAINT pk_pokemon PRIMARY KEY (pokemon_id)
);

CREATE TABLE rarity (
    rarity_id int NOT NULL,
    rarity_name varchar(255),
    CONSTRAINT pk_rarity PRIMARY KEY (rarity_id)
);

CREATE TABLE condition (
    condition_id int NOT NULL,
    condition_name varchar(255),
    CONSTRAINT pk_condition PRIMARY KEY (condition_id)
);

CREATE TABLE language (
    language_id int NOT NULL,
    language_name varchar(255),
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE metadata (
    metadata_id int NOT NULL,
    attribute varchar(255),
    CONSTRAINT pk_metadata PRIMARY KEY (metadata_id)
);

CREATE TABLE card_metadata (
    card_id int NOT NULL,
    metadata_id int NOT NULL,
    CONSTRAINT pk_card_metadata PRIMARY KEY (card_id, metadata_id)
);

CREATE TABLE card_pokemon (
    card_id int NOT NULL,
    pokemon_id int NOT NULL,
    CONSTRAINT pk_card_pokemon PRIMARY KEY (card_id, pokemon_id)
);


ALTER TABLE card ADD CONSTRAINT fk_card_expansion_id_expansion FOREIGN KEY (expansion_id)
REFERENCES expansion (expansion_id);

ALTER TABLE card ADD CONSTRAINT fk_card_rarity_id_rarity FOREIGN KEY (rarity_id)
REFERENCES rarity (rarity_id);

ALTER TABLE card ADD CONSTRAINT fk_card_condition_id_condition FOREIGN KEY (condition_id)
REFERENCES condition (condition_id);

ALTER TABLE card ADD CONSTRAINT fk_card_language_id_language FOREIGN KEY (language_id)
REFERENCES language (language_id);

ALTER TABLE card_metadata ADD CONSTRAINT fk_card_metadata_card_id_card FOREIGN KEY (card_id)
REFERENCES card (card_id);

ALTER TABLE card_metadata ADD CONSTRAINT fk_card_metadata_metadata_id_metadata FOREIGN KEY (metadata_id)
REFERENCES metadata (metadata_id);

ALTER TABLE card_pokemon ADD CONSTRAINT fk_card_pokemon_card_id_card FOREIGN KEY (card_id)
REFERENCES card (card_id);

ALTER TABLE card_pokemon ADD CONSTRAINT fk_card_pokemon_pokemon_id_pokemon FOREIGN KEY (pokemon_id)
REFERENCES pokemon (pokemon_id);




CREATE INDEX index_card_on_expansion_id ON card (expansion_id);
CREATE INDEX index_card_on_rarity_id ON card (rarity_id);
CREATE INDEX index_card_on_condition_id ON card (condition_id);
CREATE INDEX index_card_on_language_id ON card (language_id);
CREATE INDEX index_card_metadata_on_metadata_id ON card_metadata (metadata_id);
CREATE INDEX index_card_pokemon_on_pokemon_id ON card_pokemon (pokemon_id);
CREATE INDEX index_pokemon_on_pokedex_number ON pokemon (pokedex_number);
CREATE INDEX index_expansion_on_release_date ON expansion (release_date);
CREATE INDEX index_pokemon_on_pokemon_name ON pokemon (pokemon_name);
CREATE INDEX index_expansion_on_expansion_name ON expansion (expansion_name);
