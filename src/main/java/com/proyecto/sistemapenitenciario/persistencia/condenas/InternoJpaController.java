/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.persistencia.condenas;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import com.proyecto.sistemapenitenciario.persistencia.condenas.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Estéfano
 */
public class InternoJpaController implements Serializable {

    public InternoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Interno interno) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Establecimiento idEstablecimiento = interno.getIdEstablecimiento();
            if (idEstablecimiento != null) {
                idEstablecimiento = em.getReference(idEstablecimiento.getClass(), idEstablecimiento.getId_establecimiento());
                interno.setIdEstablecimiento(idEstablecimiento);
            }
            em.persist(interno);
            if (idEstablecimiento != null) {
                idEstablecimiento.getInternosList().add(interno);
                idEstablecimiento = em.merge(idEstablecimiento);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Interno interno) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Interno persistentInterno = em.find(Interno.class, interno.getIdInterno());
            Establecimiento idEstablecimientoOld = persistentInterno.getIdEstablecimiento();
            Establecimiento idEstablecimientoNew = interno.getIdEstablecimiento();
            if (idEstablecimientoNew != null) {
                idEstablecimientoNew = em.getReference(idEstablecimientoNew.getClass(), idEstablecimientoNew.getId_establecimiento());
                interno.setIdEstablecimiento(idEstablecimientoNew);
            }
            interno = em.merge(interno);
            if (idEstablecimientoOld != null && !idEstablecimientoOld.equals(idEstablecimientoNew)) {
                idEstablecimientoOld.getInternosList().remove(interno);
                idEstablecimientoOld = em.merge(idEstablecimientoOld);
            }
            if (idEstablecimientoNew != null && !idEstablecimientoNew.equals(idEstablecimientoOld)) {
                idEstablecimientoNew.getInternosList().add(interno);
                idEstablecimientoNew = em.merge(idEstablecimientoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = interno.getIdInterno();
                if (findInterno(id) == null) {
                    throw new NonexistentEntityException("The interno with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Interno interno;
            try {
                interno = em.getReference(Interno.class, id);
                interno.getIdInterno();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The interno with id " + id + " no longer exists.", enfe);
            }
            Establecimiento idEstablecimiento = interno.getIdEstablecimiento();
            if (idEstablecimiento != null) {
                idEstablecimiento.getInternosList().remove(interno);
                idEstablecimiento = em.merge(idEstablecimiento);
            }
            em.remove(interno);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Interno> findInternoEntities() {
        return findInternoEntities(true, -1, -1);
    }

    public List<Interno> findInternoEntities(int maxResults, int firstResult) {
        return findInternoEntities(false, maxResults, firstResult);
    }

    private List<Interno> findInternoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Interno.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Interno findInterno(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Interno.class, id);
        } finally {
            em.close();
        }
    }

    public int getInternoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Interno> rt = cq.from(Interno.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
