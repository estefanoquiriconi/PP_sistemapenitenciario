/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.proyecto.sistemapenitenciario.servlets.usuario;

import com.proyecto.sistemapenitenciario.logica.usuario.ControladoraUsuario;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvLoginUsuarios", urlPatterns = {"/SvLoginUsuarios"})
public class SvLoginUsuarios extends HttpServlet {
ControladoraUsuario control = new ControladoraUsuario();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String nombre= request.getParameter("nombre");           
                if( control.ExisteUsuario(nombre)){
                    response.sendRedirect("index.jsp");
                //    HttpSession misesion = request.getSession();
              //     misesion.setAttribute("listaUsuarios", listaUsuarios);
                }else{
                    response.sendRedirect("index.jsp");
                }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
