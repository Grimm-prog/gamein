package it.generationitaly.game.repository;

import java.util.List;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

<<<<<<< HEAD
	List<Videogame> preferiti(Utente utente, Preferito preferito);
=======
	Utente findByUsername(String username);

>>>>>>> branch 'repository' of https://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@github.com/Grimm-prog/gamein
}
