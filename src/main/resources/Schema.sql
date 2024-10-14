CREATE SCHEMA jaita129_videogames;
DROP SCHEMA jaita129_videogames;
USE jaita129_videogames;

CREATE TABLE videogame (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(255) NOT NULL,
    descrizione VARCHAR(2048) NOT NULL,
    data_uscita DATE NOT NULL,
    classificazione_pegi CHAR(3) NOT NULL,
    foto VARCHAR(2048) NOT NULL,
    multiplayer BOOL NOT NULL
);

CREATE TABLE utente (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    foto VARCHAR(2048) NOT NULL
);

CREATE TABLE recensione (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    utente_id BIGINT NOT NULL,
    commento VARCHAR(2048) NOT NULL,
    voto INT NOT NULL CHECK (voto BETWEEN 1 AND 5) ,
    difficolta INT NOT NULL CHECK (difficolta BETWEEN 1 AND 5),
    tempo_di_gioco INT NOT NULL,
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (utente_id) REFERENCES utente(id)
);

CREATE TABLE genere (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE sviluppatore (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE videogame_genere (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    genere_id BIGINT NOT NULL,
    UNIQUE (videogame_id, genere_id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (genere_id) REFERENCES genere(id)
);

CREATE TABLE videogame_sviluppatore (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    sviluppatore_id BIGINT NOT NULL,
    UNIQUE (videogame_id, sviluppatore_id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (sviluppatore_id) REFERENCES sviluppatore(id)
);

CREATE TABLE preferito (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    utente_id BIGINT NOT NULL,
    videogame_id BIGINT NOT NULL,
    UNIQUE (utente_id, videogame_id),
    FOREIGN KEY (utente_id) REFERENCES utente(id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id)
);


INSERT INTO utente VALUES (1,'utente1', 'password1', 'utente1@example.com', '');
INSERT INTO utente VALUES (2,'utente2', 'password2', 'utente2@example.com', '');
INSERT INTO utente VALUES (3,'utente3', 'password3', 'utente3@example.com', '');
