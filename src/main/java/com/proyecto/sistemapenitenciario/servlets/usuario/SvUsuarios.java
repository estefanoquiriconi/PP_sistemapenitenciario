/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.usuario;

import com.proyecto.sistemapenitenciario.logica.usuario.ControladoraUsuario;
import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {
    
    ControladoraUsuario control = new ControladoraUsuario();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> listaUsuarios;
        listaUsuarios = control.traerUsuarios();
        
          HttpSession misesion = request.getSession();
          misesion.setAttribute("listaUsuarios", listaUsuarios);
          response.sendRedirect("Pages_Usuarios/mostrarUsuarios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           List<Usuario> listaUsuarios;
        listaUsuarios = control.traerUsuarios();
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");
        int rol = Integer.parseInt(request.getParameter("rol"));
        boolean resultadoValidacion= Boolean.parseBoolean(request.getParameter("resultadoValidacion"));
       boolean existe=false;
        for (Usuario user : listaUsuarios) {
            if(user.getNombre().equals(nombre)){
                existe= true;
            }
        }
        if(resultadoValidacion && !existe ){
             Usuario usu = new Usuario();
        usu.setNombre(nombre);
        usu.setPassword(password);
        usu.setRol(rol);
        usu.setEstado(true); 
            control.crearUsuario(usu);
        response.sendRedirect("index.jsp");
    }else{
            if(existe){  response.sendRedirect("Pages_Usuarios/ExisteUsuario.jsp");}else{
             response.sendRedirect("Pages_Usuarios/altaUsuarios.jsp");}
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
