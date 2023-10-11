package com.proyecto.sistemapenitenciario.servlets.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.CondenaHistorial;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondenaHistorial;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraDelito;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
    ControladoraCondenaHistorial controlHistorial = new ControladoraCondenaHistorial();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Interno interno = controlInterno.traerInterno(id);
        Condena condenaDeIterno = FuncionesCondenas.condenaDeInterno(id, controlCondena.traerCondenas());
        HttpSession misesion = request.getSession();
        misesion.setAttribute("internoCondena", interno);
        misesion.setAttribute("CondenaDelInterno", condenaDeIterno);

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

        
        String codCondena = "" + internoCondena.getApellido().charAt(0) + internoCondena.getNombre().charAt(0) + "" + internoCondena.getIdInterno() + strFecInicio.charAt(2) + strFecInicio.charAt(3);

        List<Condena> listaCondenas = controlCondena.traerCondenas();
        Condena condenaAnterior = new Condena();
        for (Condena conAnt : listaCondenas) {
            if (conAnt.getFkInterno().getIdInterno() == internoCondena.getIdInterno()) {
                condenaAnterior = conAnt;
            }
        }

        Calendar calendar = Calendar.getInstance();
        Condena condena = new Condena();
        Date fechaActual = new Date();
        condena.setJuez(juez);
        if (condenaAnterior.getFechaFin() != null && condenaAnterior.getEstado()) {
            condena.setFechaInicio(condenaAnterior.getFechaFin());
            calendar.setTime(condenaAnterior.getFechaFin());
        }else{
            calendar.setTime(fechaInicio);
            condena.setFechaInicio(fechaInicio);
        }
        calendar.add(Calendar.DAY_OF_YEAR, cantDias);
        Date fechaFin = calendar.getTime();
        
        condena.setFechaDetencion(fechaDetencion);
        condena.setDuracionDias(cantDias);
        condena.setFkInterno(internoCondena);
        condena.setFkDelito(controlDelito.traerDelito(idDelito));
        condena.setFechaFin(fechaFin);
        condena.setEstado(true);
        condena.setCodCondena(codCondena);

        CondenaHistorial condenaHistorial = new CondenaHistorial();
        condenaHistorial.setJuez(condena.getJuez());
        condenaHistorial.setCodCondena(condena.getIdCondena() + "-" + condena.getCodCondena());
        condenaHistorial.setDuracionDias(condena.getDuracionDias());
        condenaHistorial.setEstado(true);
        condenaHistorial.setFechaDetencion(condena.getFechaDetencion());
        condenaHistorial.setFechaFin(condena.getFechaFin());
        condenaHistorial.setFechaInicio(condena.getFechaInicio());
        condenaHistorial.setFkDelito(condena.getFkDelito());
        condenaHistorial.setFkInterno(condena.getFkInterno());

        controlCondena.cargarCondena(condena);
        controlHistorial.cargarHistorial(condenaHistorial);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
