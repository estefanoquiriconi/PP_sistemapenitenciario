/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.FuncionesInternos;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
@WebServlet(name = "SvMoodificarInterno", urlPatterns = {"/SvMoodificarInterno"})
public class SvMoodificarInterno extends HttpServlet {
    
    ControladoraInterno control = new ControladoraInterno();
    ControladoraEstablecimiento controlEstablecimientos = new ControladoraEstablecimiento();

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
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Establecimiento> est = controlEstablecimientos.traerEstablecimientos();
        int interId = Integer.parseInt(request.getParameter("modificar"));
        Interno inter = control.traerInterno(interId);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("interModificar", inter);
        misesion.setAttribute("listaEstablecimientos", est);
        response.sendRedirect("pages_internos/modificarInternos.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Interno interno = (Interno) request.getSession().getAttribute("interModificar");
        boolean resultadoValidacion = Boolean.parseBoolean(request.getParameter("resultadoValidacion"));
        
        interno.setNumDoc(request.getParameter("dni"));
        interno.setNombre(request.getParameter("nombre"));
        interno.setApellido(request.getParameter("apellido"));
        interno.setApodo(request.getParameter("apodo"));
        interno.setSexo(Character.toUpperCase(request.getParameter("sexo").charAt(0)));
        
        try {
            interno.setFechaNac(FuncionesInternos.parseDate(request.getParameter("fechaNac")));
            interno.setFechaIngreso(FuncionesInternos.parseDate(request.getParameter("fechaIngreso")));
        } catch (ParseException ex) {
            Logger.getLogger(SvInternos.class.getName()).log(Level.SEVERE, null, ex);
        }
        interno.setPciaNac(request.getParameter("provincia"));
        interno.setNacionalidad(request.getParameter("nacionalidad"));
        interno.setDptoNac(request.getParameter("dpto_nac"));
        interno.setDomicilio(request.getParameter("domicilio"));
        interno.setProfesion(request.getParameter("profesion"));
        interno.setTipoDoc(request.getParameter("tipoDoc"));
        interno.setEstadoCivil(request.getParameter("estCivil"));
        Establecimiento est = controlEstablecimientos.traerEstablecimeinto(Integer.parseInt(request.getParameter("establecimientos")));
        interno.setIdEstablecimiento(est);
        interno.setEstado(true);
        
        if (resultadoValidacion) {
            try {
                control.modificarInterno(interno);
            } catch (Exception ex) {
                Logger.getLogger(SvMoodificarInterno.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("pages_interno/modificarInternos.jsp");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
