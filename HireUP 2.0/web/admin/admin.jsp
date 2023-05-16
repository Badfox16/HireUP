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



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

    <title>ADMIN</title>
</head>

<body>
    
    <%@include file="header-admin.jsp" %>

    <%
            if(session.getAttribute("user")==null){
                response.sendRedirect("loginA.jsp");
            }

        %>
    
    <div class="container-fluid mt-lg-5 mb-lg-5 d-flex flex-wrap">
        <a href="users.jsp" class="m-5">
            <div class="card btn" style="width: 18rem;">
                <img src="https://www.freeiconspng.com/uploads/--tie-user-users-work-worker-working-icon--icon-search-engine-6.png"
                    class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">USERS</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
        </a>


        <a href="empresas.jsp" class="m-5">
            <div class="card btn" style="width: 18rem;">
                <img src="https://www.freeiconspng.com/uploads/address-building-company-home-house-office-real-estate-icon--10.png"
                    class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">EMPRESAS</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
        </a>

        <a href="empregos.jsp" class="m-5">
            <div class="card btn" style="width: 18rem;">
                <img src="https://www.freeiconspng.com/uploads/contract-icon-12.png"
                    class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-primary text-decoration-none">EMPREGOS</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
        </a>

    </div>

</body>

</html>
