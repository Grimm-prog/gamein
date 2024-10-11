package it.generationitaly.game.repository.impl;

import java.util.List;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {

	public UtenteRepositoryImpl() {
		super(Utente.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Utente findByUsername(String username) {
		Utente utente = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			/*-
			SQL: SELECT * FROM utente WHERE username = ?
			JPQL (Positional Parameter): SELECT u FROM Utente u WHERE u.username = ?1
			JPQL (Named Parameter): SELECT u FROM Utente u WHERE u.username = :username
			*/
			TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u WHERE u.username = :username",
					Utente.class);
			query.setParameter("username", username);
			List<Utente> utenti = query.getResultList();
			utente = utenti.isEmpty() ? null : utenti.get(0);
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
