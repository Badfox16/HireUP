<%-- 
    Document   : verifyUserEdit
    Created on : 14 May 2023, 13:29:23
    Author     : Pedro Nhamirre
--%>

<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verifyEditUser Page</title>
    </head>
    <body>
        <%

            String email = (String) request.getParameter("Email");
            String nome = (String) request.getParameter("Nome");
            String apelido = (String) request.getParameter("Apelido");
            String setor = (String) request.getParameter("Setor");
            String localizacao = (String) request.getParameter("Localizacao");
            String formacao = (String) request.getParameter("Formacao");

            UsuariosDTO usersDTO = new UsuariosDTO();
            usersDTO.setEmail(email);
            usersDTO.setNome(nome);
            usersDTO.setApelido(apelido);
            usersDTO.setSetor(setor);
            usersDTO.setLocalizacao(localizacao);
            usersDTO.setFormacao(formacao);

            UsuariosDAO usersDAO = new UsuariosDAO();
            usersDAO.editarUsuario(usersDTO);

            response.sendRedirect("users.jsp");
        %>
    </body>
</html>
