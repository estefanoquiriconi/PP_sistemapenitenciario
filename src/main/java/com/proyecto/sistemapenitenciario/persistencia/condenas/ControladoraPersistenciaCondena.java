package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import java.util.List;


public class ControladoraPersistenciaCondena {
    
    CondenaJpaController condenaJpa = new CondenaJpaController();

    public void cargarCondena(Condena condena) {
        condenaJpa.create(condena);
    }

    public List<Condena> traerCondenas() {
        return condenaJpa.findCondenaEntities();
    }
    
}
