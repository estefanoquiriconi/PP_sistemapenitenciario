package com.proyecto.sistemapenitenciario.persistencia.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistenciaEstablecimiento {
    
    EstablecimientoJpaController estJpa = new EstablecimientoJpaController();

    public void crearEstablecimiento(Establecimiento est) {
        System.out.println("DESDE CONTROLADORAPERSIS: " + est.getNombre());
        estJpa.create(est);
    }

    public List<Establecimiento> traerEstablecimientos() {
        return estJpa.findEstablecimientoEntities();
    }

    public Establecimiento traerEstablecimiento(int id) {
        return estJpa.findEstablecimiento(id);
    }

    public void elimiarEstablecimiento(Establecimiento est) {
        try {
            estJpa.edit(est);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaEstablecimiento.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarEstablecimiento(Establecimiento est) {
        try {
            estJpa.edit(est);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaEstablecimiento.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
