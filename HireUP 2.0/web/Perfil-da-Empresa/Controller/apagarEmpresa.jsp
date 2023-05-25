<%-- 
    Document   : apagarEmpresa
    Created on : May 11, 2023, 8:23:39 PM
    Author     : godal
--%>

<%@page import="DTO.EmpresasDTO"%>
<%@page import="DAO.EmpresasDAO"%>
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
                EmpresasDAO dao = new EmpresasDAO();
                EmpresasDTO dto = new EmpresasDTO();
                
                dto.setIdEmpresa(Integer.parseInt(request.getParameter("inpIdEmpresa")));
                dao.deletEmpresa(dto);
                
                session.isNew();
                response.sendRedirect("../../index.html");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>

    </body>
</html>
