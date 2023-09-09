package com.proyecto.sistemapenitenciario.persistencia.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.util.List;

public class ControladoraPersistenciaEstablecimiento {
    
    EstablecimientoJpaController estJpa = new EstablecimientoJpaController();

    public void crearEstablecimiento(Establecimiento est) {
        estJpa.create(est);
    }

    public List<Establecimiento> traerEstablecimientos() {
        return estJpa.findEstablecimientoEntities();
    }
    
    
    
}
