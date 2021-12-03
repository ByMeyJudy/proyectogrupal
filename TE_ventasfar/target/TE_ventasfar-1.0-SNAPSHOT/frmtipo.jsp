<%-- 
    Document   : frmtipo
    Created on : 27 nov. 2021, 21:37:33
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
                <c:if test="${tipo.id==0}">NUEVO</c:if>
                <c:if test="${tipo.id!=0}">EDITAR</c:if>
                    TIPO 
                </h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="tipos" />
            </jsp:include>
            <br>
            <form action="TipoControlador" method="post" >
                <input type="hidden" name="id" value="${tipo.id}">
                
                <div class="form-group">
                    <label for="" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" value="${tipo.descripcion}" placeholder="Escriba un nuevo tipo">                    
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

