
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/header.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="navbar">
            <div class="left-nav">
                <a href="#" class="brand"><img src="./img/recursos-humanos.png" alt="Logo" class="logo" height="30"></a>
            </div>
            <div class="nav-middle">
                <nav class="nav-menu">
                    <a href="../index.jsp" class="nav-link">Home</a>
                    <a href="/candidaturas.jsp" class="nav-link">Candidaturas</a>
                    <a href="./emprego.jsp" class="nav-link">Empregos</a>
                    <a href="./criarvagas.jsp" class="nav-link">Criar vagas</a>
                </nav>
            </div>
            <div>
                <nav class="right-nav">
                    <a href="./submitJob.jsp" class="nav-link">Poste um Emprego</a>
                    <form action="./signupEmpresa.jsp" method="get">
                        <button class="btn-primary">Log out</button>
                    </form>
                </nav>
            </div>
        </div>
    </body>
</html>
