package com.proyecto.sistemapenitenciario.logica.establecimiento;

import com.proyecto.sistemapenitenciario.persistencia.establecimientos.ControladoraPersistenciaEstablecimiento;

public class ControladoraEstablecimiento {
    
    ControladoraPersistenciaEstablecimiento controlPersis = new ControladoraPersistenciaEstablecimiento();

    public void crearEstablecimiento(Establecimiento est) {
        controlPersis.crearEstablecimiento(est);
    }
    
    
    
}
