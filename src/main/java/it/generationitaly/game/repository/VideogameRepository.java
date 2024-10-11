
package it.generationitaly.game.repository;


import java.util.Date;
import java.util.List;

import it.generationitaly.game.entity.Videogame;


public interface VideogameRepository extends JpaRepository<Videogame, Long> {

	List<Videogame> findByGenere(long genere_id);
	List<Videogame> RicercaPerTitolo(String titolo);
	List<Videogame> RicercaPerData(Date dataUscita);
	List<Videogame> RicercaPerPegi(String classificazionePegi);
	List<Videogame> RicercaPerMultiplayer(boolean multiplayer);
	List<Videogame> findByTitoloGenereSviluppatore(String titolo,String nomeGenere,String nomeSviluppatore);
	List<Videogame> findByTitoloSviluppatore(String titolo,String nomeSviluppatore);
	
}

