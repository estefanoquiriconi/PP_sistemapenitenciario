package com.proyecto.sistemapenitenciario.logica.interno;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
public class Interno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_interno")
    private Integer idInterno;
    @Size(max = 255)
    @Column(name = "legajo")
    private String legajo;
    @Size(max = 255)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 255)
    @Column(name = "apellido")
    private String apellido;
    @Column(name = "sexo")
    private Character sexo;
    @Size(max = 255)
    @Column(name = "apodo")
    private String apodo;
    @Column(name = "fecha_nac")
    @Temporal(TemporalType.DATE)
    private Date fechaNac;
    @Size(max = 255)
    @Column(name = "dpto_nac")
    private String dptoNac;
    @Size(max = 255)
    @Column(name = "pcia_nac")
    private String pciaNac;
    @Size(max = 255)
    @Column(name = "nacionalidad")
    private String nacionalidad;
    @Size(max = 255)
    @Column(name = "domicilio")
    private String domicilio;
    @Size(max = 255)
    @Column(name = "estado_civil")
    private String estadoCivil;
    @Size(max = 255)
    @Column(name = "profesion")
    private String profesion;
    @Size(max = 255)
    @Column(name = "tipo_doc")
    private String tipoDoc;
    @Size(max = 255)
    @Column(name = "num_doc")
    private String numDoc;
    @Column(name = "estado")
    private Boolean estado;
    @JoinColumn(name = "id_establecimiento", referencedColumnName = "id_establecimiento")
    @ManyToOne
    private Establecimiento idEstablecimiento;
    @Column(name = "fechaIngreso")
    @Temporal(TemporalType.DATE)
    private Date fechaIngreso;

  

    public Interno() {
    }
      public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso =fechaIngreso;
    }

    public Integer getIdInterno() {
        return idInterno;
    }

    public void setIdInterno(Integer idInterno) {
        this.idInterno = idInterno;
    }

    public String getLegajo() {
        return legajo;
    }

    public void setLegajo(String legajo) {
        this.legajo = legajo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Character getSexo() {
        return sexo;
    }

    public void setSexo(Character sexo) {
        this.sexo = sexo;
    }

    public String getApodo() {
        return apodo;
    }

    public void setApodo(String apodo) {
        this.apodo = apodo;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getDptoNac() {
        return dptoNac;
    }

    public void setDptoNac(String dptoNac) {
        this.dptoNac = dptoNac;
    }

    public String getPciaNac() {
        return pciaNac;
    }

    public void setPciaNac(String pciaNac) {
        
        this.pciaNac = pciaNac;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getTipoDoc() {
        return tipoDoc;
    }

    public void setTipoDoc(String tipoDoc) {
        this.tipoDoc = tipoDoc;
    }

    public String getNumDoc() {
        return numDoc;
    }

    public void setNumDoc(String numDoc) {
        this.numDoc = numDoc;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Establecimiento getIdEstablecimiento() {
        return idEstablecimiento;
    }

    public void setIdEstablecimiento(Establecimiento idEstablecimiento) {
        this.idEstablecimiento = idEstablecimiento;
    }

     
    @Override
    public String toString() {
        return "Interno{" + "idInterno=" + idInterno + ", legajo=" + legajo + ", nombre=" + nombre + ", apellido=" + apellido + ", sexo=" + sexo + ", apodo=" + apodo + ", fechaNac=" + fechaNac + ", dptoNac=" + dptoNac + ", pciaNac=" + pciaNac + ", nacionalidad=" + nacionalidad + ", domicilio=" + domicilio + ", estadoCivil=" + estadoCivil + ", profesion=" + profesion + ", tipoDoc=" + tipoDoc + ", numDoc=" + numDoc + ", estado=" + estado + ", idEstablecimiento=" + idEstablecimiento + ", fechaIngreso=" + fechaIngreso + '}';
    }

    
}
