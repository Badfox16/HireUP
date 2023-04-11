<%-- 
    Document   : browse
    Created on : 12 Apr 2023, 00:17:31
    Author     : Pedro Nhamirre
--%>


<%@page import="java.util.*"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page import="DAO.EmpregosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Browse Jobs!</title>
        <link rel="stylesheet" href="../css/browse.css" />
        <link rel="stylesheet" href="../css/navbar.css" />
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <script
            src="https://kit.fontawesome.com/7a342b9685.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
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
                        <a href="#" class="nav-link">Empresas</a>
                        <a href="../pages/browse.jsp" class="nav-link">Pesquise</a>
                        <a href="#" class="nav-link">Blog</a>
                    </nav>
                </div>

                <div>
                    <nav class="right-nav">
                        <a href="submitJob.html" class="nav-link">Poste um Emprego</a>
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
                    <h2>Descubra as melhores ofertas de empregos para si</h2>
                </div>
                <div>
                    <p>
                        "A sua busca por emprego começa aqui. Conheça agora mesmo o nosso
                        website e encontre as melhores oportunidades de trabalho, de forma
                        fácil e rápida!" - ChatOpenAI, 2023.
                    </p>
                </div>
            </div>
        </section>
        <section class="search">
            <form action="RedirecionarPesquisa.jsp" class="search1">
                <div class="input-wrapper">
                    <span><i class="fa-solid fa-magnifying-glass"></i></span>
                    <input type="search" name="pesquisa" placeholder="Pesquisar..." />
                </div>
                <button>pesquisar</button>
            </form>
        </section>
        <section class="listar-jobs">
            <div class="background-listar-jobs">
                <div class="left-filters">
                    <div>
                        <p>
                            <span><i class="fa-solid fa-circle-info"></i></span>Filtrar vagas
                        </p>
                    </div>

                    <div class="div-filters">
                        <button onclick="mostrar()">
                            Job Types <span><i class="fa-solid fa-angle-down"></i></span>
                        </button>
                        <div class="checkbox-wrapper">
                            <div><input type="checkbox" /> <label>teste</label></div>
                        </div>
                        <hr />
                    </div>
                    <div class="div-filters">
                        <button onclick="mostrar()">
                            Roles <span><i class="fa-solid fa-angle-down"></i></span>
                        </button>
                        <div class="checkbox-wrapper">
                            <div><input type="checkbox" /> <label>teste</label></div>
                        </div>
                        <hr />
                    </div>

                    <div class="div-filters">
                        <button onclick="mostrar()">
                            Categories <span><i class="fa-solid fa-angle-down"></i></span>
                        </button>

                        <div class="checkbox-wrapper">
                            <div>
                                <input type="checkbox" id="Categories" />
                                <label for="Categories">teste</label>
                            </div>
                        </div>
                        <hr />
                    </div>
                </div>

                <div class="right-filter">
                    <div class="top-right-filter">
                        <h2>Vagas filtradas</h2>
                    </div>

                    <div class="mostrar-jobs">
                        <!-- listar jobs com jsp-->
                        
                        <%
                            EmpregosDAO dao = new EmpregosDAO();
                            List<EmpregosDTO> lista = (List<EmpregosDTO>) dao.listarEmpregos();
                            
                            if(lista.isEmpty() == true){
                                out.print("<div class=\"card-jobs\"><h3>nenhum dado existente encontrado</h3></div>");
                                
                            }else{
                            for (EmpregosDTO novoDado : lista){
                        %>
                        
                        
                        
                        
                        <div class="card-jobs">
                            <div class="card-top">
                                <div>
                                    <img
                                        src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg"
                                        width="100%"
                                        />
                                </div>
                                <span> <%= novoDado.getTitulo() %> </span>
                            </div>
                            <div class="card-middle">
                                <span><%= novoDado.getPosicao()%> </span>
                            </div>
                            <div class="card-category-and-type">
                                <div><%= novoDado.getCategoria()%> </div>
                                <div><%= novoDado.getTipo() %> </div>
                            </div>
                            <div class="card-botttom">
                                <span
                                    ><i class="fa-solid fa-coins"></i>
                                    <span class="dollar-sign"
                                          ><i class="fa-solid fa-dollar-sign"></i
                                        ></span>
                                    <%= novoDado.getSalarioMin()%> <span>-</span> <%= novoDado.getSalarioMax()%> Mzn
                                </span>
                            </div>
                            <div class="card-ver-mais">
                                <form action="vermais.jsp" method="post">               
                                    <button>Ver mais</button>
                                </form>
                            </div>
                        </div>
                        
                        <% }

                        }
                        %>
                        <!-- termina aqui listar-->
                    </div>
                </div>
            </div>
        </section>

        <script>
            function mostrar() {
                let elemento =
                        event.currentTarget.parentElement.querySelector(".checkbox-wrapper");
                elemento.style.display === "block"
                        ? (elemento.style.display = "none")
                        : (elemento.style.display = "block");
            }
        </script>
    </body>
</html>
