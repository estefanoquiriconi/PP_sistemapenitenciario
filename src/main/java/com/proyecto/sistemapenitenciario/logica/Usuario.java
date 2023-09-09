package com.proyecto.sistemapenitenciario.logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_usuario;
    private String nombre;
    private String password;
    private int rol;
    private boolean estado;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String password, int rol, boolean estado) {
        this.id_usuario = id;
        this.nombre = nombre;
        this.password = password;
        this.rol = rol;
        this.estado = estado;
    }

    public int getId() {
        return id_usuario;
    }

    public void setId(int id) {
        this.id_usuario = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String name) {
        this.nombre = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRol() {
        return rol;
    }
    
    public String getRolString() {
        switch (rol) {
            case 1: return "Administrador";
            case 2: return "Director";
            case 3: return "Administrativo";
            case 4: return "Agente";
            default:
                throw new AssertionError();
        }
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean state) {
        this.estado = state;
    }
    
}