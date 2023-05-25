<%-- 
    Document   : searchResults
    Created on : 12 Apr 2023, 00:54:46
    Author     : Pedro Nhamirre
--%>

<%@page import="DAO.EmpregosDAO"%>
<%@page import="java.util.*"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultados</title>
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <link rel="stylesheet" href="../css/searchResults.css">
        <link rel="stylesheet" href="../css/navbar.css">


        <script
            src="https://kit.fontawesome.com/7a342b9685.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>

        <%@include file="header.jsp" %>

        <section class="search-title">
            <h2>Resultados da pesquisa</h2>
        </section>

        <section class="search">
            <form action="RedirecionarPesquisa.jsp" class="search1">
                <div class="input-wrapper">
                    <span><i class="fa-solid fa-magnifying-glass"></i></span>
                    <input type="search" name="pesquisa" placeholder="Pesquisar..." />
                </div>
                <button>pesquisar</button>
            </form>
        </section>


        <section>

            <div class="right-filter">

                <div class="mostrar-jobs">
                    <!-- listar jobs com jsp-->

                    <%
                        EmpregosDAO dao = new EmpregosDAO();
                        String pesquisa = request.getParameter("pesquisa");
                        List<EmpregosDTO> teste = dao.pesquisarEmpregos(pesquisa);

                        if (teste.isEmpty()) {
                            out.print("<div class=\"card-jobs\"><h3>Nenhum dado existente encontrado</h3></div>");
                        } else {
                            for (EmpregosDTO novoDado : teste) {
                    %>

                    <div class="card-jobs">
                        <div class="card-top">
                            <div>
                                <img
                                    src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg"
                                    width="100%"
                                    />
                            </div>
                            <span> <%= novoDado.getEmpresa()%> </span>
                        </div>
                        <div class="card-middle">
                            <span><%= novoDado.getPosicao()%></span>
                        </div>
                        <div class="card-category-and-type">
                            <div><%= novoDado.getSetor()%> </div>
                            <div><%= novoDado.getTipo()%> </div>
                        </div>
                        <div class="card-botttom">
                            <span><i class="fa-sharp fa-solid fa-map-location"></i> <%= novoDado.getLocalizacao()%></span>
                            <div> 
                                <span class="dollar-sign"><i class="fa-solid fa-money-bill"></i></span>
                                <%= novoDado.getSalarioMin()%> <span>-</span> <%= novoDado.getSalarioMax()%> Mzn 
                            </div>
                        </div>
                        <div class="card-ver-mais">
                            <form action="vermais.jsp" method="post">
                                <input type="hidden" name="empresa" value="<%= novoDado.getEmpresa()%> ">
                                <input type="hidden" name="titulo" value="<%= novoDado.getTitulo()%> ">
                                <input type="hidden" name="posicao" value="<%= novoDado.getPosicao()%>">
                                <input type="hidden" name="categoria" value="<%= novoDado.getSetor()%>">
                                <input type="hidden" name="tipo" value="<%= novoDado.getTipo()%>">
                                <input type="hidden" name="salarioMin" value="<%= novoDado.getSalarioMin()%>">
                                <input type="hidden" name="salarioMax" value="<%= novoDado.getSalarioMax()%>">
                                <input type="hidden" name="descricao" value="<%= novoDado.getDescricao()%>">
                                <input type="hidden" name="localizacao" value="<%= novoDado.getLocalizacao()%>">
                                <input type="hidden" name="requisitos" value="<%= novoDado.getRequisitos()%>">

                                <button>Ver mais</button>
                            </form>
                        </div>
                    </div>

                    <% }
                        }%>

                </div>
        </section>
    </body>
</html>
