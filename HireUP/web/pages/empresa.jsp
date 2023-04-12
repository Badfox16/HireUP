<%-- 
    Document   : empresa
    Created on : Apr 12, 2023, 1:18:14 AM
    Author     : godal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>

<!DOCTYPE html>

<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../css/empresa.css" />
        <link rel="stylesheet" href="../css/navbar.css" />
        <title>Empresas</title>
    </head>
    <body>
        <header>
            <div class="navbar">
                <div class="left-nav">
                    <a href="../index.html" class="brand"
                       ><img
                            src="../img/logo.png"
                            alt="Logo"
                            class="logo"
                            height="30"
                            /></a>
                </div>

                <div class="nav-middle">
                    <nav class="nav-menu">
                        <a href="../index.html" class="nav-link">Home</a>
                        <a href="empressa.html" class="nav-link">Empresas</a>
                        <a href="../pages/browse.html" class="nav-link">Browse</a>
                        <a href="#" class="nav-link">Blog</a>
                    </nav>
                </div>

                <div>
                    <nav class="right-nav">
                        <a href="#" class="nav-link">Poste um Emprego</a>
                        <form action="./login.html">
                            <button class="btn-primary">Log in</button>
                        </form>
                    </nav>
                </div>
            </div>
        </header>
        <main>
            <div class="nav">
                <button id="prev" class="carousel-button-left btn"><</button>
                <button id="next" class="carousel-button-right btn">></button>
            </div>
            <form action="">
                <div class="infinite-carousel">
                    <div id="carousel" class="carousel-wrapper">
                        <div class="carousel-items">

                            <% 
                                EmpresasDAO dao = new EmpresasDAO();
                                List<EmpresasDTO> listar = dao.listar();
                            %>
                            <%
                                for (EmpresasDTO dados : listar) {

                            %>
                            <div class="carousel-block">
                                <p><%dados.getNomeEmpresa();%></p>
                                <p><%dados.getContato();%></p>
                                <p><%dados.getEmail();%></p>
                            </div>
                            <%};
                            %>
                        </div>

                    </div>
                </div>
            </form>
        </main> 
        <script src = "https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src = "../js/empresa.js"></script> 
    </body> 
</html>

