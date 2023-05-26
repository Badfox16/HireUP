
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

        <script
            src="https://kit.fontawesome.com/7a342b9685.js"
            crossorigin="anonymous"
        ></script>

        <title>header</title>

        <style>
            .btn-middle-link{
                background: transparent !important;
                color: black !important;
                transition: all .3s ease;
            }

            .btn-middle-link:hover{
                background-color: #443fde !important;
                color: white !important;
            }
            .btn-login{
                background: #443fde !important;
                color: white;
                border: none transparent !important;
                border-radius: 0 !important;
                font-size: 1rem;
                font-family: 'Lato', sans-serif;
                font-weight: bold;
            }

            .dropdown-item{
                font-weight: bold;
            }
        </style>

    </head>

    <body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary d-flex align-items-center justify-content-between ps-2 pe-2 pt-3 pb-3 mb-5">
            <div class="container-fluid">
                <a href="../index.html" class="navbar-brand">
                    <img src="../img/logo.png" alt="Logo" class="logo" height="30" />
                    ${mail}
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav  m-auto mb-lg-0">
                        <li class="nav-item">
                            <a class="btn btn-middle-link m-2" href="../index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-middle-link m-2" href="./empresa.jsp">Empresas</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-middle-link m-2" href="./browse.jsp">Empregos</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-middle-link m-2" href="./candidaturas.jsp">Candidaturas</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-middle-link m-2" href="../Pages - Empresas/login_empresa.jsp">Para Empregadores</a>

                        </li>

                    </ul>
                    <%
                        if (session.getAttribute("mail") == null) {
                    %>
                    <span class="navbar-text">

                        <form action="login.html" method="POST">
                            <button class="btn btn-primary btn-login">Log In</button>
                        </form>

                    </span>

                    <% } else { %>

                    <span class="navbar-text">

                        <div class="btn-group dropstart">
                            <button 
                                style="border:none !important;
                                background-color: #443fde !important;" 
                                class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-user"></i>
                            </button>

                            <ul class="dropdown-menu dropdown">
                                <li><a class="dropdown-item" href="#">Perfil</a></li>
                                <li><a class="dropdown-item " href="../logout/fazerLogout.jsp">Logout</a></li>
                            </ul>
                        </div>
                    </span>

                    <%
                        }
                    %>
                </div>
            </div>
        </nav>

    </body>

</html>