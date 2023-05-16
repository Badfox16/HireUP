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
            try {
                UsuariosDTO usersDTO = new UsuariosDTO();
                
                usersDTO.setEmail(request.getParameter("Email"));
                usersDTO.setNome(request.getParameter("Nome"));
                usersDTO.setApelido(request.getParameter("Apelido"));
                usersDTO.setSetor(request.getParameter("Setor"));
                
                UsuariosDAO usersDAO = new UsuariosDAO();
                usersDAO.editarUsuario(usersDTO);

                response.sendRedirect("users.jsp");
            } catch (Exception e) {
            }
            UsuariosDTO usersDTO = new UsuariosDTO();

            UsuariosDAO usersDAO = new UsuariosDAO();
            usersDAO.editarUsuario(usersDTO);

            response.sendRedirect("users.jsp");
        %>
    </body>
</html>
