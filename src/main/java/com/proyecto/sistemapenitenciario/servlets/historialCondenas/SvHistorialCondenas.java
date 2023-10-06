
import com.proyecto.sistemapenitenciario.logica.condenas.CondenaHistorial;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondenaHistorial;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvHistorialCondenas", urlPatterns = {"/SvHistorialCondenas"})
public class SvHistorialCondenas extends HttpServlet {

    ControladoraCondenaHistorial controlHistorial = new ControladoraCondenaHistorial();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<CondenaHistorial> listaHistorialCondena = new ArrayList<>();
        listaHistorialCondena = controlHistorial.traerHistorial();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaHistorialCondena", listaHistorialCondena);

        response.sendRedirect("pages_historial_condenas/mostrarHistorialCondenas.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
