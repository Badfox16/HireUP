<%-- 
    Document   : listarComentario
    Created on : May 21, 2023, 3:51:41 PM
    Author     : godal
--%>

<%@page import="DTO.ComentariosDTO"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.ComentariosDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            ComentariosDAO dao = new ComentariosDAO();
            List<ComentariosDTO> objComentario = (List<ComentariosDTO>) dao.userComentario();
        %>

        <%
            for (ComentariosDTO listar : objComentario) {
        %>
        <div class="Exbir">
            <h1>Nome <%=listar.getNome()%></h1>
            <textarea cols="55" rows="25" readonly="true">
                <%=listar.getComentario()%>
            </textarea>
        </div>
        <%}%>
    </body>
</html>
