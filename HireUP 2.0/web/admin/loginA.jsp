<%-- 
    Document   : loginA
    Created on : 16 May,2023, 16:52:44
    Author     : mutizo
--%>
<%@page import="DAO.AdminDAO"%>
<%@page import="DTO.AdminDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Admin</title>
    </head>
    <body>
        <%
            AdminDTO objAdminDTO = new AdminDTO();
            objAdminDTO.setUsername(request.getParameter("username"));
            objAdminDTO.setSenha(request.getParameter("senha"));
            
            AdminDAO objUsuariosDAO = new AdminDAO();
            ResultSet rSetUSR = objUsuariosDAO.LoginAdmin(objAdminDTO);
            
            if (rSetUSR.next()) {
              
                session = request.getSession();
                session.setAttribute("user", objAdminDTO.getUsername());
                
                response.sendRedirect("admin.jsp");
                   
                } else {
                 response.sendRedirect("login-admin.jsp");
                  
                }
        
        %>
    </body>
</html>
