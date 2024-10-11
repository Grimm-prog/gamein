package it.generationitaly.game.repository;

import java.util.List;

import it.generationitaly.game.entity.Videogame;

public interface VideogameRepository extends JpaRepository<Videogame, Long> {

	public List<Videogame> findByGenere(long genere_id);

	List<Videogame> findByNome(String nome);
}
