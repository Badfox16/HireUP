
<%@page import="DAO.UsuariosDAO"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            UsuariosDTO objUsuariosDTO = new UsuariosDTO();
            objUsuariosDTO.setEmail(request.getParameter("email"));
            objUsuariosDTO.setSenha(request.getParameter("senha"));
            
            UsuariosDAO objUsuariosDAO = new UsuariosDAO();
            ResultSet rSetUSR = objUsuariosDAO.LoginUsr(objUsuariosDTO);
            
            if (rSetUSR.next()) {
                    response.sendRedirect("browse.html");
                   
                } else {
                 RequestDispatcher rd = request.getRequestDispatcher("login.html");
                 out.println("<script> alert('Falha no Login, verifique o email ou senha') </sript>");
                    rd.forward(request, response);
                }
        
        %>
    </body>
</html>
