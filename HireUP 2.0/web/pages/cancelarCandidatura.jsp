<%-- 
    Document   : cancelarCandidatura
    Created on : May 26, 2023, 9:19:22 AM
    Author     : Pedro Nhamirre
--%>
<%@ page import="DAO.CandidaturasDAO" %>
<%@ page import="DTO.CandidaturasDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Recuperar o ID da candidatura a ser excluída
            int idCandidatura = Integer.parseInt(request.getParameter("idCandidatura"));

            // Excluir a candidatura
            CandidaturasDAO candidaturasDAO = new CandidaturasDAO();
            candidaturasDAO.deletarCandidatura(idCandidatura);

            // Redirecionar de volta para a página de listagem de candidaturas
            response.sendRedirect("candidaturas.jsp");
        %>
    </body>
</html>




