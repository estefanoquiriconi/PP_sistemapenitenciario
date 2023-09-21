package com.proyecto.sistemapenitenciario.logica.establecimiento;

import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Establecimiento implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_establecimiento;
    private String nombre;
    private String ciudad;
    private int capacidad;
    private String direccion;
    private String telefono;
    private boolean estado;
    @OneToMany(mappedBy = "idEstablecimiento")
    private List<Interno> internosList;

    public Establecimiento() {
    }

    public Establecimiento(int id_establecimiento, String nombre, String ciudad, int capacidad, String direccion, String telefono, boolean estado, List<Interno> internosList) {
        this.id_establecimiento = id_establecimiento;
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.capacidad = capacidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.estado = estado;
        this.internosList = internosList;
    }

    public int getId_establecimiento() {
        return id_establecimiento;
    }

    public void setId_establecimiento(int id_establecimiento) {
        this.id_establecimiento = id_establecimiento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public List<Interno> getInternosList() {
        return internosList;
    }

    public void setInternosList(List<Interno> internosList) {
        this.internosList = internosList;
    }

}
