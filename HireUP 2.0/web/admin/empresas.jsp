<%-- 
    Document   : empresas
    Created on : 9 May 2023, 23:04:56
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/users.css">
    <title>Empresas</title>



</head>

<body>
    <nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" alt="">
                </span>

                <div class="text logo-text">
                    <span class="name">Teste</span>
                    <span class="profession">New Teste</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">



                <li class="nav-link">
                    <a href="admin.jsp">
                        <i class='bx bx-home-alt icon'></i>
                        <span class="text nav-text">Home</span>
                    </a>
                </li>


                <li class="nav-link" onclick="changePanel('dashboard')">
                    <a href="#">
                        <i class='bx bxs-building icon'></i>
                        <span class="text nav-text">Empresas</span>
                    </a>
                </li>



            </div>

            <div class="bottom-content">

                <li class="">
                    <a href="#">
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



    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Editar Empresas</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="/action_page.php">
                        <div class="mb-3 mt-3">
                            <label for="username" class="form-label">Username:</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>

                        <div class="mb-3 mt-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="pwd" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="pwd"
                                name="pswd">
                        </div>

                        <button type="submit" class="btn btn-success">Atualizar</button>
                    </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Voltar</button>
                </div>

            </div>
        </div>
    </div>


    <!-- Painel Dashboard -->
    <div class="home panel" id="dashboard-panel" style="display: block;">
        <h2 class="text">Empresas</h2>
        <p class="">Lista de Empresas.</p>
        <table class="table ">
            <thead>
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Email</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                    <td><a href="" class="btn btn-warning text-bg-warning" data-bs-toggle="modal"
                            data-bs-target="#myModal">EDITAR</a></td>
                    <td><a href="" class="btn btn-danger ">EXCLUIR</a></td>
                </tr>
              
            </tbody>
        </table>
    </div>

    <!-- Painel Analytics -->
    <div class="home panel" id="analytics-panel" style="display: none;">
        <h2 class="text">Analytics</h2>
        <p>Conteúdo do painel Analytics.</p>
    </div>

    <!-- Painel Notifications -->
    <div class="home panel" id="notifications-panel" style="display: none;">
        <h2 class="text">Notifications</h2>
        <p>Conteúdo do painel Notifications.</p>
    </div>

    <!-- Painel Stats -->
    <div class="home panel" id="stats-panel" style="display: none;">
        <h2>Stats</h2>
        <p>Conteúdo do painel Stats.</p>
    </div>

    <!-- Painel Favourites -->
    <div class="home panel" id="favourites-panel" style="display: none;">
        <h2>Favourites</h2>
        <p>Conteúdo do painel Favourites.</p>
    </div>

    <!-- Painel Money -->
    <div class="home panel" id="money-panel" style="display: none;">
        <h2>Money</h2>
        <p>Conteúdo do painel Money.</p>
    </div>




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



        function changePanel(panelId) {
            // Obtenha o painel com o ID correspondente
            const panel = document.querySelector(`#${panelId}-panel`);

            // Oculte todos os painéis
            const panels = document.querySelectorAll('.panel');
            panels.forEach(panel => panel.style.display = 'none');

            // Exiba o painel selecionado
            panel.style.display = 'block';
        }

    </script>
</body>

</html>
