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
    <title>Submit a job</title>
    <link rel="stylesheet" href="../css/submitJob.css" />
    <link rel="stylesheet" href="../css/navbar.css" />
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
    <section>
      <div class="navbar">
        <div class="left-nav">
          <a href="../index.html" class="brand"
            ><img src="../img/logo.png" alt="Logo" class="logo" height="30"
          /></a>
        </div>

        <div class="nav-middle">
          <nav class="nav-menu">
        <a href="../index.html" class="nav-link">Home</a>
        <a href="./empresa.jsp" class="nav-link">Empresas</a>
        <a href="./browse.jsp" class="nav-link">Pesquise</a>
        <a href="./subEmpresa.html" class="nav-link">Submeter Empresa</a>
      </nav>
        </div>

        <div>
          <nav class="right-nav">
            <a href="#" class="nav-link">Poste um Emprego</a>
            <form action="./login.html">
              <button class="btn-primary">Log in</button>
            </form>
          </nav>
        </div>
      </div>
    </section>

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
               
                <div>
                    <label for="titulo">Título emprego</label>
                    <input name="titulo" id="titulo" type="text" required>
                </div>
                
                <div>
                    <label for="cargo">Cargo</label>
                    <input name="posicao" id="cargo" type="text" required>
                </div>

                <div>
                    <label for="min-salario">Salário mínimo</label>
                    <input name="salario_min" id="min-salario" type="number" min="5000" required>
                </div>

                <div>
                    <label for="max-salario">Salário máximo</label>
                    <input name="salario_max" id="max-salario" type="number" min="5000" required>
                </div>

                
                <div>
                    <select name="categoria" id="categoria" required>
                        <option selected disabled>Selecionar categoria:</option>
                        <option value="TI">TI</option>
                        <option value="Automovel">Automovel</option>
                        <option value="Culinaria">Culinária</option>
                        <option value="Agricultura">Agricultura</option>
                        <option value="Lazer">Lazer</option>
                        <option value="Saude">Saúde</option>
                        <option value="Gestão">Gestão</option>
                        <option value="Direito">Direito</option>
                        <option value="Outro">Outro</option>
                        
                    </select>
                </div>

                <div>
                    <label for="location">Localização</label>
                    <input id="location" name="localizacao" placeholder="Beira" type="text" required>
                </div>

                <div>
                    <select name="tipo" id="tipo-emprego" required>
                        <option selected disabled>Selecione o tipo de emprego:</option>
                        <option value="Full Time">Full time</option>
                        <option value="Part Time">Part Time</option>
                    </select>
                </div>

                <div>
                    <label for="requisitos">Requisitos do emprego:</label>
                    <textarea required name="requisitos" id="requisitos" cols="30" rows="15" placeholder="Digite os requisitos necessários que a empresa precisa"></textarea>
                </div>

                <div>
                    <label for="descricao">Descrição do emprego:</label>
                    <textarea name="descricao" id="descricao" cols="30" rows="15" placeholder="Digite as obrigações do funcionário" required></textarea>
                </div>

                <div>
                    <button>Submeter</button>
                </div>
            </form>
        </div>

    </section>

    
  </body>
</html>

