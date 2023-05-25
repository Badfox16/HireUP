<%-- 
    Document   : loginBeans
    Created on : 25 May,2023, 16:10:35
    Author     : mutizo
--%>


<%@page import="java.util.List"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A carregar...</title>
    </head>
    <body>
        <%       
            
            
            EmpresasDTO objEmpresasDTO = new EmpresasDTO();
            objEmpresasDTO.setEmail(request.getParameter("email"));
            objEmpresasDTO.setSenha(request.getParameter("senha"));
            
            EmpresasDAO objEmpresasDAO = new EmpresasDAO();
            ResultSet rSetUSR = objEmpresasDAO.LoginEmpresa(objEmpresasDTO);
            
            if (rSetUSR.next()) {
              
                session = request.getSession();
                session.setAttribute("email", objEmpresasDTO.getEmail());
                
                response.sendRedirect("emprego.jsp");
                   
                } else {
                 response.sendRedirect("loginBeans.jsp");
                 
                  
                }
                
        %>
    </body>
</html>
