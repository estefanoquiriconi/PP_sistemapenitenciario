/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.sistemapenitenciario.logica.interno;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class FuncionesInternos {

    public static Date parseDate(String fechaString) throws ParseException {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("MM/DD/YYYY");
        Date fecha = null;
        try {
            fecha = formatoFecha.parse(fechaString);
        } catch (ParseException e) {
            throw new ParseException("Error al analizar la cadena como fecha.", e.getErrorOffset());
        }

        return fecha;
    }

    public static String obtenerLegajo(Interno inter) {
        return inter.getApellido().charAt(0) + "" + inter.getNombre().charAt(0) + ""
                + inter.getNumDoc().substring(inter.getNumDoc().length() - 3, inter.getNumDoc().length()) + ""
                + inter.getIdEstablecimiento().getId_establecimiento();
    }

    public static boolean fechaEnRango(String fechaStr, String fechaInicioStr, String fechaFinStr) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date fecha = dateFormat.parse(fechaStr);
        Date fechaInicio = dateFormat.parse(fechaInicioStr);
        Date fechaFin = dateFormat.parse(fechaFinStr);
        System.out.println(fecha + "///" + fechaInicio + "///" + fechaFin);
        return !fecha.before(fechaInicio) && !fecha.after(fechaFin) || fecha.equals(fechaInicio) || fecha.equals(fechaFin);
    }

    public static int ExisteInterno(List<Interno> internos, Interno newInterno) {
        int idInternoExistente = 0;
        for (Interno interno : internos) {
            if ((interno.getNumDoc().equals(newInterno.getNumDoc()))) {
                idInternoExistente = interno.getIdInterno();
            }
        }
        return idInternoExistente;
    }

    public static int sumarDias(String documento, List<Condena> condenas) {
        int dias = 0;
        for (Condena condena : condenas) {
            if (documento.equals(condena.getFkInterno().getNumDoc())) {
                dias += condena.getDuracionDias();
            }
        }

        return dias;
    }

}
