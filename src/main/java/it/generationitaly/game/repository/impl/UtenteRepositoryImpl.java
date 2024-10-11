package it.generationitaly.game.repository.impl;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {

	public UtenteRepositoryImpl() {
		super(Utente.class);
		// TODO Auto-generated constructor stub
	}

}
