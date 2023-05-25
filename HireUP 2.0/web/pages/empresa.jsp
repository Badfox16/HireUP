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
    </head>
    <body>

        <%@include file="header.jsp" %>

        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
            <div class="carousel-indicators">

                <%                    EmpresasDAO dao = new EmpresasDAO();
                    List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.listar();

                    int count = 0;

                    for (int i = 0; i < listar.size(); i++) {
                        count++;

                        if (count == 1) {
                %>        
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>

                <%
                    }
                %>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide <%=count%>"></button>
                <%};
                %>
            </div>

            <div class="carousel-inner">
                <%
                    for (int i = 0; i < listar.size(); i++) {

                        EmpresasDTO lister = listar.get(i);

                        if (i == 0) {
                %>

                <div class="carousel-item active">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5><%=lister.getNomeEmpresa()%></h5>
                        <p><%=lister.getEmail()%></p>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="carousel-item">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Slide label</h5>
                        <p>Placeholder content for the slide.</p>
                    </div>
                </div>
                <%
                        }
                    }
                %>


            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
                
    </body> 
</html>

