<%-- 
    Document   : RedirecionarPesquisa
    Created on : 12 Apr 2023, 00:52:32
    Author     : Pedro Nhamirre
--%>

<%@page import="java.util.*"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page import="DAO.EmpregosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        EmpregosDAO dao = new EmpregosDAO();
        
        List<EmpregosDTO> lista = (List<EmpregosDTO>) dao.pesquisarEmpregos( request.getParameter("pesquisa"));
        
        
        
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
        %>
    </body>
</html>
