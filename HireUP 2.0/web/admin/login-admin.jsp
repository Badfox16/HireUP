<%-- 
    Document   : login-admin
    Created on : 9 May 2023, 15:30:08
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
    <title>Login Admin</title>
</head>

<body class="container-fluid d-flex align-items-center justify-content-center pt-5 flex-column">
    <h2 class="pt-5">LOGIN</h2>
    
    <form class="pt-5" action="admin.jsp">
        <div class="mb-3">
          <label for="adminuser" class="form-label">Username</label>
          <input type="text" class="form-control" id="adminuser" aria-describedby="emailHelp" required>
          <div id="emailHelp" class="form-text">Seu username é unico, coloque de forme bonita e correcta! ❤️</div>
        </div>
        <div class="mb-3">
          <label for="adminpass" class="form-label">Password</label>
          <input type="password" class="form-control" id="adminpass" required>
        </div>
      
        <button type="submit" class="btn btn-primary w-100" >Submit</button>
      </form>
</body>

</html>
