<%-- 
    Document   : processaDados
    Created on : 9 May 2023, 23:54:03
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
           request.getRequestDispatcher("users.jsp").forward(request, response); 
       %>
    </body>
</html>
