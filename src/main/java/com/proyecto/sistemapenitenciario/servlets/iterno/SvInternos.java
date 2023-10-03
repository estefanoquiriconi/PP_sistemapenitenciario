package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvInternos", urlPatterns = {"/SvInternos"})
public class SvInternos extends HttpServlet {

    ControladoraInterno control = new ControladoraInterno();
    ControladoraEstablecimiento controlEstablecimiento = new ControladoraEstablecimiento();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Interno> listaInternos = new ArrayList<>();
        listaInternos = control.traerInternos();

        HttpSession misesion = request.getSession();
        if(request.getParameter("altaCondena") != null && request.getParameter("altaCondena").equals("1")){
            misesion.setAttribute("cargaCondenaInterno", true);
        }else{
             misesion.setAttribute("cargaCondenaInterno", false);
        }
        misesion.setAttribute("listaInternos", listaInternos);
        response.sendRedirect("pages_internos/mostrarInternos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        boolean resultadoValidacion= Boolean.parseBoolean(request.getParameter("resultadoValidacion"));
        Interno interno = new Interno();
        interno.setNumDoc(request.getParameter("dni"));
        interno.setNombre(request.getParameter("nombre"));
        interno.setApellido(request.getParameter("apellido"));
        interno.setApodo(request.getParameter("apodo"));
        interno.setSexo(Character.toUpperCase(request.getParameter("sexo").charAt(0)));
        try {
            interno.setFechaNac(parseDate(request.getParameter("fechaNac")));
            interno.setFechaIngreso(parseDate(request.getParameter("fechaIngreso")));
        } catch (ParseException ex) {
            Logger.getLogger(SvInternos.class.getName()).log(Level.SEVERE, null, ex);
        }
        interno.setPciaNac(request.getParameter("provincia"));
        interno.setNacionalidad(request.getParameter("nacionalidad"));
        interno.setDptoNac(request.getParameter("dpto_nac"));
        interno.setDomicilio(request.getParameter("domicilio"));
        interno.setProfesion(request.getParameter("profesion"));
        interno.setTipoDoc(request.getParameter("tipoDoc"));
        interno.setEstadoCivil(request.getParameter("estCivil"));
        Establecimiento est = controlEstablecimiento.traerEstablecimeinto(Integer.parseInt(request.getParameter("establecimientos")));
        interno.setIdEstablecimiento(est);
        interno.setLegajo(obtenerLegajo(interno));

        interno.setEstado(true);
        System.out.println(interno.getLegajo());
if (resultadoValidacion){
        control.crearInterno(interno);

        response.sendRedirect("index.jsp");
}else{
            response.sendRedirect("pages_interno/altaInternos.jsp");
}
    }

    private Date parseDate(String fechaString) throws ParseException {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/mm/yyyy");
        Date fecha = null;
        try {
            fecha = formatoFecha.parse(fechaString);
        } catch (ParseException e) {
            throw new ParseException("Error al analizar la cadena como fecha.", e.getErrorOffset());
        }

        return fecha;
    }

    private String obtenerLegajo(Interno interno) {
        return interno.getApellido().charAt(0) + "" + interno.getNombre().charAt(0)+ ""
                + interno.getNumDoc().substring(interno.getNumDoc().length() - 3, interno.getNumDoc().length()) + ""
                + interno.getIdEstablecimiento().getId_establecimiento();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
