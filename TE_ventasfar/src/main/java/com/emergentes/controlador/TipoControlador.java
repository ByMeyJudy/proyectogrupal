package com.emergentes.controlador;

import com.emergentes.dao.TipoDAO;
import com.emergentes.dao.TipoDAOimpl;
import com.emergentes.modelo.Tipo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TipoControlador", urlPatterns = {"/TipoControlador"})
public class TipoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            TipoDAO dao = new TipoDAOimpl();
            int id;
            Tipo cli = new Tipo();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            System.out.println("Opcion = " + action);

            switch (action) {
                case "add":
                    request.setAttribute("tipo", cli);
                    request.getRequestDispatcher("frmtipo.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    cli = dao.getById(id);
                    request.setAttribute("tipo", cli);
                    request.getRequestDispatcher("frmtipo.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("TipoControlador");
                    break;
                case "view":
                    // Obtener la lista de registros
                    List<Tipo> lista = dao.getAll();
                    request.setAttribute("tipos", lista);
                    request.getRequestDispatcher("tipos.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");

        Tipo cli = new Tipo();

        cli.setId(id);
        cli.setDescripcion(descripcion);

        TipoDAO dao = new TipoDAOimpl();
        if (id == 0) {
            try {
                // Nuevo registro
                dao.insert(cli);
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            try {
                // Edicion de registro*
                dao.update(cli);
            } catch (Exception ex) {
                System.out.println("Error al editar " + ex.getMessage());
            }
        }
        response.sendRedirect("TipoControlador");
    }

}
