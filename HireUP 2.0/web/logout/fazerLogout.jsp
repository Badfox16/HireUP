<%-- 
    Document   : fazerLogout
    Created on : May 25, 2023, 5:37:58 PM
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Obtém a sessão atual
    request.getSession(false);

    if (session != null) {
        // Limpa todos os atributos da sessão
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Minha Página</title>


        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container{
                position: relative;
                height: 100vh;
                width: 100%;
                user-select:none;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                font-size: 2.5rem;
     
            }

            .lds-dual-ring {
                display: inline-block;
                width: 80px;
                height: 80px;
                margin-bottom: 25rem;
                margin-right: 12rem;
            }
            .lds-dual-ring:after {
                content: " ";
                display: block;
                width: 254px;
                height: 254px;
                margin: 8px;
                border-radius: 50%;
                border: 6px solid #000;
                border-color: #000 transparent #000 transparent;
                animation: lds-dual-ring 1.2s linear infinite;
            
            }
            @keyframes lds-dual-ring {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

        </style>



        <script>
            var seconds = 3; // Tempo inicial em segundos

            function updateSeconds() {
                var secondsElement = document.getElementById("seconds");
                secondsElement.textContent = seconds;

                seconds--; // Decrementa os segundos

                if (seconds < 0) {
                    clearInterval(intervalId); // Para a contagem regressiva
                    window.location.href = "../pages/login.html"; // Redireciona para a página de login
                }
            }

            // Inicia a contagem regressiva e atualiza a cada segundo
            var intervalId = setInterval(updateSeconds, 1000);
        </script>
    </head>


    <body>

        <div class="container">



            <div class="lds-dual-ring"></div>

            <!-- Resto do conteúdo da página -->

            <p>Você será redirecionado para a página de login em <span style="color: red; font-weight: bold;" id="seconds">3</span> segundos.</p>

        </div>

    </body>
</html>