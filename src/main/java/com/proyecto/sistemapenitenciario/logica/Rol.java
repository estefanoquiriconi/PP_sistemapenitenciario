package com.proyecto.sistemapenitenciario.logica;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Rol {
    
    @Id
    private int id_rol;
    private String descripcion;

    public Rol() {
    }

    public Rol(int id_rol, String descripcion) {
        this.id_rol = id_rol;
        this.descripcion = descripcion;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
