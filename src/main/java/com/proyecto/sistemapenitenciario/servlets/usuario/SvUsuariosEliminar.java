/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.usuario;

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
 * 
 */


@WebServlet(name = "SvUsuarioEliminar", urlPatterns = {"/SvUsuarioEliminar"})
public class SvUsuariosEliminar extends HttpServlet {
ControladoraUsuario control = new ControladoraUsuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("eliminar"));
        Usuario user = control.traerUsuario(userId);
    try {
        control.borrarUsuario(user);
           response.sendRedirect("index.jsp");
    } catch (Exception ex) {
        Logger.getLogger(SvUsuariosEliminar.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
