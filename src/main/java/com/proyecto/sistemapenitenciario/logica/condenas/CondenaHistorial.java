package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.logica.interno.Interno;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "condena_historial")
@NamedQueries({
    @NamedQuery(name = "CondenaHistorial.findAll", query = "SELECT c FROM CondenaHistorial c"),
    @NamedQuery(name = "CondenaHistorial.findByIdHistorial", query = "SELECT c FROM CondenaHistorial c WHERE c.idHistorial = :idHistorial"),
    @NamedQuery(name = "CondenaHistorial.findByCodCondena", query = "SELECT c FROM CondenaHistorial c WHERE c.codCondena = :codCondena"),
    @NamedQuery(name = "CondenaHistorial.findByFkInterno", query = "SELECT c FROM CondenaHistorial c WHERE c.fkInterno = :fkInterno"),
    @NamedQuery(name = "CondenaHistorial.findByFkDelito", query = "SELECT c FROM CondenaHistorial c WHERE c.fkDelito = :fkDelito"),
    @NamedQuery(name = "CondenaHistorial.findByJuez", query = "SELECT c FROM CondenaHistorial c WHERE c.juez = :juez"),
    @NamedQuery(name = "CondenaHistorial.findByFechaInicio", query = "SELECT c FROM CondenaHistorial c WHERE c.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "CondenaHistorial.findByDuracionDias", query = "SELECT c FROM CondenaHistorial c WHERE c.duracionDias = :duracionDias"),
    @NamedQuery(name = "CondenaHistorial.findByFechaFin", query = "SELECT c FROM CondenaHistorial c WHERE c.fechaFin = :fechaFin"),
    @NamedQuery(name = "CondenaHistorial.findByFechaDetencion", query = "SELECT c FROM CondenaHistorial c WHERE c.fechaDetencion = :fechaDetencion"),
    @NamedQuery(name = "CondenaHistorial.findByEstado", query = "SELECT c FROM CondenaHistorial c WHERE c.estado = :estado")})
public class CondenaHistorial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_historial")
    private Integer idHistorial;
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

    public CondenaHistorial() {
    }

    public CondenaHistorial(Integer idHistorial) {
        this.idHistorial = idHistorial;
    }

    public CondenaHistorial(Integer idHistorial, String codCondena) {
        this.idHistorial = idHistorial;
        this.codCondena = codCondena;
    }

    public Integer getIdHistorial() {
        return idHistorial;
    }

    public void setIdHistorial(Integer idHistorial) {
        this.idHistorial = idHistorial;
    }

    public String getCodCondena() {
        return codCondena;
    }

    public void setCodCondena(String codCondena) {
        this.codCondena = codCondena;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHistorial != null ? idHistorial.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CondenaHistorial)) {
            return false;
        }
        CondenaHistorial other = (CondenaHistorial) object;
        if ((this.idHistorial == null && other.idHistorial != null) || (this.idHistorial != null && !this.idHistorial.equals(other.idHistorial))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.proyecto.sistema_penitenciario.CondenaHistorial[ idHistorial=" + idHistorial + " ]";
    }
    
}
