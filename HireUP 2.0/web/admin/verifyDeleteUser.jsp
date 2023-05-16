<%-- 
    Document   : verifyDeleteUser
    Created on : 14 May 2023, 14:15:55
    Author     : Pedro Nhamirre
--%>

<%@page import="DAO.UsuariosDAO"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String email = request.getParameter("Email");
            String nome = request.getParameter("Nome");
            String apelido = request.getParameter("Apelido");
            String setor = request.getParameter("Setor");
            String localizacao = request.getParameter("Localizacao");
            String formacao = request.getParameter("Formacao");

            UsuariosDTO usersDTO = new UsuariosDTO();
            usersDTO.setEmail(email);
            usersDTO.setNome(nome);
            usersDTO.setApelido(apelido);
            usersDTO.setSetor(setor);
            usersDTO.setLocalizacao(localizacao);
            usersDTO.setFormacao(formacao);

            UsuariosDAO usersDAO = new UsuariosDAO();
            usersDAO.deletarUsuario(usersDTO);

            response.sendRedirect("users.jsp");
        %>
    </body>
</html>
