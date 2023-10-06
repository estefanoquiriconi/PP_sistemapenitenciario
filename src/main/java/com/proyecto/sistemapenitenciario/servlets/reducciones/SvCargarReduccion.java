package com.proyecto.sistemapenitenciario.servlets.reducciones;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraReduccion;
import com.proyecto.sistemapenitenciario.logica.condenas.ReduccionCondenas;
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

@WebServlet(name = "SvCargarReduccion", urlPatterns = {"/SvCargarReduccion"})
public class SvCargarReduccion extends HttpServlet {
    
    ControladoraReduccion controlReduccion = new ControladoraReduccion();
    ControladoraCondena controlCondena = new ControladoraCondena();

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
        request.setCharacterEncoding("UTF-8");
        
        String strFecReduc = request.getParameter("fechaReduc");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaReduc = new Date();
        try {
            fechaReduc = formato.parse(strFecReduc);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String motivo = request.getParameter("motivo");
        int tiempoDias = Integer.parseInt(request.getParameter("tiempoDias"));
        int idCondena = Integer.parseInt(request.getParameter("idCondena"));
        
        Condena condenaReduc = controlCondena.traerCondena(idCondena);
        
        
        ReduccionCondenas reduccion = new ReduccionCondenas();
        reduccion.setFechaReduccion(fechaReduc);
        reduccion.setTiempoDias(tiempoDias);
        reduccion.setMotivoReduccion(motivo);
        
        //NUEVA CANTIDAD DE DIAS LUEGO DE LA REDUCCION
        int nuevaCantidadDeDias = condenaReduc.getDuracionDias() - tiempoDias;
        condenaReduc.setDuracionDias(nuevaCantidadDeDias);
        
        //NUEVA FECHA DE FIN
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(condenaReduc.getFechaInicio());
        calendar.add(Calendar.DAY_OF_YEAR, nuevaCantidadDeDias);
        Date fechaFin = calendar.getTime();
        
        condenaReduc.setFechaFin(fechaFin);
        
        controlCondena.editarCondena(condenaReduc);
        reduccion.setFkCondena(condenaReduc);
        controlReduccion.cargarReduccion(reduccion);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
