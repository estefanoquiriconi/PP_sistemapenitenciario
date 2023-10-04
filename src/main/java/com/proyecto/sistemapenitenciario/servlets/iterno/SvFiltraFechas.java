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
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvFiltraFechas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvFiltraFechas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Condena> listaCondenas = new ArrayList<>();
        listaCondenas = controlCondenas.traerCondenas();
        List<Interno> listaFiltradaFechas = new ArrayList<>();;
        Date fechaInicio=null;
        Date fechaFin=null;
        try {
            fechaInicio = FuncionesInternos.parseDate("fechaInicio");
            fechaFin = FuncionesInternos.parseDate("fechaFin");
        } catch (ParseException ex) {
            Logger.getLogger(SvFiltraFechas.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession misesion = request.getSession();
        for (Condena condenas : listaCondenas) {
            if (condenas.getFechaInicio().after(fechaInicio) && condenas.getFechaFin().before(fechaFin)) {
                listaFiltradaFechas.add(condenas.getFkInterno());

            }
        }
        misesion.setAttribute("listaInternos", listaFiltradaFechas);

        response.sendRedirect("pages_internos/mostrarInternos.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
