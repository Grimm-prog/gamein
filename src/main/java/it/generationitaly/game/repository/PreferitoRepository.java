package it.generationitaly.game.repository;

import java.util.List;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;

public interface PreferitoRepository extends JpaRepository<Preferito, Long> {

	public Preferito findByUsernameAndVideogame(Utente utente, Videogame videogame);
}
