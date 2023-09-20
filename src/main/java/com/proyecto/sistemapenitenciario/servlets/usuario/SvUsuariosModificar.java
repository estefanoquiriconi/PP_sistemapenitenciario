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
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuariosModificar", urlPatterns = {"/SvUsuariosModificar"})
public class SvUsuariosModificar extends HttpServlet {
    
    ControladoraUsuario control = new ControladoraUsuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("modificar"));
        Usuario user = control.traerUsuario(userId);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("usuario", user);
        response.sendRedirect("Pages_Usuarios/modificarUsuarios.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        Usuario user = (Usuario) request.getSession().getAttribute("usuario");
        user.setNombre(request.getParameter("nombre"));
        user.setPassword(request.getParameter("password"));
        user.setRol(Integer.parseInt(request.getParameter("rol")));        
         String valorCheck = request.getParameter("estado");
         user.setEstado("on".equals(valorCheck));    
       //  int UserSession= (Integer.parseInt(request.getParameter("userSession")));
        try {
            control.modificarUsuario(user);
         //   request.setAttribute("UserSessionActivo", UserSession);
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
