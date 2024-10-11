	package it.generationitaly.game.repository;

import it.generationitaly.game.entity.Utente;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

	Utente findByUsername(String username);

}
