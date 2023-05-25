<%-- 
    Document   : admin
    Created on : 9 May 2023, 14:48:52
    Author     : Pedro Nhamirre
--%>

<%@page import="javax.servlet.annotation.WebServlet"%>
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

            body {
                background: black;
            }

            .clock {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translateX(-50%) translateY(-50%);
                color: #17D4FE;
                font-size: 60px;
                font-family: Orbitron;
                letter-spacing: 7px;



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

            <div id="MyClockDisplay" class="clock" onload="showTime()"></div>

        </div>

        <script>
            function showTime() {
                var date = new Date();
                var h = date.getHours(); // 0 - 23
                var m = date.getMinutes(); // 0 - 59
                var s = date.getSeconds(); // 0 - 59
                var session = "AM";

                if (h == 0) {
                    h = 12;
                }

                if (h > 12) {
                    h = h - 12;
                    session = "PM";
                }

                h = (h < 10) ? "0" + h : h;
                m = (m < 10) ? "0" + m : m;
                s = (s < 10) ? "0" + s : s;

                var time = h + ":" + m + ":" + s + " " + session;
                document.getElementById("MyClockDisplay").innerText = time;
                document.getElementById("MyClockDisplay").textContent = time;

                setTimeout(showTime, 1000);

            }

            showTime();
        </script>
    </body>

</html>
