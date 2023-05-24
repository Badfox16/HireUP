<%-- 
    Document   : header
    Created on : May 24, 2023, 3:23:36 PM
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/header.css"/>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
     
        <title>HEADER</title>
    </head>
    
    <body>
        
        <nav class="sidebar">
            <header>
                <div class="image-text">
                    <span class="image">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" alt="">
                    </span>

                    <div class="text logo-text">
                        <span class="name"> Seu Nome aqui </span>
                        <span class="profession">Administrador</span>
                    </div>
                </div>

                <i class='bx bx-chevron-right toggle'></i>
            </header>

            <div class="menu-bar">
                <div class="menu">



                    <li class="nav-link">
                        <a href="admin.jsp" class="homeLink">
                            <i class='bx bx-home-alt icon homeIcon'></i>
                            <span class="text nav-text homeText">Home</span>
                        </a>
                    </li>


                    <li class="nav-link">
                        <a href="users.jsp" class="usersLink"> 
                            <i class='bx bxs-user-circle icon usersIcon'></i>
                            <span class="text nav-text usersText">Usuários</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="empresas.jsp" class="empresasLink">
                            <i class='bx bxs-building icon empresasIcon'></i>
                            <span class="text nav-text empresasText">Empresas</span>
                        </a>
                    </li>



                </div>

                <div class="bottom-content">

                    <li class="">
                        <a href="login-admin.jsp">
                            <i class='bx bx-log-out icon'></i>
                            <span class="text nav-text">Logout</span>
                        </a>
                    </li>

                    <li class="mode">
                        <div class="sun-moon">
                            <i class='bx bx-moon icon moon'></i>
                            <i class='bx bx-sun icon sun'></i>
                        </div>
                        <span class="mode-text text">Dark mode</span>

                        <div class="toggle-switch">
                            <span class="switch"></span>
                        </div>
                    </li>

                </div>
            </div>

        </nav>
        
        <script>
            const body = document.querySelector('body'),
                    sidebar = body.querySelector('nav'),
                    toggle = body.querySelector(".toggle"),
                    searchBtn = body.querySelector(".search-box"),
                    modeSwitch = body.querySelector(".toggle-switch"),
                    modeText = body.querySelector(".mode-text");
            toggle.addEventListener("click", () => {
                sidebar.classList.toggle("close");
            })

            modeSwitch.addEventListener("click", () => {
                body.classList.toggle("dark");
                if (body.classList.contains("dark")) {
                    modeText.innerText = "Light mode";
                } else {
                    modeText.innerText = "Dark mode";
                }
            });
        </script>
    </body>
</html>
