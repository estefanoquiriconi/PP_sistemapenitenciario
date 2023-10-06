package com.proyecto.sistemapenitenciario.persistencia.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.CondenaHistorial;
import java.util.List;

public class ControladoraPersistenciaHistorial {

    CondenaHistorialJpaController historialJpa = new CondenaHistorialJpaController();

    public List<CondenaHistorial> traerHistorial() {
        return historialJpa.findCondenaHistorialEntities();
    }

    public void cargarHistorial(CondenaHistorial condenaHistorial) {
        historialJpa.create(condenaHistorial);
    }

}
