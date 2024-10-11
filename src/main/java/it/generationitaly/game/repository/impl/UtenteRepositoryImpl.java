package it.generationitaly.game.repository.impl;

import java.util.List;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.UtenteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {

	public UtenteRepositoryImpl() {
		super(Utente.class);
	}

	@Override
	public List<Videogame> preferiti(Utente utente, Preferito preferito) {
		List<Videogame> preferiti = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM videogame v JOIN preferito p ON v.id = :preferito.videogame_id JOIN utente u ON preferito.utente_id = :utente.id;",
					Videogame.class);
			query.setParameter("preferito.videogame_id", preferito);
			query.setParameter("utente.id;", utente);
			preferiti = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		System.out.println("ciao");
		return preferiti;
	}

	@Override
	public Utente findByUsername(String username) {
		Utente utente=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			 TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u WHERE u.username=:username", Utente.class);
			query.setParameter("username", username);
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
		return utente;
	}

	
}
