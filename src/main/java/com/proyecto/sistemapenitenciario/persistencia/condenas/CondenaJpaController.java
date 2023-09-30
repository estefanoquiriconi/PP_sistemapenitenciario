/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.proyecto.sistemapenitenciario.logica.condenas.Delito;
import com.proyecto.sistemapenitenciario.logica.condenas.ReduccionCondenas;
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
public class CondenaJpaController implements Serializable {

    public CondenaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public CondenaJpaController() {
        emf = Persistence.createEntityManagerFactory("sistemapenitenciarioPU");
    }

    public void create(Condena condena) {
        if (condena.getReduccionCondenasList() == null) {
            condena.setReduccionCondenasList(new ArrayList<ReduccionCondenas>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Delito fkDelito = condena.getFkDelito();
            if (fkDelito != null) {
                fkDelito = em.getReference(fkDelito.getClass(), fkDelito.getIdDelito());
                condena.setFkDelito(fkDelito);
            }
            List<ReduccionCondenas> attachedReduccionCondenasList = new ArrayList<ReduccionCondenas>();
            for (ReduccionCondenas reduccionCondenasListReduccionCondenasToAttach : condena.getReduccionCondenasList()) {
                reduccionCondenasListReduccionCondenasToAttach = em.getReference(reduccionCondenasListReduccionCondenasToAttach.getClass(), reduccionCondenasListReduccionCondenasToAttach.getIdReduccion());
                attachedReduccionCondenasList.add(reduccionCondenasListReduccionCondenasToAttach);
            }
            condena.setReduccionCondenasList(attachedReduccionCondenasList);
            em.persist(condena);
            if (fkDelito != null) {
                fkDelito.getCondenaList().add(condena);
                fkDelito = em.merge(fkDelito);
            }
            for (ReduccionCondenas reduccionCondenasListReduccionCondenas : condena.getReduccionCondenasList()) {
                Condena oldFkCondenaOfReduccionCondenasListReduccionCondenas = reduccionCondenasListReduccionCondenas.getFkCondena();
                reduccionCondenasListReduccionCondenas.setFkCondena(condena);
                reduccionCondenasListReduccionCondenas = em.merge(reduccionCondenasListReduccionCondenas);
                if (oldFkCondenaOfReduccionCondenasListReduccionCondenas != null) {
                    oldFkCondenaOfReduccionCondenasListReduccionCondenas.getReduccionCondenasList().remove(reduccionCondenasListReduccionCondenas);
                    oldFkCondenaOfReduccionCondenasListReduccionCondenas = em.merge(oldFkCondenaOfReduccionCondenasListReduccionCondenas);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Condena condena) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Condena persistentCondena = em.find(Condena.class, condena.getIdCondena());
            Delito fkDelitoOld = persistentCondena.getFkDelito();
            Delito fkDelitoNew = condena.getFkDelito();
            List<ReduccionCondenas> reduccionCondenasListOld = persistentCondena.getReduccionCondenasList();
            List<ReduccionCondenas> reduccionCondenasListNew = condena.getReduccionCondenasList();
            if (fkDelitoNew != null) {
                fkDelitoNew = em.getReference(fkDelitoNew.getClass(), fkDelitoNew.getIdDelito());
                condena.setFkDelito(fkDelitoNew);
            }
            List<ReduccionCondenas> attachedReduccionCondenasListNew = new ArrayList<ReduccionCondenas>();
            for (ReduccionCondenas reduccionCondenasListNewReduccionCondenasToAttach : reduccionCondenasListNew) {
                reduccionCondenasListNewReduccionCondenasToAttach = em.getReference(reduccionCondenasListNewReduccionCondenasToAttach.getClass(), reduccionCondenasListNewReduccionCondenasToAttach.getIdReduccion());
                attachedReduccionCondenasListNew.add(reduccionCondenasListNewReduccionCondenasToAttach);
            }
            reduccionCondenasListNew = attachedReduccionCondenasListNew;
            condena.setReduccionCondenasList(reduccionCondenasListNew);
            condena = em.merge(condena);
            if (fkDelitoOld != null && !fkDelitoOld.equals(fkDelitoNew)) {
                fkDelitoOld.getCondenaList().remove(condena);
                fkDelitoOld = em.merge(fkDelitoOld);
            }
            if (fkDelitoNew != null && !fkDelitoNew.equals(fkDelitoOld)) {
                fkDelitoNew.getCondenaList().add(condena);
                fkDelitoNew = em.merge(fkDelitoNew);
            }
            for (ReduccionCondenas reduccionCondenasListOldReduccionCondenas : reduccionCondenasListOld) {
                if (!reduccionCondenasListNew.contains(reduccionCondenasListOldReduccionCondenas)) {
                    reduccionCondenasListOldReduccionCondenas.setFkCondena(null);
                    reduccionCondenasListOldReduccionCondenas = em.merge(reduccionCondenasListOldReduccionCondenas);
                }
            }
            for (ReduccionCondenas reduccionCondenasListNewReduccionCondenas : reduccionCondenasListNew) {
                if (!reduccionCondenasListOld.contains(reduccionCondenasListNewReduccionCondenas)) {
                    Condena oldFkCondenaOfReduccionCondenasListNewReduccionCondenas = reduccionCondenasListNewReduccionCondenas.getFkCondena();
                    reduccionCondenasListNewReduccionCondenas.setFkCondena(condena);
                    reduccionCondenasListNewReduccionCondenas = em.merge(reduccionCondenasListNewReduccionCondenas);
                    if (oldFkCondenaOfReduccionCondenasListNewReduccionCondenas != null && !oldFkCondenaOfReduccionCondenasListNewReduccionCondenas.equals(condena)) {
                        oldFkCondenaOfReduccionCondenasListNewReduccionCondenas.getReduccionCondenasList().remove(reduccionCondenasListNewReduccionCondenas);
                        oldFkCondenaOfReduccionCondenasListNewReduccionCondenas = em.merge(oldFkCondenaOfReduccionCondenasListNewReduccionCondenas);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = condena.getIdCondena();
                if (findCondena(id) == null) {
                    throw new NonexistentEntityException("The condena with id " + id + " no longer exists.");
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
            Condena condena;
            try {
                condena = em.getReference(Condena.class, id);
                condena.getIdCondena();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The condena with id " + id + " no longer exists.", enfe);
            }
            Delito fkDelito = condena.getFkDelito();
            if (fkDelito != null) {
                fkDelito.getCondenaList().remove(condena);
                fkDelito = em.merge(fkDelito);
            }
            List<ReduccionCondenas> reduccionCondenasList = condena.getReduccionCondenasList();
            for (ReduccionCondenas reduccionCondenasListReduccionCondenas : reduccionCondenasList) {
                reduccionCondenasListReduccionCondenas.setFkCondena(null);
                reduccionCondenasListReduccionCondenas = em.merge(reduccionCondenasListReduccionCondenas);
            }
            em.remove(condena);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Condena> findCondenaEntities() {
        return findCondenaEntities(true, -1, -1);
    }

    public List<Condena> findCondenaEntities(int maxResults, int firstResult) {
        return findCondenaEntities(false, maxResults, firstResult);
    }

    private List<Condena> findCondenaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Condena.class));
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

    public Condena findCondena(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Condena.class, id);
        } finally {
            em.close();
        }
    }

    public int getCondenaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Condena> rt = cq.from(Condena.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
