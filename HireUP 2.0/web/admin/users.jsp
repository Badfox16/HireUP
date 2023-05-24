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

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

        <title>USERS</title>

        <style>
            .usersLink{
                background-color: var(--primary-color) !important;
            }
            .usersIcon,
            .usersText{
                color: var(--sidebar-color) !important;
            }
            body.dark .usersIcon,
            body.dark .usersText, th{
                color: var(--text-color) !important;
            }
        </style>

    </head>

    <body>
        <%
            if(session.getAttribute("user")==null){
                response.sendRedirect("loginA.jsp");
            }

        %>

        <%@include file="header.jsp" %>

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

                
    </body>

</html>
