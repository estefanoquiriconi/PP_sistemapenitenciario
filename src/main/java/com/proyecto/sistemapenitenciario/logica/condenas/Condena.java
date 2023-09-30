package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "condena")
@NamedQueries({
    @NamedQuery(name = "Condena.findAll", query = "SELECT c FROM Condena c"),
    @NamedQuery(name = "Condena.findByIdCondena", query = "SELECT c FROM Condena c WHERE c.idCondena = :idCondena"),
    @NamedQuery(name = "Condena.findByCodCondena", query = "SELECT c FROM Condena c WHERE c.codCondena = :codCondena"),
    @NamedQuery(name = "Condena.findByJuez", query = "SELECT c FROM Condena c WHERE c.juez = :juez"),
    @NamedQuery(name = "Condena.findByFechaInicio", query = "SELECT c FROM Condena c WHERE c.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Condena.findByDuracionDias", query = "SELECT c FROM Condena c WHERE c.duracionDias = :duracionDias"),
    @NamedQuery(name = "Condena.findByFechaFin", query = "SELECT c FROM Condena c WHERE c.fechaFin = :fechaFin"),
    @NamedQuery(name = "Condena.findByFechaDetencion", query = "SELECT c FROM Condena c WHERE c.fechaDetencion = :fechaDetencion"),
    @NamedQuery(name = "Condena.findByEstado", query = "SELECT c FROM Condena c WHERE c.estado = :estado")})
public class Condena implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_condena")
    private Integer idCondena;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cod_condena")
    private String codCondena;
    @Size(max = 255)
    @Column(name = "juez")
    private String juez;
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "duracion_dias")
    private Integer duracionDias;
    @Column(name = "fecha_fin")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    @Column(name = "fecha_detencion")
    @Temporal(TemporalType.DATE)
    private Date fechaDetencion;
    @Column(name = "estado")
    private Boolean estado;
    @JoinColumn(name = "fk_interno", referencedColumnName = "id_interno")
    @ManyToOne
    private Interno fkInterno;
    @JoinColumn(name = "fk_delito", referencedColumnName = "id_delito")
    @ManyToOne
    private Delito fkDelito;
    @OneToMany(mappedBy = "fkCondena")
    private List<ReduccionCondenas> reduccionCondenasList;

    public Condena() {
    }

    public Condena(Integer idCondena) {
        this.idCondena = idCondena;
    }

    public Condena(Integer idCondena, String codCondena) {
        this.idCondena = idCondena;
        this.codCondena = codCondena;
    }

    public Integer getIdCondena() {
        return idCondena;
    }

    public void setIdCondena(Integer idCondena) {
        this.idCondena = idCondena;
    }

    public String getCodCondena() {
        return codCondena;
    }

    public void setCodCondena(String codCondena) {
        this.codCondena = codCondena;
    }

    public String getJuez() {
        return juez;
    }

    public void setJuez(String juez) {
        this.juez = juez;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Integer getDuracionDias() {
        return duracionDias;
    }

    public void setDuracionDias(Integer duracionDias) {
        this.duracionDias = duracionDias;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Date getFechaDetencion() {
        return fechaDetencion;
    }

    public void setFechaDetencion(Date fechaDetencion) {
        this.fechaDetencion = fechaDetencion;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Interno getFkInterno() {
        return fkInterno;
    }

    public void setFkInterno(Interno fkInterno) {
        this.fkInterno = fkInterno;
    }

    public Delito getFkDelito() {
        return fkDelito;
    }

    public void setFkDelito(Delito fkDelito) {
        this.fkDelito = fkDelito;
    }

    public List<ReduccionCondenas> getReduccionCondenasList() {
        return reduccionCondenasList;
    }

    public void setReduccionCondenasList(List<ReduccionCondenas> reduccionCondenasList) {
        this.reduccionCondenasList = reduccionCondenasList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCondena != null ? idCondena.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Condena)) {
            return false;
        }
        Condena other = (Condena) object;
        if ((this.idCondena == null && other.idCondena != null) || (this.idCondena != null && !this.idCondena.equals(other.idCondena))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.proyecto.sistema_penitenciario.Condena[ idCondena=" + idCondena + " ]";
    }
    
}
