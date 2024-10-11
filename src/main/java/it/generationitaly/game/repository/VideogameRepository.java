package it.generationitaly.game.repository;

import java.util.Date;
import java.util.List;

import it.generationitaly.game.entity.Videogame;

/*
 * CREATE TABLE videogame (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(255) NOT NULL,
    descrizione VARCHAR(2048) NOT NULL,
    data_uscita DATE NOT NULL,
    classificazione_pegi CHAR(3) NOT NULL,
    foto VARCHAR(2048) NOT NULL,
    multiplayer BOOL NOT NULL
);
 */
public interface VideogameRepository extends JpaRepository<Videogame, Long> {
	
	List<Videogame> RicercaPerTitolo(String titolo);
	List<Videogame> RicercaPerData(Date dataUscita);
	List<Videogame> RicercaPerPegi(String classificazionePegi);
	List<Videogame> RicercaPerMultiplayer(boolean multiplayer);
	
	
	
}
