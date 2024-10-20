package it.generationitaly.game.repository.impl;

import java.util.List;

import it.generationitaly.game.entity.Recensione;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.RecensioneRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;



public class RecensioneRepositoryImpl extends JpaRepositoryImpl<Recensione, Long> implements RecensioneRepository {

    public RecensioneRepositoryImpl() {
        super(Recensione.class);
    }

    @Override
    public List<Recensione> findByVoto(int voto) {
        List<Recensione> recensioni = null;
        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            TypedQuery<Recensione> query = em.createQuery("FROM recensione r WHERE r.voto = :voto", Recensione.class);
            query.setParameter("voto", voto);
            recensioni = query.getResultList();
            tx.commit();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            if (tx != null && tx.isActive())
                tx.rollback();
        } finally {
            if (em != null)
                em.close();
        }
        return recensioni;
    }

    @Override
    public List<Recensione> findByDifficolta(int difficolta) {
        List<Recensione> recensioni = null;
        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            TypedQuery<Recensione> query = em.createQuery("FROM recensione r WHERE r.difficolta = :difficolta", Recensione.class);
            query.setParameter("difficolta", difficolta);
            recensioni = query.getResultList();
            tx.commit();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            if (tx != null && tx.isActive())
                tx.rollback();
        } finally {
            if (em != null)
                em.close();
        }
        return recensioni;
    }

	@Override
	public Double AvgDifficolta(Long idvideogioco) {
		  Double avg=null;
	        EntityManager em = null;
	        EntityTransaction tx = null;
	        try {
	            em = emf.createEntityManager();
	            tx = em.getTransaction();
	            tx.begin();
	            TypedQuery<Double> query = em.createQuery("SELECT AVG(r.difficolta) FROM Videogame v JOIN v.recensioni r WHERE v.id=:id",Double.class);
	            query.setParameter("id", idvideogioco);
	            avg = query.getSingleResult();
	            tx.commit();
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	            if (tx != null && tx.isActive())
	                tx.rollback();
	        } finally {
	            if (em != null)
	                em.close();
	        }
	        return avg;
	}

	@Override
	public Double AvgVoto(Long idvideogioco) {
		 Double avg=null;
	        EntityManager em = null;
	        EntityTransaction tx = null;
	        try {
	            em = emf.createEntityManager();
	            tx = em.getTransaction();
	            tx.begin();
	            TypedQuery<Double> query = em.createQuery("SELECT AVG(r.voto) FROM Videogame v JOIN v.recensioni r WHERE v.id=:id",Double.class);
	            query.setParameter("id", idvideogioco);
	            avg = query.getSingleResult();
	            tx.commit();
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	            if (tx != null && tx.isActive())
	                tx.rollback();
	        } finally {
	            if (em != null)
	                em.close();
	        }
	        return avg;
	}

	@Override
	public Double AvgTempoDiGioco(Long idvideogioco) {
		 Double avg=null;
	        EntityManager em = null;
	        EntityTransaction tx = null;
	        try {
	            em = emf.createEntityManager();
	            tx = em.getTransaction();
	            tx.begin();
	            TypedQuery<Double> query = em.createQuery("SELECT AVG(r.tempoDiGioco) FROM Videogame v JOIN v.recensioni r WHERE v.id=:id",Double.class);
	            query.setParameter("id", idvideogioco);
	            avg = query.getSingleResult();
	            tx.commit();
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	            if (tx != null && tx.isActive())
	                tx.rollback();
	        } finally {
	            if (em != null)
	                em.close();
	        }
	        return avg;
	}

	@Override
	public Recensione findByVidoegameId(Long idvideogioco, Utente utente) {
		    Recensione recensione = null;
	        EntityManager em = null;
	        EntityTransaction tx = null;
	        try {
	            em = emf.createEntityManager();
	            tx = em.getTransaction();
	            tx.begin();
	            TypedQuery<Recensione> query = em.createQuery("FROM Recensione r WHERE r.videogame.id=:idvideogioco AND r.utente.id=:utenteId", Recensione.class);
	           query.setParameter("idvideogioco",idvideogioco);
	           query.setParameter("utenteId",utente.getId());
	            recensione = query.getSingleResult();
	            tx.commit();
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	            if (tx != null && tx.isActive())
	                tx.rollback();
	        } finally {
	            if (em != null)
	                em.close();
	        }
	        return recensione;
	}

}
