/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import com.proyecto.sistemapenitenciario.persistencia.condenas.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Estéfano
 */
public class EstablecimientoJpaController implements Serializable {

    public EstablecimientoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Establecimiento establecimiento) {
        if (establecimiento.getInternosList() == null) {
            establecimiento.setInternosList(new ArrayList<Interno>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Interno> attachedInternosList = new ArrayList<Interno>();
            for (Interno internosListInternoToAttach : establecimiento.getInternosList()) {
                internosListInternoToAttach = em.getReference(internosListInternoToAttach.getClass(), internosListInternoToAttach.getIdInterno());
                attachedInternosList.add(internosListInternoToAttach);
            }
            establecimiento.setInternosList(attachedInternosList);
            em.persist(establecimiento);
            for (Interno internosListInterno : establecimiento.getInternosList()) {
                Establecimiento oldIdEstablecimientoOfInternosListInterno = internosListInterno.getIdEstablecimiento();
                internosListInterno.setIdEstablecimiento(establecimiento);
                internosListInterno = em.merge(internosListInterno);
                if (oldIdEstablecimientoOfInternosListInterno != null) {
                    oldIdEstablecimientoOfInternosListInterno.getInternosList().remove(internosListInterno);
                    oldIdEstablecimientoOfInternosListInterno = em.merge(oldIdEstablecimientoOfInternosListInterno);
                }
            }
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
            Establecimiento persistentEstablecimiento = em.find(Establecimiento.class, establecimiento.getId_establecimiento());
            List<Interno> internosListOld = persistentEstablecimiento.getInternosList();
            List<Interno> internosListNew = establecimiento.getInternosList();
            List<Interno> attachedInternosListNew = new ArrayList<Interno>();
            for (Interno internosListNewInternoToAttach : internosListNew) {
                internosListNewInternoToAttach = em.getReference(internosListNewInternoToAttach.getClass(), internosListNewInternoToAttach.getIdInterno());
                attachedInternosListNew.add(internosListNewInternoToAttach);
            }
            internosListNew = attachedInternosListNew;
            establecimiento.setInternosList(internosListNew);
            establecimiento = em.merge(establecimiento);
            for (Interno internosListOldInterno : internosListOld) {
                if (!internosListNew.contains(internosListOldInterno)) {
                    internosListOldInterno.setIdEstablecimiento(null);
                    internosListOldInterno = em.merge(internosListOldInterno);
                }
            }
            for (Interno internosListNewInterno : internosListNew) {
                if (!internosListOld.contains(internosListNewInterno)) {
                    Establecimiento oldIdEstablecimientoOfInternosListNewInterno = internosListNewInterno.getIdEstablecimiento();
                    internosListNewInterno.setIdEstablecimiento(establecimiento);
                    internosListNewInterno = em.merge(internosListNewInterno);
                    if (oldIdEstablecimientoOfInternosListNewInterno != null && !oldIdEstablecimientoOfInternosListNewInterno.equals(establecimiento)) {
                        oldIdEstablecimientoOfInternosListNewInterno.getInternosList().remove(internosListNewInterno);
                        oldIdEstablecimientoOfInternosListNewInterno = em.merge(oldIdEstablecimientoOfInternosListNewInterno);
                    }
                }
            }
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
            List<Interno> internosList = establecimiento.getInternosList();
            for (Interno internosListInterno : internosList) {
                internosListInterno.setIdEstablecimiento(null);
                internosListInterno = em.merge(internosListInterno);
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
