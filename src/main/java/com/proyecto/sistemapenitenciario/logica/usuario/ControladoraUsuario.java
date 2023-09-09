package com.proyecto.sistemapenitenciario.logica.usuario;

import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import com.proyecto.sistemapenitenciario.persistencia.usuario.ControladoraPersistenciaUsuario;
import java.util.List;

public class ControladoraUsuario {
    
    ControladoraPersistenciaUsuario controlPersis = new ControladoraPersistenciaUsuario();
    
    public void crearUsuario(Usuario usu){
        controlPersis.crearUsuario(usu);
    }
    
    public List<Usuario> traerUsuarios(){
        return controlPersis.traerUsuarios();
    }
    
    
}
