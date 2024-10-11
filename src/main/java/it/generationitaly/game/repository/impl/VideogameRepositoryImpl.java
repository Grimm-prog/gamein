package it.generationitaly.game.repository.impl;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;

public class VideogameRepositoryImpl extends JpaRepositoryImpl<Videogame, Long> implements VideogameRepository {

	public VideogameRepositoryImpl() {
		super(Videogame.class);
		// TODO Auto-generated constructor stub
	}

}
