package com.proyecto.sistemapenitenciario.persistencia.usuario;

import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import com.proyecto.sistemapenitenciario.persistencia.exceptions.NonexistentEntityException;
import java.util.List;


public class ControladoraPersistenciaUsuario {
    
    UsuarioJpaController usuJpa = new UsuarioJpaController();
    
    public void crearUsuario(Usuario usu){
        usuJpa.create(usu);
    }
    
    public List<Usuario> traerUsuarios(){
        return usuJpa.findUsuarioEntities();
    }
  /*  public void UpdateUsuarios(){
        return usuJpa.
    }*/
    public void bajaLogicaUsuario(Usuario usuario) throws Exception {
        usuario.setEstado(false);
        usuJpa.edit(usuario);
        
    }

    public Usuario traerUsuario(int userId) {
     return  usuJpa.findUsuario(userId);
    }
public boolean ExistUser(String nombre){
    return usuJpa.ExistUser(nombre);
    
}
    public void modificar(Usuario user) throws Exception {
          usuJpa.edit(user);
          
    }
}
