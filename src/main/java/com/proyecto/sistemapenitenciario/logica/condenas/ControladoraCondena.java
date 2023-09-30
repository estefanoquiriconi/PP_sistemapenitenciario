package com.proyecto.sistemapenitenciario.logica.condenas;

import com.proyecto.sistemapenitenciario.persistencia.condenas.ControladoraPersistenciaCondena;
import java.util.List;

public class ControladoraCondena {
    
    ControladoraPersistenciaCondena controlPersis = new ControladoraPersistenciaCondena();

    public void cargarCondena(Condena condena) {
        controlPersis.cargarCondena(condena);
    }

    public List<Condena> traerCondenas() {
        return controlPersis.traerCondenas();
    }

    public Condena traerCondena(int id) {
        return controlPersis.traerCondena(id);
    }

    public void DesactivarCondena(Condena condena) {
        controlPersis.desactivarCondena(condena);
    }

    public void editarCondena(Condena condena) {
        controlPersis.editarCondena(condena);
    }

    
}
