package com.proyecto.sistemapenitenciario.logica.condenas;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "delito")
@NamedQueries({
    @NamedQuery(name = "Delito.findAll", query = "SELECT d FROM Delito d"),
    @NamedQuery(name = "Delito.findByIdDelito", query = "SELECT d FROM Delito d WHERE d.idDelito = :idDelito"),
    @NamedQuery(name = "Delito.findByDescripcion", query = "SELECT d FROM Delito d WHERE d.descripcion = :descripcion")})
public class Delito implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_delito")
    private Integer idDelito;
    @Size(max = 255)
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(mappedBy = "fkDelito")
    private List<Condena> condenaList;

    public Delito() {
    }

    public Delito(Integer idDelito) {
        this.idDelito = idDelito;
    }

    public Integer getIdDelito() {
        return idDelito;
    }

    public void setIdDelito(Integer idDelito) {
        this.idDelito = idDelito;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<Condena> getCondenaList() {
        return condenaList;
    }

    public void setCondenaList(List<Condena> condenaList) {
        this.condenaList = condenaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDelito != null ? idDelito.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Delito)) {
            return false;
        }
        Delito other = (Delito) object;
        if ((this.idDelito == null && other.idDelito != null) || (this.idDelito != null && !this.idDelito.equals(other.idDelito))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.proyecto.sistema_penitenciario.Delito[ idDelito=" + idDelito + " ]";
    }
    
}
