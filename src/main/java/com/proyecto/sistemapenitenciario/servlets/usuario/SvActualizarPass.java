/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.usuario;

import com.proyecto.sistemapenitenciario.funciones.Hash;
import com.proyecto.sistemapenitenciario.logica.usuario.ControladoraUsuario;
import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import java.io.IOException;

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
@WebServlet(name = "SvActualizarPass", urlPatterns = {"/SvActualizarPass"})
public class SvActualizarPass extends HttpServlet {
        ControladoraUsuario control = new ControladoraUsuario();
  Hash hash= new Hash();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
      
        request.setCharacterEncoding("UTF-8");
        Usuario user = (Usuario) request.getSession().getAttribute("usuSession");
        user.setPassword(hash.generarHash(request.getParameter("password")));
        boolean resultadoValidacion = (Boolean.parseBoolean(request.getParameter("resultadoValidacion")));
        System.out.println(resultadoValidacion);
        if(resultadoValidacion){
        try {
            control.modificarUsuario(user);
            response.sendRedirect("index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(SvUsuarioEliminar.class.getName()).log(Level.SEVERE, null, ex);
        }}else{
            response.sendRedirect("Pages_Usuarios/cambiarPassword.jsp");
        }
        
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
