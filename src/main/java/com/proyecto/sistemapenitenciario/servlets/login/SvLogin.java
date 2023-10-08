package com.proyecto.sistemapenitenciario.servlets.login;

import com.proyecto.sistemapenitenciario.funciones.Hash;
import com.proyecto.sistemapenitenciario.logica.usuario.ControladoraUsuario;
import com.proyecto.sistemapenitenciario.logica.usuario.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    ControladoraUsuario control = new ControladoraUsuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // if(request.getSession()!=null){
        Hash hash = new Hash();
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String password = hash.generarHash(request.getParameter("password"));
        Usuario usuario = new Usuario();
        boolean validacion = false;
        boolean estadoUsuario = false;
        List<Usuario> listaUsuarios = control.traerUsuarios();
        for (Usuario usu : listaUsuarios) {

            if (usu.getNombre().equals(nombre) && usu.getPassword().equals(password)) {
                usuario = usu;
                validacion = true;
                estadoUsuario = usuario.isEstado();
            }
        }
        if (validacion && estadoUsuario) {
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("usuSession", usuario);
            response.sendRedirect("index.jsp");
        } else {
            if (!validacion && !estadoUsuario) {
                HttpSession misesion = request.getSession(true);
                misesion.setAttribute("estado", true);
            }
            if (validacion && !estadoUsuario) {
                HttpSession misesion = request.getSession(false);
                misesion.setAttribute("estado", false);
            }
            response.sendRedirect("loginError.jsp");
        }
      //  }else{
        //    response.sendRedirect("sinLogin.jsp");
        
    //}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
