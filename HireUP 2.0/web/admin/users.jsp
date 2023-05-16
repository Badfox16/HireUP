<%-- 
    Document   : users
    Created on : 9 May 2023, 22:55:33
    Author     : Pedro Nhamirre
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="DAO.ConexaoDAO"%>
<%@page import="java.sql.*"%>
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
        <title>USERS</title>



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


                    <li class="nav-link" data-bs-toggle="panel"  data-bs-target="#dashboard" onclick="changePanel('dashboard')">
                        <a href="#"  >
                            <i class='bx bxs-user-circle icon'></i>
                            <span class="text nav-text">Usuários</span>
                        </a>
                    </li>

                    <li class="nav-link" data-bs-toggle="panel"  data-bs-target="#analytics" onclick="changePanel('analytics')">
                        <a href="#" >
                            <i class='bx bxs-user-circle icon'></i>
                            <span class="text nav-text">Teste</span>
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


        <!-- Painel Dashboard -->
        <div class="home panel" id="dashboard"  style="display: block;" >
            <h2 class="text">Usuários</h2>
            <p class="">Lista de Usuários</p>
            <table class="table ">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Nome</th>
                        <th>Apelido</th>
                        <th>Setor</th>
                        <th>Localização</th>
                        <th>Formação</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UsuariosDAO usersDAO = new UsuariosDAO();
                        List<UsuariosDTO> listaCat = (List<UsuariosDTO>) usersDAO.listarUsuarios();

                        for (UsuariosDTO newCat : listaCat) {
                    %>
                    <tr>
                        <td> <%=newCat.getEmail()%> </td>
                        <td> <%=newCat.getNome()%> </td>
                        <td> <%=newCat.getApelido()%> </td>
                        <td> <%=newCat.getSetor()%> </td>
                        <td> <%=newCat.getLocalizacao()%> </td>
                        <td> <%=newCat.getFormacao()%> </td>
                        <td>
                            <form action="editUser.jsp" method="POST">
                                <input type="hidden" value="<%=newCat.getEmail()%> " name="Email">
                                <input type="hidden" value="<%=newCat.getNome()%>" name="Nome">
                                <input type="hidden" value="<%=newCat.getApelido()%>" name="Apelido">
                                <input type="hidden" value="<%=newCat.getSetor()%> " name="Setor">
                                <input type="hidden" value="<%=newCat.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=newCat.getFormacao()%>" name="Formacao">

                                <button type="submit" class="btn btn-warning text-bg-warning" >EDITAR</button>
                            </form>
                        </td>
                        <td>
                            <form action="deleteUser.jsp" method="POST">
                                <input type="hidden" value="<%=newCat.getEmail()%> " name="Email">
                                <input type="hidden" value="<%=newCat.getNome()%>" name="Nome">
                                <input type="hidden" value="<%=newCat.getApelido()%>" name="Apelido">
                                <input type="hidden" value="<%=newCat.getSetor()%> " name="Setor">
                                <input type="hidden" value="<%=newCat.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=newCat.getFormacao()%>" name="Formacao">

                                <button type="submit" class="btn btn-danger">EXCLUIR</button>
                            </form>
                        </td>
                    </tr>

                    <%
                        }

                    %>
                </tbody>
            </table>
        </div>

        <!-- Painel Analytics -->
        <div class="home panel" id="analytics" style="display: none;">
            <h2 class="text">Analytics</h2>
            <p>Conteúdo do painel Analytics.</p>
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
                // Ocultar todos os painéis
                const panels = document.querySelectorAll('.panel');
                panels.forEach(panel => {
                    panel.style.display = 'none';
                });

                // Exibir o painel selecionado
                const panel = document.getElementById(panelId);
                panel.style.display = 'block';
            }

        </script>
    </body>

</html>
