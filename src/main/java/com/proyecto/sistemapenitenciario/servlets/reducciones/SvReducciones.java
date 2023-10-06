package com.proyecto.sistemapenitenciario.servlets.reducciones;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvReducciones", urlPatterns = {"/SvReducciones"})
public class SvReducciones extends HttpServlet {
    
    ControladoraCondena controlCondena = new ControladoraCondena();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Condena> listaCondenas = new ArrayList<>();
        listaCondenas = controlCondena.traerCondenas();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaCondenas", listaCondenas);

        response.sendRedirect("pages_reducciones/condenasParaReducir.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Condena condenaReduc = controlCondena.traerCondena(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("condenaReduc", condenaReduc);

        response.sendRedirect("pages_reducciones/altaReduccion.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
