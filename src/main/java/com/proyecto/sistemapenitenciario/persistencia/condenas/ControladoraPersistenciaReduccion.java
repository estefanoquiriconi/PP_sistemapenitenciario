package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.ReduccionCondenas;
import java.util.List;

/**
 *
 * @author Estéfano
 */
public class ControladoraPersistenciaReduccion {
    
    ReduccionCondenasJpaController reduccionJpa = new ReduccionCondenasJpaController();

    public void cargarReduccion(ReduccionCondenas reduccion) {
        reduccionJpa.create(reduccion);
    }

    public List<ReduccionCondenas> traerReducciones() {
        return reduccionJpa.findReduccionCondenasEntities();
    }
    
    
}
