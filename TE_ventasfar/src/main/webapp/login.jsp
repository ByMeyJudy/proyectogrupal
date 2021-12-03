<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        .gradient-custom-2 {
            background: #fccb90;
            background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }

@media (min-width: 768px) {
  .gradient-form {
   height: 100vh !important;
  }
}
@media (min-width: 769px) {
  .gradient-custom-2 {
    border-top-right-radius: .3rem;
    border-bottom-right-radius: .3rem;
  }
}
    </style>
    <title>LOGIN</title>
  </head>
  <body>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img src="https://booold.com/wp-content/uploads/2020/05/Medicamentos.png" style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">Sistema de ventas de Medicamentos</h4>
                                        </div>

                                        <form action="Login" method="post">
                                            <p>Ingrese al sistema para continuar</p>

                                            <div class="form-outline mb-4">
                                                <input type="email" name="email" id="form2Example11" class="form-control" placeholder="name@example.com"/>
                                                <label class="form-label" for="form2Example11">Correo electrónico</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" name="password" id="form2Example22" class="form-control" />
                                                <label class="form-label" for="form2Example22">Contraseña</label>
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-lg fa-lg  gradient-custom-2 mb-4" type="submit">Ingresar</button>
                                                <br>                                                
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <h3 class="mb-5">¿Cómo es nuestro sistema?</h3>
                                        <p class="small mb-7">Es un sistema de control de ventas de medicamentos para una farmacia </p>

                                        <p class="small mb-1">Creado por: </p>
                                        <p class="small mb-1">Limachi Ramos Amanda </p>
                                        <p class="small mb-1">Mamani Mamani Mery</p>
                                        <p class="small mb-1">Coarite Contreras Joel</p>

                                        <div class="text-center">
                                            <p class="mt-5 mb-10 text-muted">Tec. Emergentes II - UPEA</p>
                                            <p class="mt-1 mb-10 text-muted">&copy; 2021</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
