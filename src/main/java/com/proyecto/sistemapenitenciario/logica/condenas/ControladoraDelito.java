package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.persistencia.condenas.ControladoraPersistenciaDelito;

public class ControladoraDelito {
    
    ControladoraPersistenciaDelito controlPersis = new ControladoraPersistenciaDelito();

    public Delito traerDelito(int idDelito) {
        return controlPersis.traerDelito(idDelito);
    }
    
}
