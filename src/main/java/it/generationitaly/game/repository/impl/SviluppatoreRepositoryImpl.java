package it.generationitaly.game.repository.impl;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Sviluppatore;
import it.generationitaly.game.repository.SviluppatoreRepository;

public class SviluppatoreRepositoryImpl  extends JpaRepositoryImpl<Sviluppatore, Long> implements SviluppatoreRepository{


	public SviluppatoreRepositoryImpl() {
		super(Sviluppatore.class);
		
	}
}
