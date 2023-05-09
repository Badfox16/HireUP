<%-- 
    Document   : newjsp
    Created on : 09 May,2023, 16:29:09
    Author     : mutizo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% String src = "./img/logo.png";
            
        %>
        <img src="<% out.print(src); %> " alt="Alright"/>
    </body>
</html>
