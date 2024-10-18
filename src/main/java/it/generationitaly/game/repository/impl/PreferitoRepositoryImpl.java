package it.generationitaly.game.repository.impl;

import java.util.List;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.PreferitoRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class PreferitoRepositoryImpl extends JpaRepositoryImpl<Preferito, Long> implements PreferitoRepository {

	public PreferitoRepositoryImpl() {
		super(Preferito.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Preferito findByUsernameAndVideogame(Utente utente, Videogame videogame) {
		// TODO Auto-generated method stub
		Preferito preferito = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Preferito> query = em.createQuery("SELECT p FROM Preferito p WHERE p.utente.id=:utente_id AND p.videogame.id=:videogame_id",
					Preferito.class);
			query.setParameter("utente_id", utente.getId());
			query.setParameter("videogame_id", videogame.getId());
			preferito = query.getSingleResult();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		// System.out.println("ciao");
		return preferito;
	}

}
