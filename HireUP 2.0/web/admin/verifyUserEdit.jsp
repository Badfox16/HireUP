<%-- 
    Document   : verifyUserEdit
    Created on : 14 May 2023, 13:29:23
    Author     : Pedro Nhamirre
--%>

<%@page import="java.sql.SQLException" %>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verifyEditUser Page</title>
    </head>
    <body>
        <%
         

            try {
                UsuariosDTO usersDTO = new UsuariosDTO();

                usersDTO.setEmail(request.getParameter("Email"));
                usersDTO.setNome(request.getParameter("Nome"));
                usersDTO.setApelido(request.getParameter("Apelido"));
                usersDTO.setSetor(request.getParameter("Setor"));
                usersDTO.setLocalizacao(request.getParameter("Localizacao"));
                usersDTO.setFormacao(request.getParameter("Formacao"));

                UsuariosDAO usersDAO = new UsuariosDAO();
                usersDAO.editarUsuario(usersDTO);


                response.sendRedirect("users.jsp");

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + e.getMessage());
            }

        %>
    </body>
</html>
