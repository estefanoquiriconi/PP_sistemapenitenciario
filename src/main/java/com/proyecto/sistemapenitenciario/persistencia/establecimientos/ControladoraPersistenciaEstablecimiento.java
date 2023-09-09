package com.proyecto.sistemapenitenciario.persistencia.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;

public class ControladoraPersistenciaEstablecimiento {
    
    EstablecimientoJpaController estJpa = new EstablecimientoJpaController();

    public void crearEstablecimiento(Establecimiento est) {
        estJpa.create(est);
    }
    
    
    
}
