<%@page import="DAO.EmpregosDAO"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="DTO.EmpresasDTO" %>
<%@ page import="DAO.EmpresasDAO" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/empregos.css">
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" class="hr1" />
        <title>Sign Up</title>
    </head>

    <body>
        <%
            if (session.getAttribute("email") == null) {
                response.sendRedirect("loginRemake.jsp");
            }

        %>
        <%@ include file="header_empresa.jsp" %>
        <%        EmpresasDAO dao = new EmpresasDAO();
            EmpresasDTO listarDTO = new EmpresasDTO();
            String a = "";
            a = (String) session.getAttribute("email");
            listarDTO.setEmail(a);
            List<EmpresasDTO> listaEmpresas = (List<EmpresasDTO>) dao.perfilEmpresa(listarDTO);
        %>

        <%
            String nomeEmpresa = (String) session.getAttribute("email"); // Defina o nome da empresa aqui
            
            EmpregosDAO empregosDAO = new EmpregosDAO();
            EmpregosDTO empregosDTO = new EmpregosDTO();
            empregosDTO.setEmpresa(a);
            List<EmpregosDTO> listaEmpregos = (List<EmpregosDTO>) empregosDAO.perfilEmprego(empregosDTO);   
         
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
  <% for (EmpregosDTO emprego : listaEmpregos) {%>
                <!-- Conteúdo da seção 'right' -->
                <div class="courses-container">
                    <div class="course">
                        <div class="course-preview">
                            <h6><%= emprego.getEmpresa()%></h6>
                            <h2><%= emprego.getSetor()%></h2>
                            <a href="#" role="button">Apagar vaga <i class="fas fa-chevron-right"></i></a>
                        </div>
                        <div class="course-info">
                            <div class="progress-container">
                                <div class="progress"></div>
                                <span class="progress-text">
                                    <%= emprego.getSalarioMin()%> <span>-</span> <%= emprego.getSalarioMax()%>
                                </span>
                            </div>
                            <h6><%= emprego.getLocalizacao()%></h6>
                            <h2><%= emprego.getPosicao()%></h2>
                            <button class="btn">Editar</button>
                        </div>
                    </div>
                </div>
               <% } %>
                
            </div>
        </div>
                             
        <% }%>
    </body>


</html>