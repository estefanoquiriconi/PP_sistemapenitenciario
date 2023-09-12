package com.proyecto.sistemapenitenciario.logica.usuario;

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
  /*  public void UpdateUsuario(){
        return controlPersis.
    }*/

    public Usuario traerUsuario(int userId) {
        return controlPersis.traerUsuario(userId);
    }

    public void borrarUsuario(Usuario user) throws Exception {
        controlPersis.bajaLogicaUsuario(user);
    }

    
    public void modificarUsuario(Usuario user) throws Exception {
        controlPersis.modificar(user);
    }
public boolean ExisteUsuario(String nombre){
    return controlPersis.ExistUser(nombre);
}
 
}
