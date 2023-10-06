package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.persistencia.condenas.ControladoraPersistenciaReduccion;
import java.util.List;

/**
 *
 * @author Estéfano
 */
public class ControladoraReduccion {
    
    ControladoraPersistenciaReduccion controlPersis = new ControladoraPersistenciaReduccion();

    public void cargarReduccion(ReduccionCondenas reduccion) {
        controlPersis.cargarReduccion(reduccion);
    }

    public List<ReduccionCondenas> traerReducciones() {
        return controlPersis.traerReducciones();
    }
    
}
