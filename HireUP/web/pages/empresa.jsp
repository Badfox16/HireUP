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
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <title>Empresas</title>
    </head>
    <body>
         
        <%
            if(session.getAttribute("mail")==null){
                response.sendRedirect("login.jsp");
            }

        %>
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
                        <a href="./empresa.jsp" class="nav-link">Empresas</a>
                        <a href="./browse.jsp" class="nav-link">Pesquise</a>
                        <a href="./subEmpresa.html" class="nav-link">Submeter Empresa</a>
                    </nav>
                </div>

                <div>
                    <nav class="right-nav">
                        <a href="./submitJob.jsp" class="nav-link">Poste um Emprego</a>
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
                                List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.listar();
                            %>
                            <%
                                for (EmpresasDTO lister : listar) {

                            %>
                            <div class="carousel-block">
                                <p> <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" width="25%">
                                <p/>
                                <p><%=lister.getNomeEmpresa()%></p>
                                <p><%=lister.getContato()%></p>
                                <p><%=lister.getEmail()%></p>
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

