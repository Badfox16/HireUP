<%-- 
    Document   : updateUsuario
    Created on : May 11, 2023, 8:38:39 PM
    Author     : godal
--%>

<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>
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

                dto.setNome(request.getParameter("inpNome"));
                dto.setApelido(request.getParameter("inpApelido"));
                dto.setEmail(request.getParameter("inpEmail"));
                dto.setLocalizacao(request.getParameter("inpLocalizacao"));
                dto.setSetor(request.getParameter("inpSetor"));
                dto.setSenha(request.getParameter("inpSenha"));
                dto.setFormacao(request.getParameter("inpFormacao"));
                dto.setDescricao(request.getParameter("inpDescricao"));
                dao.editarUsuario(dto);

                response.sendRedirect("../index.jsp");
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
