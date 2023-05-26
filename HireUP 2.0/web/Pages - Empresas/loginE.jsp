<%-- 
    Document   : loginE
    Created on : 26 May,2023, 03:26:26
    Author     : mutizo
--%>
<%@page import="java.util.List"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%       
            
            EmpresasDTO objEmpresasDTO = new EmpresasDTO();
            objEmpresasDTO.setEmail(request.getParameter("email"));
            objEmpresasDTO.setSenha(request.getParameter("senha"));
            
            EmpresasDAO objEmpresasDAO = new EmpresasDAO();
            EmpresasDTO resultadoLogin = objEmpresasDAO.LoginEmpresa(objEmpresasDTO);
            
            if (resultadoLogin != null) {
              
                session = request.getSession();
               
                session.setAttribute("email", objEmpresasDTO.getEmail());
               
                response.sendRedirect("empregos.jsp");
                   
                } else {
                 response.sendRedirect("loginRemake.jsp");
                 
                  
                }
                
        %>
    </body>
</html>
