<%-- 
    Document   : vermais
    Created on : 11 Apr,2023, 19:26:17
    Author     : mutizo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver mais</title>
    </head>
    <body>
       <%
           request.setCharacterEncoding("UTF-8");
    
            request.getRequestDispatcher("applyTo.jsp").forward(request, response);
       
       %>
    </body>
</html>
