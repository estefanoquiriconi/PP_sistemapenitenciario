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
import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ReduccionCondenas;
import com.proyecto.sistemapenitenciario.persistencia.condenas.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Estéfano
 */
public class ReduccionCondenasJpaController implements Serializable {

    public ReduccionCondenasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ReduccionCondenas reduccionCondenas) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Condena fkCondena = reduccionCondenas.getFkCondena();
            if (fkCondena != null) {
                fkCondena = em.getReference(fkCondena.getClass(), fkCondena.getIdCondena());
                reduccionCondenas.setFkCondena(fkCondena);
            }
            em.persist(reduccionCondenas);
            if (fkCondena != null) {
                fkCondena.getReduccionCondenasList().add(reduccionCondenas);
                fkCondena = em.merge(fkCondena);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ReduccionCondenas reduccionCondenas) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ReduccionCondenas persistentReduccionCondenas = em.find(ReduccionCondenas.class, reduccionCondenas.getIdReduccion());
            Condena fkCondenaOld = persistentReduccionCondenas.getFkCondena();
            Condena fkCondenaNew = reduccionCondenas.getFkCondena();
            if (fkCondenaNew != null) {
                fkCondenaNew = em.getReference(fkCondenaNew.getClass(), fkCondenaNew.getIdCondena());
                reduccionCondenas.setFkCondena(fkCondenaNew);
            }
            reduccionCondenas = em.merge(reduccionCondenas);
            if (fkCondenaOld != null && !fkCondenaOld.equals(fkCondenaNew)) {
                fkCondenaOld.getReduccionCondenasList().remove(reduccionCondenas);
                fkCondenaOld = em.merge(fkCondenaOld);
            }
            if (fkCondenaNew != null && !fkCondenaNew.equals(fkCondenaOld)) {
                fkCondenaNew.getReduccionCondenasList().add(reduccionCondenas);
                fkCondenaNew = em.merge(fkCondenaNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = reduccionCondenas.getIdReduccion();
                if (findReduccionCondenas(id) == null) {
                    throw new NonexistentEntityException("The reduccionCondenas with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ReduccionCondenas reduccionCondenas;
            try {
                reduccionCondenas = em.getReference(ReduccionCondenas.class, id);
                reduccionCondenas.getIdReduccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The reduccionCondenas with id " + id + " no longer exists.", enfe);
            }
            Condena fkCondena = reduccionCondenas.getFkCondena();
            if (fkCondena != null) {
                fkCondena.getReduccionCondenasList().remove(reduccionCondenas);
                fkCondena = em.merge(fkCondena);
            }
            em.remove(reduccionCondenas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ReduccionCondenas> findReduccionCondenasEntities() {
        return findReduccionCondenasEntities(true, -1, -1);
    }

    public List<ReduccionCondenas> findReduccionCondenasEntities(int maxResults, int firstResult) {
        return findReduccionCondenasEntities(false, maxResults, firstResult);
    }

    private List<ReduccionCondenas> findReduccionCondenasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ReduccionCondenas.class));
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

    public ReduccionCondenas findReduccionCondenas(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ReduccionCondenas.class, id);
        } finally {
            em.close();
        }
    }

    public int getReduccionCondenasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ReduccionCondenas> rt = cq.from(ReduccionCondenas.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
