/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.logica.interno;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class FuncionesInternos {

   
    
    
    
      public static Date parseDate(String fechaString) throws ParseException {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/mm/yyyy");
        Date fecha = null;
        try {
            fecha = formatoFecha.parse(fechaString);
        } catch (ParseException e) {
            throw new ParseException("Error al analizar la cadena como fecha.", e.getErrorOffset());
        }

        return fecha;
    }

    public static String obtenerLegajo(Interno inter) {
        return inter.getApellido().charAt(0) + "" +inter.getNombre().charAt(0)+ ""
                + inter.getNumDoc().substring(inter.getNumDoc().length() - 3, inter.getNumDoc().length()) + ""
                + inter.getIdEstablecimiento().getId_establecimiento();
    }
}
