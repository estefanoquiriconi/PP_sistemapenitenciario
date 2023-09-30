package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Delito;

public class ControladoraPersistenciaDelito {
    
    DelitoJpaController delitoJpa = new DelitoJpaController();

    public Delito traerDelito(int idDelito) {
        return delitoJpa.findDelito(idDelito);
    }
    
}
