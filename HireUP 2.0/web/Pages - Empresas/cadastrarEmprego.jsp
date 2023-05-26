<%-- 
    Document   : cadastrarEmprego
    Created on : 26 May,2023, 00:19:39
    Author     : mutizo
--%>
<%@ page import="DTO.EmpregosDTO" %>
<%@ page import="DAO.EmpregosDAO" %>
<%@ page import="DTO.EmpresasDTO" %>
<%@ page import="DAO.EmpresasDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Emprego</title>
    </head>
    <body>
        <%
// Obtendo os parâmetros do formulário
           

            String posicao = request.getParameter("posicao");
            String tipo = request.getParameter("tipo");
            int salarioMin = Integer.parseInt(request.getParameter("salario_min"));
            int salarioMax = Integer.parseInt(request.getParameter("salario_max"));
            String setor = request.getParameter("setor");
            String localizacao = request.getParameter("localizacao");
            String descricao = request.getParameter("descricao");
            String requisitos = request.getParameter("requisitos");

// Criando o objeto EmpregosDTO com os dados do formulário
            EmpregosDTO emprego = new EmpregosDTO();
            emprego.setPosicao(posicao);
            emprego.setTipo(tipo);
            emprego.setSalarioMin(salarioMin);
            emprego.setSalarioMax(salarioMax);
            emprego.setSetor(setor);
            emprego.setLocalizacao(localizacao);
            emprego.setDescricao(descricao);
            emprego.setRequisitos(requisitos);
        %>

        <%
        // Chamando o método cadastrarEmprego
            try {
                EmpregosDAO empregoDAO = new EmpregosDAO(); // Crie uma instância da classe EmpregoDAO
                empregoDAO.cadastrarEmprego(emprego); // Chame o método cadastrarEmprego passando o objeto emprego

                // Redirecione para uma página de sucesso ou exiba uma mensagem informando que o cadastro foi realizado com sucesso
                response.sendRedirect("emprego.jsp");
            } catch (Exception e) {
                e.printStackTrace();

                // Redirecione para uma página de erro ou exiba uma mensagem informando que ocorreu um erro no cadastro
            }
        %>

    </body>
</html>
