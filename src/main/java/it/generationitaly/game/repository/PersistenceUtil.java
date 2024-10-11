package it.generationitaly.game.repository;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class PersistenceUtil {

	private static final String PERSISTENCE_UNIT_NAME = "persistence";
	private static EntityManagerFactory emf;

	public static EntityManagerFactory getEntityManagerFactory() {
		if (emf == null)
			emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		return emf;
	}

}
