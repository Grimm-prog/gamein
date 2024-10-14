
package it.generationitaly.game.repository;


import java.util.Date;
import java.util.List;

import it.generationitaly.game.entity.Videogame;


public interface VideogameRepository extends JpaRepository<Videogame, Long> {

	List<Videogame> findByGenere(String nameGenere);
	List<Videogame> findBySviluppatore(String nameSviluppatore);
	List<Videogame> findByGenereSviluppatore(String nameGenere,String nameSviluppatore);
	List<Videogame> RicercaPerTitolo(String titolo);
	List<Videogame> RicercaPerData(Date dataUscita);
	List<Videogame> OrderByDataDesc();
	List<Videogame> RicercaPerPegi(String classificazionePegi);
	List<Videogame> RicercaPerMultiplayer(boolean multiplayer);
	List<Videogame> findByTitoloGenereSviluppatore(String titolo,String nomeGenere,String nomeSviluppatore);
	List<Videogame> findByTitoloSviluppatore(String titolo,String nomeSviluppatore);
	List<Videogame> findByTitoloGenere(String titolo,String nomeGenere);
	
}

