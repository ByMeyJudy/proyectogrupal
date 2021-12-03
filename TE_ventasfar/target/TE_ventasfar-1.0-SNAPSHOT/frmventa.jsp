<<%-- 
    Document   : frmventa
    Created on : 25 nov. 2021, 15:57:12
    Author     : WINDOWS 10
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              <c:if test="${venta.id==0}">NUEVO</c:if>
              <c:if test="${venta.id!=0}">EDITAR</c:if>
                  VENTA 
              </h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="ventas" />
            </jsp:include>
            <br>
            <form action="VentaControlador" method="post" >
                <input type="hidden" name="id" value="${venta.id}">
                <div class="form-group">
                    <label for="" class="form-label">Cliente</label>
                    <select name="cliente_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_clientes}">
                            <option value="${item.id}" 
                                    <c:if test="${venta.cliente_id == item.id}">
                                        selected
                                    </c:if>>${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Producto</label>
                    <select name="producto_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_productos}">
                            <option value="${item.id}" <c:if test="${venta.producto_id == item.id}">
                                        selected
                                    </c:if>>${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>                
                <div class="form-group">
                    <label for="" class="form-label">Fecha</label>
                    <input type="text" class="form-control" name="fecha" value="${venta.fecha}" placeholder="Escriba la fecha">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Cantidad</label>
                    <input type="number" class="form-control" name="cantidad" value="${venta.cantidad}" placeholder="Escriba la cantidad">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Precio</label>
                    <input type="number" step="0.01" class="form-control" name="precio" value="${venta.precio}" placeholder="Escriba el precio">
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
