<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/login_empresa.css">
  <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
  <title>Login</title>
</head>

<body>
  <%@include file="header_empresa.jsp" %>

  </div>

  <div class="content">
    <div class="left">
      <div class="form-block">
        <div class="form-title">
          <h3>Login</h3>
          <p>Faça login e comece a gerir o perfil da sua empresa!</p>
        </div>
        <form action="loginBeans.jsp" method="post">
          <label for="email">Email</label>
          <input type="email" name="email" maxlength="120" required="" placeholder="" id="email" class="form-field w-input">
          <label for="password">Senha</label>
          <input type="password" name="senha" id="password"  required="" maxlength="80" class="form-field w-input" placeholder="">
          <input type="submit" value="Login" data-wait="Por favor aguarde..." class="btn-primary w-button">
        </form>
        <div class="form-footer">
          <span class="text">Nao tem uma conta?</span>
          <a href="./signupEmpresa.jsp">Faça o Sign Up</a>
        </div>
      </div>
    </div>
    
    <div class="right">
      <div class="content-block">
        <h1>Bem-vindo ao HireUP!</h1>
      </div>
    </div>
  </div>

  <script src="../js/navbar.js"></script>
</body>

</html>