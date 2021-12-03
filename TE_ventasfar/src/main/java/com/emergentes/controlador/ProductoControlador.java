
package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.TipoDAO;
import com.emergentes.dao.TipoDAOimpl;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Tipo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try{
            Producto pro = new Producto();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();
            TipoDAO daoTipo = new TipoDAOimpl();
            List<Tipo> lista_tipos = null;
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            System.out.println("Opcion = "+ action);
            
            switch(action){
                case "add":
                    lista_tipos = daoTipo.getAll();
                    request.setAttribute("lista_tipos", lista_tipos);
                    request.setAttribute("producto", pro);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                  
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pro =  dao.getById(id);
                    lista_tipos = daoTipo.getAll();
                    request.setAttribute("lista_tipos", lista_tipos);
                    
                    request.setAttribute("producto", pro);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                   
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    // Obtener la lista de registros
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos",lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }
            
        }catch(Exception ex){
            System.out.println("Error " + ex.getMessage());
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion =  request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String fecha = request.getParameter("fecha");
        int tipo_id = Integer.parseInt(request.getParameter("tipo_id"));
        
        Producto cli = new Producto();
        
        cli.setId(id);
        cli.setNombre(nombre);
        cli.setDescripcion(descripcion);
        cli.setPrecio(precio);
        cli.setCantidad(cantidad);
        cli.setFecha(convierteFecha(fecha));
        cli.setTipo_id(tipo_id);
        
        ProductoDAO dao = new ProductoDAOimpl();
        if (id == 0){
            try {
                // Nuevo registro
                dao.insert(cli);
            } catch (Exception ex) {
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }
        else{
            try {
                // Edicion de registro*
                dao.update(cli);
            } catch (Exception ex) {
                System.out.println("Error al editar "+ex.getMessage());
            }
        }
        response.sendRedirect("ProductoControlador");
    }

   public Date convierteFecha(String fecha)
    {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(VentaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaBD;
    }
}
