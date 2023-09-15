/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.persistencia.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import com.proyecto.sistemapenitenciario.persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class EstablecimientoJpaController implements Serializable {

    public EstablecimientoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public EstablecimientoJpaController() {
        emf = Persistence.createEntityManagerFactory("sistemapenitenciarioPU");
    }

    public void create(Establecimiento establecimiento) {
        System.out.println("DESDE PERSISTENCIA: " + establecimiento.getNombre());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(establecimiento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Establecimiento establecimiento) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            establecimiento = em.merge(establecimiento);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = establecimiento.getId_establecimiento();
                if (findEstablecimiento(id) == null) {
                    throw new NonexistentEntityException("The establecimiento with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Establecimiento establecimiento;
            try {
                establecimiento = em.getReference(Establecimiento.class, id);
                establecimiento.getId_establecimiento();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The establecimiento with id " + id + " no longer exists.", enfe);
            }
            em.remove(establecimiento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Establecimiento> findEstablecimientoEntities() {
        return findEstablecimientoEntities(true, -1, -1);
    }

    public List<Establecimiento> findEstablecimientoEntities(int maxResults, int firstResult) {
        return findEstablecimientoEntities(false, maxResults, firstResult);
    }

    private List<Establecimiento> findEstablecimientoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Establecimiento.class));
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

    public Establecimiento findEstablecimiento(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Establecimiento.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstablecimientoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Establecimiento> rt = cq.from(Establecimiento.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
