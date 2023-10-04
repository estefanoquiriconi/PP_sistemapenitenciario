/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import com.proyecto.sistemapenitenciario.servlets.usuario.SvUsuarioEliminar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
@WebServlet(name = "SvEliminarInternos", urlPatterns = {"/SvEliminarInternos"})
public class SvEliminarInternos extends HttpServlet {
ControladoraInterno control = new ControladoraInterno();
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEliminarInternos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEliminarInternos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     int idEliminar = Integer.parseInt(request.getParameter("interEliminar"));
     
     Interno interEliminar = control.traerInterno(idEliminar);
        request.getSession().setAttribute("interEliminar", interEliminar);
        response.sendRedirect("pages_internos/bajaInternos.jsp");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      Interno interno = (Interno) request.getSession().getAttribute("interEliminar");
    try {
        control.bajaLogica(interno);
           response.sendRedirect("SvInternos");
    } catch (Exception ex) {
        Logger.getLogger(SvUsuarioEliminar.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
