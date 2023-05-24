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

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/header.css">
        <title>Empresas</title>

        <style>
            .empresasLink{
                background-color: var(--primary-color) !important;
            }
            .empresasIcon,
            .empresasText{
                color: var(--sidebar-color) !important;
            }
            body.dark .empresasIcon,
            body.dark .empresasText, th{
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

    </body>

</html>
