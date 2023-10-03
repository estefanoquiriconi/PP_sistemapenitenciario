package com.proyecto.sistemapenitenciario.logica.interno;

import com.proyecto.sistemapenitenciario.persistencia.interno.ControladoraPersistenciaInterno;
import java.util.List;

public class ControladoraInterno {
    
    ControladoraPersistenciaInterno controlPersis = new ControladoraPersistenciaInterno();

    public void crearInterno(Interno interno){
        controlPersis.crearInterno(interno);
    }
    public List<Interno> traerInternos() {
        return controlPersis.traerInternos();
    }

    public Interno traerInterno(Integer id) {
        return controlPersis.traerInterno(id);
    }
    
}
