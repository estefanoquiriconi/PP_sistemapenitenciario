/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.FuncionesInternos;

import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrador
 */
@WebServlet(name = "SvFiltraFechas", urlPatterns = {"/SvFiltraFechas"})
public class SvFiltraFechas extends HttpServlet {

    ControladoraInterno control = new ControladoraInterno();
    ControladoraCondena controlCondenas = new ControladoraCondena();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Condena> listaCondenas;
        listaCondenas = controlCondenas.traerCondenas();
        List<Interno> listaFiltradaFechas = new ArrayList<>();;
        String fechaInicio;
        String fechaFin;
        fechaInicio = (request.getParameter("fechaInicio"));
        fechaFin = (request.getParameter("fechaFin"));
        String fechaCondena;
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/YYYY");
        HttpSession misesion = request.getSession();
        for (Condena condenas : listaCondenas) {
            fechaCondena = formato.format(condenas.getFechaFin());

            try {
                if (FuncionesInternos.fechaEnRango(fechaCondena, fechaInicio, fechaFin)) {
                    listaFiltradaFechas.add(condenas.getFkInterno());
                    
                } else {
                }
            } catch (ParseException ex) {
                Logger.getLogger(SvFiltraFechas.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        misesion.setAttribute("fechaInicio", fechaInicio);
        misesion.setAttribute("fechaFin", fechaFin);
          misesion.setAttribute("mostrarFechas", true);
        misesion.setAttribute("listaInternos", listaFiltradaFechas);

        response.sendRedirect("pages_internos/mostrarInternos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
