<%-- 
    Document   : empresas
    Created on : 9 May 2023, 23:04:56
    Author     : Pedro Nhamirre
--%>

<%@page import="DTO.EmpresasDTO"%>
<%@page import="java.util.*"%>
<%@page import="DAO.EmpresasDAO"%>
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
    <%--
            if(session.getAttribute("user")==null){
                response.sendRedirect("loginA.jsp");
            }

        --%>
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


                    <li class="nav-link" onclick="changePanel('dashboard')"
                        data-bs-toggle="panel"  data-bs-target="#dashboard" >
                        <a href="#">
                            <i class='bx bxs-building icon'></i>
                            <span class="text nav-text">Empresas</span>
                        </a>
                    </li>
                    
                    <li class="nav-link" onclick="changePanel('analytics')"
                        data-bs-toggle="panel"  data-bs-target="#analytics" >
                        <a href="#">
                            <i class='bx bxs-building icon'></i>
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
        <div class="home panel" id="dashboard" style="display: block;">
            <h2 class="text">Empresas</h2>
            <p class="">Lista de Empresas.</p>
            <table class="table ">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Tipo</th>
                        <th>Setor</th>
                        <th>Email</th>
                        <th>Localizacao</th>
                        <th>Empregos</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        EmpresasDAO empresaDAO = new EmpresasDAO();
                        List<EmpresasDTO> listaEmpresa = (List<EmpresasDTO>) empresaDAO.listar();

                        for (EmpresasDTO empresa : listaEmpresa) {
                    %>
                    <tr>
                        <td> <%=empresa.getIdEmpresa()%> </td>
                        <td> <%=empresa.getNomeEmpresa()%> </td>
                        <td> <%=empresa.getTipoEmpresa()%> </td>
                        <td> <%=empresa.getSetor()%> </td>
                        <td> <%=empresa.getEmail()%> </td>
                        <td> <%=empresa.getLocalizacao()%> </td>
                        <td> <%=empresa.getEmpregos()%> </td>

                        <td>
                            <form action="editEmpresas.jsp" method="POST">
                                <input type="hidden" value="<%=empresa.getIdEmpresa()%>" name="Id">
                                <input type="hidden" value="<%=empresa.getNomeEmpresa()%>" name="Nome">
                                <input type="hidden" value="<%=empresa.getTipoEmpresa()%>" name="Tipo">
                                <input type="hidden" value="<%=empresa.getSetor()%> " name="Setor">
                                <input type="hidden" value=" <%=empresa.getEmail()%>" name="Email">
                                <input type="hidden" value="<%=empresa.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=empresa.getEmpregos()%>" name="Empregos">

                                <button type="submit" class="btn btn-warning text-bg-warning" >EDITAR</button>
                            </form>
                        </td>
                        <td>
                            <form action="deleteEmpresas.jsp" method="POST">
                                <input type="hidden" value="<%=empresa.getIdEmpresa()%>" name="Id">
                                <input type="hidden" value="<%=empresa.getNomeEmpresa()%>" name="Nome">
                                <input type="hidden" value="<%=empresa.getTipoEmpresa()%>" name="Tipo">
                                <input type="hidden" value="<%=empresa.getSetor()%> " name="Setor">
                                <input type="hidden" value=" <%=empresa.getEmail()%>" name="Email">
                                <input type="hidden" value="<%=empresa.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=empresa.getEmpregos()%>" name="Empregos">

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
