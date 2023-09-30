package com.proyecto.sistemapenitenciario.servlets.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraDelito;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEditCondena", urlPatterns = {"/SvEditCondena"})
public class SvEditCondena extends HttpServlet {
    
     ControladoraCondena controlCondena = new ControladoraCondena();
     ControladoraDelito controlDelito = new ControladoraDelito();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Condena condena = controlCondena.traerCondena(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("condenaEdit", condena);

        response.sendRedirect("pages_condenas/editarCondena.jsp");
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
        
        int idDelito = Integer.parseInt(request.getParameter("delito"));
        String juez = request.getParameter("juez");
        int cantDias = Integer.parseInt(request.getParameter("cantDias"));
        String valorCheck = request.getParameter("estado");
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fechaInicio);
        calendar.add(Calendar.DAY_OF_YEAR, cantDias);
        Date fechaFin = calendar.getTime();
        
        Condena condena = (Condena) request.getSession().getAttribute("condenaEdit");
        
        if (valorCheck != null) {
            condena.setEstado(true);
        } else {
            condena.setEstado(false);
        }
        
        condena.setJuez(juez);
        condena.setFechaDetencion(fechaDetencion);
        condena.setFechaInicio(fechaInicio);
        condena.setDuracionDias(cantDias);
        condena.setFkDelito(controlDelito.traerDelito(idDelito));
        condena.setFechaFin(fechaFin);
        
        controlCondena.editarCondena(condena);
        
        response.sendRedirect("SvCondenasList");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
