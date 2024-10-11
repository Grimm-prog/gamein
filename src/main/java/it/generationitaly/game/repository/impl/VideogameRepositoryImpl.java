package it.generationitaly.game.repository.impl;


import java.util.Date;
import java.util.List;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class VideogameRepositoryImpl extends JpaRepositoryImpl<Videogame, Long> implements VideogameRepository {

	public VideogameRepositoryImpl() {
		super(Videogame.class);
		
	}

	@Override
	public List<Videogame> RicercaPerTitolo(String titolo) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame  WHERE vid.titolo=:titolo",
					Videogame.class);
			query.setParameter("titolo", titolo);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}

	@Override
	public List<Videogame> RicercaPerData(Date dataUscita) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame  WHERE vid.dataUscita=:dataUscita",
					Videogame.class);
			query.setParameter("dataUscita", dataUscita);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}

	@Override
	public List<Videogame> RicercaPerPegi(String classificazionePegi) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame  WHERE vid.classificazionePegi=:classificazionePegi",
					Videogame.class);
			query.setParameter("classificazionePegi", classificazionePegi);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}

	@Override
	public List<Videogame> RicercaPerMultiplayer(boolean multiplayer) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame  WHERE vid.multiplayer=:multiplayer",
					Videogame.class);
			query.setParameter("multiplayer", multiplayer);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}

	@Override
	public List<Videogame> findByGenere(long genere_id){
		List<Videogame> videogames = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			/*- 
			SQL: SELECT * FROM annuncio INNER JOIN immobile ON annuncio.immobile_id = immobile.id INNER JOIN indirizzo ON immobile.indirizzo_id = indirizzo.id WHERE indirizzo.comune = ?
			JPQL (Positional Parameter): SELECT a FROM Annuncio a INNER JOIN a.immobile im INNER JOIN im.indirizzo in WHERE in.comune = ?1
			JPQL (Named Parameter): SELECT a FROM Annuncio a INNER JOIN a.immobile im INNER JOIN im.indirizzo in WHERE in.comune = :comune
			*/
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM videogame LEFT JOIN videogame_genere vg WHERE v.id := genere_id",
					Videogame.class);
			query.setParameter("genere_id", genere_id);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}
	
	@Override
	public List<Videogame> findByNome(String nome){
		List<Videogame> videogames = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			/*- 
			SQL: SELECT * FROM annuncio INNER JOIN immobile ON annuncio.immobile_id = immobile.id INNER JOIN indirizzo ON immobile.indirizzo_id = indirizzo.id WHERE indirizzo.comune = ?
			JPQL (Positional Parameter): SELECT a FROM Annuncio a INNER JOIN a.immobile im INNER JOIN im.indirizzo in WHERE in.comune = ?1
			JPQL (Named Parameter): SELECT a FROM Annuncio a INNER JOIN a.immobile im INNER JOIN im.indirizzo in WHERE in.comune = :comune
			*/
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM videogame WHERE v.nome := nome",
					Videogame.class);
			query.setParameter("nome", nome);
			videogames = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return videogames;
	}
}
