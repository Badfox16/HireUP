<%-- 
    Document   : index
    Created on : May 19, 2023, 5:27:28 PM
    Author     : godal
--%>

<%@page import="DAO.EmpresasDAO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("mail") == null) {
        response.sendRedirect("../pages/login.jsp");
    }

    String login = (String) session.getAttribute("mail");
    UsuariosDTO objUsuarioDTO = new UsuariosDTO();

    objUsuarioDTO.setEmail(login);

    List<UsuariosDTO> listarUsuario = (List<UsuariosDTO>) new UsuariosDAO().perfilUsuario(objUsuarioDTO);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <form action="Controller/submitComentario.jsp" method="get">
            <%
                for (UsuariosDTO listarUsuarios : listarUsuario) {
            %>
            <input type="hidden" name="inpIdUsuario" value="<%=listarUsuarios.getIdUsuario()%>"/>
            <%};%>
            <textarea name="inpComentario" placeholder="Bora porra" cols="55" rows="15">  
            </textarea>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
