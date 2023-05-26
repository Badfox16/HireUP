<%-- 
    Document   : submitJob
    Created on : 18 Apr 2023, 15:48:43
    Author     : Pedro Nhamirre
--%>
<%@page import="java.util.List"%>
<%@ page import="DTO.EmpresasDTO" %>
<%@ page import="DAO.EmpresasDAO" %>
<%@ page import="DTO.EmpregosDTO" %>
<%@ page import="DAO.EmpregosDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Candidaturas</title>
        <link rel="stylesheet" href="./css/candidatura.css" />
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <script
            src="https://kit.fontawesome.com/7a342b9685.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>

        <%
            if (session.getAttribute("email") == null) {
                response.sendRedirect("loginRemake.jsp");
            }

        %>
        <header>  <%@include file="header_empresa.jsp" %> </header>
            <%              EmpresasDAO dao = new EmpresasDAO();
                EmpresasDTO listarDTO = new EmpresasDTO();
                String a = "";
                a = (String) session.getAttribute("email");
                listarDTO.setEmail(a);
                List<EmpresasDTO> listaEmpresas = (List<EmpresasDTO>) dao.perfilEmpresa(listarDTO);
            %>

        <% for (EmpresasDTO empresa : listaEmpresas) {%>
        <div class="content">
            <div class="left">
                <div class="card">
                    <div class="infos">
                        <div class="info">
                            <div>
                                <p>
                                    <%= empresa.getNomeEmpresa()%>
                                </p>
                                <p class="function">
                                    ${email}
                                </p>
                            </div>
                            <div class="stats">
                                <p class="flex flex-col">
                                    Candidaturas
                                    <span class="state-value">
                                        <%= empresa.getCandidaturas()%>
                                    </span>
                                </p>
                                <p class="flex">
                                    Empregos
                                    <span class="state-value">
                                        <%= empresa.getEmpregos()%>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <button class="request" type="button">
                        Editar Perfil
                    </button>
                </div>
            </div>
            <div class="right">

                <!-- Conteúdo da seção 'right' -->
                <form action="submitJobController.jsp">
                    <div class="card">
                        <span class="title">🍪 Cookie Notice</span>
                        <p class="description">We use cookies to ensure that we give you the best experience on our website. </p>
                        <div class="actions">
                            <a class="prefs">
                                Ver Perfil
                            </a>
                            <button class="decline">
                                Recusar
                            </button>
                            <button class="valid">
                                Aceitar
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <% }%>





    </body>
</html>

