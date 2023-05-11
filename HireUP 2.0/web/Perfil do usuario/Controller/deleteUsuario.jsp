<%-- 
    Document   : deleteUsuario
    Created on : May 11, 2023, 9:34:00 PM
    Author     : godal
--%>

<%@page import="DAO.UsuariosDAO,DTO.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
                UsuariosDAO dao = new UsuariosDAO();
                UsuariosDTO dto = new UsuariosDTO();

                dto.setEmail(request.getParameter("inpEmail"));
                dao.deletarUsuario(dto);

                session.isNew();
                response.sendRedirect("../../index.html");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
