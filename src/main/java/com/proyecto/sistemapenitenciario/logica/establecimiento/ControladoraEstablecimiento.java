package com.proyecto.sistemapenitenciario.logica.establecimiento;

import com.proyecto.sistemapenitenciario.persistencia.establecimientos.ControladoraPersistenciaEstablecimiento;
import java.util.List;

public class ControladoraEstablecimiento {
    
    ControladoraPersistenciaEstablecimiento controlPersis = new ControladoraPersistenciaEstablecimiento();

    public void crearEstablecimiento(Establecimiento est) {
        controlPersis.crearEstablecimiento(est);
    }

    public List<Establecimiento> traerEstablecimientos() {
        return controlPersis.traerEstablecimientos();
    }
    
    
    
}
