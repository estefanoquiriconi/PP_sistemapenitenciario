/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.persistencia.interno;

import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.util.List;

/**
 *
 * @author Estéfano
 */
public class ControladoraPersistenciaInterno {
    
    InternoJpaController intJpa = new InternoJpaController();

    public void crearInterno(Interno interno){
        intJpa.create(interno);
    }
    public void editInterno(Interno interno) throws Exception{
        intJpa.edit(interno);
    }
    public List<Interno> traerInternos() {
        return intJpa.findInternoEntities();
    }

    public Interno traerInterno(Integer id) {
        return intJpa.findInterno(id);
    }
    public void eliminarInterno(Interno interno) throws Exception{
        interno.setEstado(false);
        intJpa.edit(interno);
        
    }
}
