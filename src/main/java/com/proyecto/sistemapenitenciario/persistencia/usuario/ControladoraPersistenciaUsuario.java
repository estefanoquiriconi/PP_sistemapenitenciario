package com.proyecto.sistemapenitenciario.persistencia.usuario;

import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import java.util.List;


public class ControladoraPersistenciaUsuario {
    
    UsuarioJpaController usuJpa = new UsuarioJpaController();
    
    public void crearUsuario(Usuario usu){
        usuJpa.create(usu);
    }
    
    public List<Usuario> traerUsuarios(){
        return usuJpa.findUsuarioEntities();
    }
    
}
