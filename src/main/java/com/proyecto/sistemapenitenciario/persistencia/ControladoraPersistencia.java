package com.proyecto.sistemapenitenciario.persistencia;

import com.proyecto.sistemapenitenciario.logica.Usuario;
import java.util.List;


public class ControladoraPersistencia {
    
    UsuarioJpaController usuJpa = new UsuarioJpaController();
    
    public void crearUsuario(Usuario usu){
        usuJpa.create(usu);
    }
    
    public List<Usuario> traerUsuarios(){
        return usuJpa.findUsuarioEntities();
    }
    
}
