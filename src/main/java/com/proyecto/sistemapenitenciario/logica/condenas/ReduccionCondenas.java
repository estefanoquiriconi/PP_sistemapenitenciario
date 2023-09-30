package com.proyecto.sistemapenitenciario.logica.condenas;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name = "reduccion_condenas")
@NamedQueries({
    @NamedQuery(name = "ReduccionCondenas.findAll", query = "SELECT r FROM ReduccionCondenas r"),
    @NamedQuery(name = "ReduccionCondenas.findByIdReduccion", query = "SELECT r FROM ReduccionCondenas r WHERE r.idReduccion = :idReduccion"),
    @NamedQuery(name = "ReduccionCondenas.findByMotivoReduccion", query = "SELECT r FROM ReduccionCondenas r WHERE r.motivoReduccion = :motivoReduccion"),
    @NamedQuery(name = "ReduccionCondenas.findByTiempoDias", query = "SELECT r FROM ReduccionCondenas r WHERE r.tiempoDias = :tiempoDias"),
    @NamedQuery(name = "ReduccionCondenas.findByFechaReduccion", query = "SELECT r FROM ReduccionCondenas r WHERE r.fechaReduccion = :fechaReduccion")})
public class ReduccionCondenas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_reduccion")
    private Long idReduccion;
    @Size(max = 255)
    @Column(name = "motivo_reduccion")
    private String motivoReduccion;
    @Column(name = "tiempo_dias")
    private Integer tiempoDias;
    @Column(name = "fecha_reduccion")
    @Temporal(TemporalType.DATE)
    private Date fechaReduccion;
    @JoinColumn(name = "fk_condena", referencedColumnName = "id_condena")
    @ManyToOne
    private Condena fkCondena;

    public ReduccionCondenas() {
    }

    public ReduccionCondenas(Long idReduccion) {
        this.idReduccion = idReduccion;
    }

    public Long getIdReduccion() {
        return idReduccion;
    }

    public void setIdReduccion(Long idReduccion) {
        this.idReduccion = idReduccion;
    }

    public String getMotivoReduccion() {
        return motivoReduccion;
    }

    public void setMotivoReduccion(String motivoReduccion) {
        this.motivoReduccion = motivoReduccion;
    }

    public Integer getTiempoDias() {
        return tiempoDias;
    }

    public void setTiempoDias(Integer tiempoDias) {
        this.tiempoDias = tiempoDias;
    }

    public Date getFechaReduccion() {
        return fechaReduccion;
    }

    public void setFechaReduccion(Date fechaReduccion) {
        this.fechaReduccion = fechaReduccion;
    }

    public Condena getFkCondena() {
        return fkCondena;
    }

    public void setFkCondena(Condena fkCondena) {
        this.fkCondena = fkCondena;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReduccion != null ? idReduccion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReduccionCondenas)) {
            return false;
        }
        ReduccionCondenas other = (ReduccionCondenas) object;
        if ((this.idReduccion == null && other.idReduccion != null) || (this.idReduccion != null && !this.idReduccion.equals(other.idReduccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.proyecto.sistema_penitenciario.ReduccionCondenas[ idReduccion=" + idReduccion + " ]";
    }
    
}
