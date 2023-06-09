<%-- 
    Document   : verifyDeleteUser
    Created on : 14 May 2023, 14:15:55
    Author     : Pedro Nhamirre
--%>
<%@page import="java.sql.SQLException" %>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE USER</title>
    </head>
    <body>
        <%
            if(session.getAttribute("user")==null){
                response.sendRedirect("loginA.jsp");
            }
            
            request.setCharacterEncoding("UTF-8");
            
            try{
                UsuariosDTO usersDTO = new UsuariosDTO();

                usersDTO.setEmail(request.getParameter("Email"));
                usersDTO.setNome(request.getParameter("Nome"));
                usersDTO.setApelido(request.getParameter("Apelido"));
                usersDTO.setSetor(request.getParameter("Setor"));
                usersDTO.setLocalizacao(request.getParameter("Localizacao"));
                usersDTO.setFormacao(request.getParameter("Formacao"));

                UsuariosDAO usersDAO = new UsuariosDAO();
                usersDAO.deletarUsuario(usersDTO);

                response.sendRedirect("users.jsp");
            }catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + e.getMessage());
            }
        %>
    </body>
</html>
