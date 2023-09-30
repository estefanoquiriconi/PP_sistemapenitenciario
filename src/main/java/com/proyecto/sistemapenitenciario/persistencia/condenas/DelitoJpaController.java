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
import com.proyecto.sistemapenitenciario.logica.condenas.Delito;
import com.proyecto.sistemapenitenciario.persistencia.condenas.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Estéfano
 */
public class DelitoJpaController implements Serializable {

    public DelitoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public DelitoJpaController() {
        emf = Persistence.createEntityManagerFactory("sistemapenitenciarioPU");
    }

    public void create(Delito delito) {
        if (delito.getCondenaList() == null) {
            delito.setCondenaList(new ArrayList<Condena>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Condena> attachedCondenaList = new ArrayList<Condena>();
            for (Condena condenaListCondenaToAttach : delito.getCondenaList()) {
                condenaListCondenaToAttach = em.getReference(condenaListCondenaToAttach.getClass(), condenaListCondenaToAttach.getIdCondena());
                attachedCondenaList.add(condenaListCondenaToAttach);
            }
            delito.setCondenaList(attachedCondenaList);
            em.persist(delito);
            for (Condena condenaListCondena : delito.getCondenaList()) {
                Delito oldFkDelitoOfCondenaListCondena = condenaListCondena.getFkDelito();
                condenaListCondena.setFkDelito(delito);
                condenaListCondena = em.merge(condenaListCondena);
                if (oldFkDelitoOfCondenaListCondena != null) {
                    oldFkDelitoOfCondenaListCondena.getCondenaList().remove(condenaListCondena);
                    oldFkDelitoOfCondenaListCondena = em.merge(oldFkDelitoOfCondenaListCondena);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Delito delito) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Delito persistentDelito = em.find(Delito.class, delito.getIdDelito());
            List<Condena> condenaListOld = persistentDelito.getCondenaList();
            List<Condena> condenaListNew = delito.getCondenaList();
            List<Condena> attachedCondenaListNew = new ArrayList<Condena>();
            for (Condena condenaListNewCondenaToAttach : condenaListNew) {
                condenaListNewCondenaToAttach = em.getReference(condenaListNewCondenaToAttach.getClass(), condenaListNewCondenaToAttach.getIdCondena());
                attachedCondenaListNew.add(condenaListNewCondenaToAttach);
            }
            condenaListNew = attachedCondenaListNew;
            delito.setCondenaList(condenaListNew);
            delito = em.merge(delito);
            for (Condena condenaListOldCondena : condenaListOld) {
                if (!condenaListNew.contains(condenaListOldCondena)) {
                    condenaListOldCondena.setFkDelito(null);
                    condenaListOldCondena = em.merge(condenaListOldCondena);
                }
            }
            for (Condena condenaListNewCondena : condenaListNew) {
                if (!condenaListOld.contains(condenaListNewCondena)) {
                    Delito oldFkDelitoOfCondenaListNewCondena = condenaListNewCondena.getFkDelito();
                    condenaListNewCondena.setFkDelito(delito);
                    condenaListNewCondena = em.merge(condenaListNewCondena);
                    if (oldFkDelitoOfCondenaListNewCondena != null && !oldFkDelitoOfCondenaListNewCondena.equals(delito)) {
                        oldFkDelitoOfCondenaListNewCondena.getCondenaList().remove(condenaListNewCondena);
                        oldFkDelitoOfCondenaListNewCondena = em.merge(oldFkDelitoOfCondenaListNewCondena);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = delito.getIdDelito();
                if (findDelito(id) == null) {
                    throw new NonexistentEntityException("The delito with id " + id + " no longer exists.");
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
            Delito delito;
            try {
                delito = em.getReference(Delito.class, id);
                delito.getIdDelito();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The delito with id " + id + " no longer exists.", enfe);
            }
            List<Condena> condenaList = delito.getCondenaList();
            for (Condena condenaListCondena : condenaList) {
                condenaListCondena.setFkDelito(null);
                condenaListCondena = em.merge(condenaListCondena);
            }
            em.remove(delito);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Delito> findDelitoEntities() {
        return findDelitoEntities(true, -1, -1);
    }

    public List<Delito> findDelitoEntities(int maxResults, int firstResult) {
        return findDelitoEntities(false, maxResults, firstResult);
    }

    private List<Delito> findDelitoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Delito.class));
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

    public Delito findDelito(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Delito.class, id);
        } finally {
            em.close();
        }
    }

    public int getDelitoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Delito> rt = cq.from(Delito.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
