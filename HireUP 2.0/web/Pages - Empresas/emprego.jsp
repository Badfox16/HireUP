<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="DTO.EmpresasDTO,DAO.EmpresasDAO,java.util.*" %>
<%@page import="java.sql.*"%>
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
        <%@include file="header_empresa.jsp" %>
       <%
                    EmpresasDAO dao = new EmpresasDAO();
                    EmpresasDTO dto = new EmpresasDTO();
                    String email = (String) session.getAttribute("mail");
                    dto.setEmail(email);
                    List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.perfilEmpresa(dto);
                %>
                <%
                    for (EmpresasDTO lister : listar) {
                %>
            <div class="content">
                <div class="left">

                    <div class="card">
                        <div class="infos">
                            
                            <div class="info">
                                <div>
                                    <p class="name">
                                        <%= lister.getNomeEmpresa() %>
                                    </p>
                                    <p class="function">
                                        ${email}
                                    </p>
                                </div>
                                <div class="stats">
                                    <p class="flex flex-col">
                                        Candidaturas
                                        <span class="state-value">
                                            34
                                        </span>
                                    </p>
                                    <p class="flex">
                                        <%= lister.getEmpregos() %>
                                        <span class="state-value">
                                            <%= lister.getCategorias() %>
                                        </span>
                                    </p>

                                </div>
                            </div>
                        </div>
                        <button class="request" type="button">
                            Editar Perfil
                        </button>
                        <% } ;%>
                    </div>
                </div>
                <div class="right">

                </div>
            </div>
    </body>

    </html>