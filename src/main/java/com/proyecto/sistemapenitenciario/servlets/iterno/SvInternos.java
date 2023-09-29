package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvInternos", urlPatterns = {"/SvInternos"})
public class SvInternos extends HttpServlet {

    ControladoraInterno control = new ControladoraInterno();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Interno> listaInternos = new ArrayList<>();
        listaInternos = control.traerInternos();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaInternos", listaInternos);
        response.sendRedirect("pages_internos/mostrarInternos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             request.setCharacterEncoding("UTF-8");
             Interno interno= new Interno();
        interno.setNombre(request.getParameter("nombre"));  
        interno.setApellido(request.getParameter("apellido"));  
        interno.setApodo(request.getParameter("apodo"));  
        interno.setSexo((request.getParameter("sexo").charAt(0)));  
        interno.setFechaNac(parseDate(request.getParameter("fechaNac")));  
        interno.setPciaNac(request.getParameter("provincia"));  
        interno.setNacionalidad(request.getParameter("nacionalidad"));
        interno.setDptoNac(request.getParameter("dpto_nac"));
        interno.setDptoNac(request.getParameter("dpto_nac"));
        interno.setDptoNac(request.getParameter("dpto_nac"));
        
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        

        System.out.println(request.getParameter("nombre"));
        System.out.println(request.getParameter("ciudad"));
        System.out.println(request.getParameter("direccion"));

     

    
        response.sendRedirect("index.jsp");

    }
   
    private Date parseDate(String fechaString){
         SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
       Date fecha=null;
        try {
            // Utiliza el método parse para convertir la cadena en un objeto Date
           fecha = formatoFecha.parse(fechaString);

            // Imprime la fecha
            System.out.println("Fecha convertida: " + fecha);
        } catch (java.text.ParseException e) {
            System.err.println("Error al analizar la cadena como fecha.");
        }
        return fecha;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
