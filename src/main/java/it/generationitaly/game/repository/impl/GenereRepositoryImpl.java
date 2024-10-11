package it.generationitaly.game.repository.impl;

import it.generationitaly.game.entity.Genere;
import it.generationitaly.game.repository.GenereRepository;

public class GenereRepositoryImpl extends JpaRepositoryImpl<Genere, Long> implements GenereRepository {

	public GenereRepositoryImpl() {
		super(Genere.class);
		// TODO Auto-generated constructor stub
	}

}
