
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
					"SELECT vid FROM Videogame  WHERE vid.titolo LIKE ':titolo%'",
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
					"SELECT vid FROM Videogame vid WHERE vid.multiplayer=:multiplayer",
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
	public List<Videogame> findByGenere(String nameGenere){
		List<Videogame> videogames = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM Videogame v INNER JOIN videogameGenere vg INNER JOIN Genere g  WHERE g.name=:nameGenere",
					Videogame.class);
			query.setParameter("nameGenere", nameGenere);
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
	public List<Videogame> findByTitoloGenereSviluppatore(String titolo, String nomeGenere, String nomeSviluppatore) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame vid INNER JOIN VideogameGenere vg INNER JOIN Genere g"
					+ "INNER JOIN VideogameSviluppatore vs INNER JOIN Sviluppatore WHERE vid.titolo LIKE ':titolo%' AND g.name=:nomeGenere AND s.name=:nomeSviluppatore",
					Videogame.class);
			query.setParameter("titolo",titolo);
			query.setParameter("nomeGenere",nomeGenere);
			query.setParameter("nomeSviluppatore",nomeSviluppatore);
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
	public List<Videogame> findByTitoloSviluppatore(String titolo, String nomeSviluppatore) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame vid "
					+ "INNER JOIN VideogameSviluppatore vs INNER JOIN Sviluppatore WHERE vid.titolo LIKE ':titolo%'  AND s.name=:nomeSviluppatore",
					Videogame.class);
			query.setParameter("titolo",titolo);
			query.setParameter("nomeSviluppatore",nomeSviluppatore);
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
	public List<Videogame> findBySviluppatore(String nameSviluppatore) {
		List<Videogame> videogames = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM Videogame v INNER JOIN videogameSviluppatore vs INNER JOIN Sviluppatore s  WHERE s.name=:nameSviluppatore",
					Videogame.class);
			query.setParameter("nameSviluppatore", nameSviluppatore);
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
	public List<Videogame> findByGenereSviluppatore(String nameGenere, String nameSviluppatore) {
		List<Videogame> videogames = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT v FROM Videogame v INNER JOIN videogameSviluppatore vs INNER JOIN Sviluppatore s INNER JOIN videogameGenere vg INNER JOIN Genere g  WHERE s.name=:nameSviluppatore AND g.name=:nameGenere",
					Videogame.class);
			query.setParameter("nameSviluppatore", nameSviluppatore);
			query.setParameter("nameGenere", nameGenere);
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
	public List<Videogame> findByTitoloGenere(String titolo, String nomeGenere) {
		List<Videogame> videogames=null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Videogame> query = em.createQuery(
					"SELECT vid FROM Videogame vid "
					+ "INNER JOIN VideogameGenere vg INNER JOIN Genere WHERE vid.titolo LIKE ':titolo%'  AND g.name=:nomeGenere",
					Videogame.class);
			query.setParameter("titolo",titolo);
			query.setParameter("nomeGenere",nomeGenere);
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
