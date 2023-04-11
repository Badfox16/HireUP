<%-- 
    Document   : submitJob
    Created on : 11 Apr 2023, 23:08:43
    Author     : Pedro Nhamirre
--%>

<%@page import="DAO.EmpregosDAO"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controller submit</title>
    </head>
    <body>
        <%
            String titulo = request.getParameter("titulo");
            String posicao = request.getParameter("posicao");
            int salario_min = Integer.parseInt(request.getParameter("salario_min"));
            int salario_max = Integer.parseInt(request.getParameter("salario_max"));
            String categoria = request.getParameter("categoria");
            String localizacao = request.getParameter("localizacao");
            String tipo = request.getParameter("tipo");
            String requisitos = request.getParameter("requisitos");
            String descricao = request.getParameter("descricao");
            
            EmpregosDTO newEmprego = new EmpregosDTO();
            newEmprego.setTitulo(titulo);
            newEmprego.setPosicao(posicao);
            newEmprego.setSalarioMin(salario_min);
            newEmprego.setSalarioMax(salario_max);
            newEmprego.setCategoria(categoria);
            newEmprego.setLocalizacao(localizacao);
            newEmprego.setTipo(tipo);
            newEmprego.setRequisitos(requisitos);
            newEmprego.setDescricao(descricao);
            

            EmpregosDAO dao = new EmpregosDAO();
            dao.Cadastrar(newEmprego);
            
            response.sendRedirect("browse.jsp");
        %>
        
    </body>
</html>
