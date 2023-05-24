<%-- 
    Document   : admin
    Created on : 9 May 2023, 14:48:52
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

        <title>HOME</title>

        <style>
            .homeLink{
                background-color: var(--primary-color) !important;
            }
            .homeIcon,
            .homeText{
                color: var(--sidebar-color) !important;
            }
            body.dark .homeIcon,
            body.dark .homeText, th{
                color: var(--text-color) !important;
            }
        </style>
    </head>

    <body>

        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("loginA.jsp");
            }

        %>

        <%@include file="header.jsp" %>

        <!-- Painel Dashboard -->
        <div class="home panel" id="dashboard"  style="display: block;" >
            <h2 class="text">Welcome</h2>
            <p>bien venido</p>

        </div>


    </body>

</html>
