package it.generationitaly.game.repository;

import java.util.List;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

	List<Videogame> preferiti(Utente utente, Preferito preferito);
}
