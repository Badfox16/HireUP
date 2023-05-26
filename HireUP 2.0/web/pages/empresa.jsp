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
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <title>Empresas</title>

        <style>

            .firstTitle{
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 2rem;
                margin-top: 10rem;
            }

            #carouselExampleControls{
                margin-top: 8rem;
            }


            .card-title{
                font-size: 1.2rem;
                text-align: center;

            }

            .vermais{
                margin-top: 5rem !important;
                text-decoration: none;
                border: 1px solid #443fde;
                padding: 0.5rem;
                background-color: #443fdd;
                color: white;
                margin: 0 5rem;

            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>


        <div class="firstTitle">
            <h1>Empresas Parceiras</h1>
            <hr> 
        </div>


        <div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <form action="../Perfil da Empresa/detalhesEmpresa.jsp" method="POST">

                <div class="carousel-inner">
                    <%        int cardsPerItem = 3;
                        EmpresasDAO empresaDAO = new EmpresasDAO();
                        List<EmpresasDTO> lista = (List<EmpresasDTO>) empresaDAO.listar();

                        for (int i = 0; i < lista.size(); i += cardsPerItem) {
                            if (i == 0) {
                    %>
                    <div class="carousel-item active">
                        <input type="hidden" name="inpEmail" value="<%=lista.get(i).getEmail()%>"> <!--Selecionar a empresa -->
                        <div class="card-wrapper container-sm d-flex justify-content-around">
                            <% } else { %>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card-wrapper container-sm d-flex justify-content-around">
                            <% } %>

                            <% for (int j = i; j < Math.min(i + cardsPerItem, lista.size()); j++) {
                                    EmpresasDTO empresa = lista.get(j);
                            %>
                            <div class="card" style="width: 18rem;">
                                <img src="https://seeklogo.com/images/E/electricidade-de-mocambique-edm-logo-A6FAC89485-seeklogo.com.png?v=637896797820000000" class="card-img-top" alt="..." style="padding: 1.5rem;">
                                <div class="card-body">
                                    <h5 class="card-title"><%= empresa.getNomeEmpresa()%></h5>

                                    <br>
                                    <button class="btn btn-primary" style="margin-left: 26%">Saiba Mais </button>
                                </div>

                            </div>
                            <% } %>
                            <% }%>
                        </div>
                    </div>
            </form>
        </div>


        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</body> 
</html>

