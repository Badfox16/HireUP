<%-- 
    Document   : submitComentario
    Created on : May 21, 2023, 1:31:15 PM
    Author     : godal
--%>

<%@page import="DTO.ComentariosDTO"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DAO.ComentariosDAO"%>
<%@page import="DTO.EmpresasDTO"%>
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
            try {
                ComentariosDAO objComentarioDAO = new ComentariosDAO();
                ComentariosDTO objComentarioDTO = new ComentariosDTO();

                objComentarioDTO.setComentario(request.getParameter("inpComentario"));
                objComentarioDTO.setData(request.getParameter("inpData"));
                objComentarioDTO.setIdUsuarioFK(Integer.parseInt(request.getParameter("inpIdUsuario")));

                objComentarioDAO.comentarioUsuario(objComentarioDTO);

                response.sendRedirect("../index.jsp");
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "SQL ERRO EM" + e.getMessage());
            }
        %>


    </body>
</html>
