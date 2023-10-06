package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.persistencia.condenas.ControladoraPersistenciaHistorial;
import java.util.List;


public class ControladoraCondenaHistorial {
    
    ControladoraPersistenciaHistorial controlPersis = new ControladoraPersistenciaHistorial();

    public List<CondenaHistorial> traerHistorial() {
        return controlPersis.traerHistorial();
    }

    public void cargarHistorial(CondenaHistorial condenaHistorial) {
        controlPersis.cargarHistorial(condenaHistorial);
    }
    
}
