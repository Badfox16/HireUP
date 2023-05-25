<%-- 
    Document   : submitJob
    Created on : 18 Apr 2023, 15:48:43
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Candidaturas</title>
    <link rel="stylesheet" href="../css/submitJob.css" />
    <link rel="stylesheet" href="./css/candidatura.css" />
    <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
    <script
      src="https://kit.fontawesome.com/7a342b9685.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
       
        <%
            if(session.getAttribute("mail")==null){
                response.sendRedirect("login.jsp");
            }

        %>
        <header>  <%@include file="header-admin.jsp" %> </header>

    <section>
      <div class="top-info">
        <div>
          <h2>Cadastrar emprego</h2>
        </div>
        <div>
          <p>
            "Não deixe seu negócio sem funcionários, preencha seu futuro
            conosco! Cadastre-se agora e comece a construir uma trajetória de
            sucesso."
          </p>
        </div>
      </div>
    </section>


    <section class="cadastrar-form-container">

        <div class="cadastrar-form">
            <div class="header-cadastrar">
                <div>
                    <span>1</span>
                </div>
                <h2>Informação de emprego</h2>
            </div>
            <form action="submitJobController.jsp">
                <div class="card">
    <span class="title">🍪 Cookie Notice</span>
    <p class="description">We use cookies to ensure that we give you the best experience on our website. </p>
    <div class="actions">
        <a class="prefs">
            Ver Perfil
        </a>
        <button class="decline">
            Recusar
        </button>
        <button class="valid">
            Aceitar
        </button>
    </div>
</div>
            </form>
        </div>

    </section>

    
  </body>
</html>

