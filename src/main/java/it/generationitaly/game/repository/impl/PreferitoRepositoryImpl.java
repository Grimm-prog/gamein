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
			TypedQuery<Utente> query = em.createQuery("SELECT p FROM Preferiti u WHERE p.utente_id=:utente_id AND p.videogame_id=:videogame_id",
					Utente.class);
			query.setParameter("username_id", utente.getId());
			query.setParameter("videogame_id", videogame.getId());
			utente = query.getSingleResult();
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
