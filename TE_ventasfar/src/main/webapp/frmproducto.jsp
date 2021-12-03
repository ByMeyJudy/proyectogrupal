<%-- 
    Document   : frmproducto
    Created on : 25 nov. 2021, 17:01:16
    Author     : WINDOWS 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" >
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

        <title>Punto de venta</title>
    </head>
    <body>
        <div class="container">
            <h1>
                <c:if test="${producto.id==0}">NUEVO</c:if>
                <c:if test="${producto.id!=0}">EDITAR</c:if>
                    PRODUCTO 
                </h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="productos" />
            </jsp:include>
            <br>
            <form action="ProductoControlador" method="post" >
                <input type="hidden" name="id" value="${producto.id}">
                
                <div class="form-group">
                    <label for="" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Escriba nombre del producto">                    
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Escriba la descripcion">                    
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Precio</label>
                    <input type="number" class="form-control" name="precio" value="${producto.precio}" placeholder="Escriba el precio">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" value="${producto.cantidad}" placeholder="Escriba la cantidad">                    
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Fecha</label>
                    <input type="text" class="form-control" name="fecha" value="${producto.fecha}" placeholder="Escriba la fecha">                    
                </div>

                <div class="form-group">
                    <label for="" class="form-label">Tipo</label>
                    <select name="tipo_id" class="form-control">
                        <option value="">-- Seleccione --</option>item
                        <c:forEach var="item" items="${lista_tipos}">
                            <option value="${item.id}"
                                    
                                    <c:if test="${producto.tipo_id == item.id}">
                                        selected
                                    </c:if>>${item.descripcion}</option>
                        </c:forEach>
                    </select>
                </div> 
                <div class="text-center">
                    <p class="mt-2 mb-10 text-muted"></p>
                    <button type="submit" class="btn btn-success btn-lg">-- Enviar --</button>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

    </body>
</html>
