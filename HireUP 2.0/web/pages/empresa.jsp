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
        <script src="https://kit.fontawesome.com/1f168297b1.js" crossorigin="anonymous"></script>



        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>


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
            
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>


        <div class="firstTitle">
            <h1>Empresas Parceiras</h1>
        </div>


        <div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">

            <div class="carousel-inner">
                <%        int cardsPerItem = 3;
                    EmpresasDAO empresaDAO = new EmpresasDAO();
                    List<EmpresasDTO> lista = (List<EmpresasDTO>) empresaDAO.listar();

                    for (int i = 0; i < lista.size(); i += cardsPerItem) {
                        if (i == 0) {
                %>
                <div class="carousel-item active">
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
                            <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" class="card-img-top" alt="..." style="padding: 1rem;">
                            <div class="card-body">
                                <h5 class="card-title"><%= empresa.getNomeEmpresa()%></h5>
                            </div>
                        </div>
                        <% } %>
                        <% }%>
                    </div>
                </div>
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

