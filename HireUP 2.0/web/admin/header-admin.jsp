<%-- 
    Document   : header-admin
    Created on : 9 May 2023, 14:50:10
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <title></title>

        <script defer >
            function atualizarDataHora() {
                var dataHora = new Date();
                var data = dataHora.toLocaleDateString();
                var hora = dataHora.toLocaleTimeString();
                document.getElementById("data_hora").innerHTML = "Data: " + data + "<br>Hora: " + hora;
            }
            setInterval(atualizarDataHora, 1000);
        </script>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-primary ">
            <div class="container-fluid">
                <a class="navbar-brand text-bg-primary" href="#">ADMIN PANEL</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5">
                        
                        
                        <li class="nav-item d-flex align-items-center me-5">
                            <a class="nav-link text-bg-primary " aria-current="page" href="#"><i class="bi bi-house-fill"></i>HOME</a>
                        </li>

                        <li class="nav-item ms-5">
                            <a class="nav-link text-bg-primary" href="#" id="data_hora"></a>
                        </li>


                    </ul>
                    <form class="d-flex" role="search">

                        <button class="btn bg-danger text-bg-danger btn-outline-light" type="submit">LOGOUT</button>
                    </form>
                </div>
            </div>
        </nav>
    </body>
</html>