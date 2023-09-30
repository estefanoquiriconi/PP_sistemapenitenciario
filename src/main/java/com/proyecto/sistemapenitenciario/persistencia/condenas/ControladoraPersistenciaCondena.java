package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ControladoraPersistenciaCondena {
    
    CondenaJpaController condenaJpa = new CondenaJpaController();

    public void cargarCondena(Condena condena) {
        condenaJpa.create(condena);
    }

    public List<Condena> traerCondenas() {
        return condenaJpa.findCondenaEntities();
    }

    public Condena traerCondena(int id) {
        return condenaJpa.findCondena(id);
    }

    public void desactivarCondena(Condena condena) {
        try {
            condenaJpa.edit(condena);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaCondena.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarCondena(Condena condena) {
        try {
            condenaJpa.edit(condena);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaCondena.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
