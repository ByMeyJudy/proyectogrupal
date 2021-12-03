<%
    if (session.getAttribute("login") != "OK"){
        response.sendRedirect("login.jsp");
    }
%>
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

        <title>CLIENTES</title>
    <div class="header">
        <h1 class="display-2">SISTEMA DE VENTAS
            <img src="https://booold.com/wp-content/uploads/2020/05/Medicamentos.png" style="width: 100px;" alt="logo">
        </h1>
    </div>
    <div>
        <nav class="navbar navbar-light bg-light">
            <div>
                <a href="ClienteControlador" class="btn btn-success" style="width: 200px; height: 50px;"> 
                    <i class="fas fa-ellipsis-h"></i>
                    Menus
                </a>
                <a href="Logout" class="btn btn-danger" style="width: 200px; height: 50px;"> 
                    <i class="fas fa-sign-out-alt"></i>
                    Cerrar sesión
                </a>
                <a href="Info.jsp" class="btn btn-info" style="width: 200px; height: 50px;"> 
                    <i class="fas fa-info-circle"></i>
                    Información
                </a>
            </div>
        </nav>
    </div>

</head>
<body>
    <div class="container">
        <h1>CLIENTES</h1>
        <jsp:include page="WEB-INF/menu.jsp">
            <jsp:param name="opcion" value="clientes"/>              
        </jsp:include>
        <br>
            <a href="ClienteControlador?action=add" class="btn btn-primary btn-sm"><i class="fas fa-plus-circle"></i> Nuevo Registro</a>
            <p class="mt-1 mb-10 text-muted"></p>
            <table class="table">
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>CI</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo</th>
                    <th>Celular</th>
                    <th colspan="2">ACCIONES</th>
                </tr>
                </thead>
            <tbody>
                <c:forEach var="item" items="${clientes}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.ci}</td>
                    <td>${item.nombre}</td>
                    <td>${item.apellido}</td>
                    <td>${item.correo}</td>
                    <td>${item.celular}</td>
                    <td><a href="ClienteControlador?action=edit&id=${item.id}" class="btn btn-warning">Editar</a></td>
                    <td><a href="ClienteControlador?action=delete&id=${item.id}" onclick="return(confirm('¿Esta seguro de eliminar el registro seleccionado?'))" class="btn btn-danger">Eliminar</a></td>                  
                </tr>
                </c:forEach>
            </tbody>
        </table>    
    </div>
    <div class="footer">
        <div class="text-center">
            <p class="mt-5 mb-10 text-muted">Tec. Emergentes II - UPEA</p>
            <p class="mt-1 mb-10 text-muted">&copy; 2021</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    </body>
</html>
