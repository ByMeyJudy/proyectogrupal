<%-- 
    Document   : menu
    Created on : 25 nov. 2021, 15:36:04
    Author     : WINDOWS 10
--%>

<%
    String opcion =  request.getParameter("opcion");
%>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("productos") ?  "active" : "") %>" href="ProductoControlador">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("tipos") ?  "active" : "") %>" href="TipoControlador">Tipos de Producto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("clientes") ?  "active" : "") %>" href="ClienteControlador">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("ventas") ?  "active" : "") %>" href="VentaControlador">Ventas</a>
                </li>
            </ul>