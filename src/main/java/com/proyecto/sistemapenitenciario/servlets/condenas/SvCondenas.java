package com.proyecto.sistemapenitenciario.servlets.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraDelito;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvCondenas", urlPatterns = {"/SvCondenas"})
public class SvCondenas extends HttpServlet {

    ControladoraInterno controlInterno = new ControladoraInterno();
    ControladoraDelito controlDelito = new ControladoraDelito();
    ControladoraCondena controlCondena = new ControladoraCondena();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Interno interno = controlInterno.traerInterno(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("internoCondena", interno);

        response.sendRedirect("pages_condenas/altaCondenas.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String strFecDet = request.getParameter("fechaDetencion");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDetencion = new Date();
        try {
            fechaDetencion = formato.parse(strFecDet);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String strFecInicio = request.getParameter("fechaInicio");
        Date fechaInicio = new Date();
        try {
            fechaInicio = formato.parse(strFecInicio);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String juez = request.getParameter("juez");
        int cantDias = Integer.parseInt(request.getParameter("cantDias"));
        int idDelito = Integer.parseInt(request.getParameter("delito"));
        int idInterno = Integer.parseInt(request.getParameter("idInterno"));

        Interno internoCondena = controlInterno.traerInterno(idInterno);

        Condena condena = new Condena();
        condena.setJuez(juez);
        condena.setFechaInicio(fechaInicio);
        condena.setFechaDetencion(fechaDetencion);
        condena.setDuracionDias(cantDias);
        condena.setFkInterno(internoCondena);
        condena.setFkDelito(controlDelito.traerDelito(idDelito));
        condena.setEstado(true);
        condena.setCodCondena("COD-" + internoCondena.getApellido().charAt(0) + internoCondena.getNombre().charAt(0) + "-" + internoCondena.getLegajo());

        controlCondena.cargarCondena(condena);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
