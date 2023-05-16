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
    <link rel="stylesheet" href="./css/loginAdmin.css">
    <title>Login Admin</title>
</head>

<body class="container-fluid d-flex align-items-center justify-content-center pt-7 flex-column">
    <h2 class="pt-5">LOGIN</h2>
    
    <form class="container" action="loginA.jsp">
      <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-md-5 col-md-5 login-box">
            <div class="col-lg-12 login-key">
                <i class="fa fa-key" aria-hidden="true"></i>
            </div>
            <div class="col-lg-12 login-title">
              PAINEL <br> 
              ADMINISTRADOR
            </div>

            <div class="col-lg-12 login-form">
                <div class="col-lg-12 login-form">
                    <form>
                        <div class="form-group">
                            <label class="form-control-label">USERNAME</label>
                            <input name="username" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">SENHA</label>
                            <input name="senha" type="password" class="form-control" i>
                        </div>

                            <div class="col-lg-6 mx-4 login-btm login-button">
                                <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-md-2"></div>
        </div>
    </div>
      </form>
</body>

</html>
