<%-- 
    Document   : searchResults
    Created on : 12 Apr 2023, 00:54:46
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultados</title>
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <link rel="stylesheet" href="../css/searchResults.css">
        <link rel="stylesheet" href="../css/navbar.css">
    
    
        <script
        src="https://kit.fontawesome.com/7a342b9685.js"
        crossorigin="anonymous"
      ></script>
    </head>
    <body>
        <section>
            <div class="navbar">
                <div class="left-nav">
                  <a href="../index.html" class="brand"><img src="../img/logo.png" alt="Logo" class="logo"  height="30"></a>
            
                </div>
            
                <div class="nav-middle">
                  <nav class="nav-menu">
                    <a href="../index.html" class="nav-link">Home</a>
                    <a href="#" class="nav-link">Empresas</a>
                    <a href="../pages/browse.html" class="nav-link">Pesquise</a>
                    <a href="#" class="nav-link">Perfil</a>
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
        
           <section class="search-title">
                <h2>Resultados da pesquisa</h2>
           </section>
           
           <section class="search">
            <form action="./searchResults.html" class="search1">
              <div class="input-wrapper">
                <span><i class="fa-solid fa-magnifying-glass"></i></span>
                <input type="search" name="pesquisa" placeholder="Pesquisar..." />
              </div>
              <button>pesquisar</button>
            </form>
          </section>
        
        
          <section>
        
            <div class="right-filter">
        
                <div class="mostrar-jobs">
                  <!-- listar jobs com jsp-->
                  <div class="card-jobs">
                    <div class="card-top">
                      <div>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" width="100%">
                      </div>
                      <span>Nome_Empresa</span>
                    </div>
                    <div class="card-middle">
                      <span>Front-end Developer</span>
                    </div>
                    <div class="card-category-and-type">
                      <div>Marketing</div>
                      <div>Part Time</div>
                    </div>
                    <div class="card-botttom">
                      <span><i class="fa-solid fa-coins"></i> <span class="dollar-sign"><i class="fa-solid fa-dollar-sign"></i></span> 150k <span>-</span> 200k </span>
                    </div>
                    <div class="card-ver-mais">
                      <form action="vermais.jsp" method="post">
                        <input type="hidden" name="">
                        <input type="hidden" name="">
                        <input type="hidden" name="">
                        <input type="hidden" name="">
                        <input type="hidden" name="">
                        
                        <button>Ver mais</button>
                      </form>
                    </div>
                  </div>
        
                  
        
                </div>
          </section>
    </body>
</html>
