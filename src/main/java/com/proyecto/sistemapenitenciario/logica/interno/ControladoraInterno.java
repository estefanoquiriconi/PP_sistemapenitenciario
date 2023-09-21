package com.proyecto.sistemapenitenciario.logica.interno;

import com.proyecto.sistemapenitenciario.persistencia.interno.ControladoraPersistenciaInterno;
import java.util.List;

public class ControladoraInterno {
    
    ControladoraPersistenciaInterno controlPersis = new ControladoraPersistenciaInterno();

    public List<Interno> traerInternos() {
        return controlPersis.traerInternos();
    }
    
}
