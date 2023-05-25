<%-- 
    Document   : browse
    Created on : 12 Apr 2023, 00:17:31
    Author     : Pedro Nhamirre
--%>


<%@page import="DTO.CategoriasDTO"%>
<%@page import="java.util.*"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page import="DAO.EmpregosDAO"%>
<%@page import="DAO.CategoriasDAO"%>
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

        <%@include file="header.jsp" %>

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

                        <h2>Categorias</h2>

                        <div class="checkbox-wrapper">

                            <div>
                                <label for="Categories1">
                                    <input type="radio" checked class="filter-radio" name="category" id="Categories1" value="Todos"/>
                                    Todos
                                </label>
                            </div>

                            <%
                                CategoriasDAO categoriaDAO = new CategoriasDAO();
                                List<CategoriasDTO> listaCat = (List<CategoriasDTO>) categoriaDAO.listarCategorias();

                                int contador = 1;

                                String setor = ""; // Mova a declaração e a inicialização para fora do loop

                                for (CategoriasDTO newCategoria : listaCat) {
                                    contador++;

                                    if (newCategoria.getNome().equals("Tecnologias de Informação")) {
                                        setor = "tech";
                                    } else {
                                        setor = newCategoria.getNome();
                                    }
                            %>
                            <div>
                                <label for="Categories<%= contador%>">
                                    <input type="radio" class="filter-radio" name="category" id="Categories<%= contador%>" value="<%= setor%>"/>
                                    <%= newCategoria.getNome()%>
                                </label>
                            </div>
                            <%
                                }
                            %>

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

                            String setorCard = "";

                            if (lista.isEmpty() == true) {
                                out.print("<div class=\"card-jobs\"><h3>nenhum dado existente encontrado</h3></div>");

                            } else {
                                for (EmpregosDTO novoDado : lista) {

                                    if (novoDado.getSetor().equals("Tecnologias de Informação")) {
                                        setorCard = "tech";
                                    } else {
                                        setorCard = novoDado.getSetor();
                                    }
                        %>




                        <div class="card-jobs Todos project <%= setorCard%>">
                            <div class="card-top">
                                <div>
                                    <img
                                        src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg"
                                        width="100%"
                                        />
                                </div>
                                <span> <%= novoDado.getEmpresa()%> </span>
                            </div>
                            <div class="card-middle">
                                <span><%= novoDado.getPosicao()%></span>
                            </div>
                            <div class="card-category-and-type">
                                <div><%= novoDado.getSetor()%> </div>
                                <div><%= novoDado.getTipo()%> </div>
                            </div>
                            <div class="card-botttom">
                                <span><i class="fa-sharp fa-solid fa-map-location"></i> <%= novoDado.getLocalizacao()%></span>
                                <div> 
                                    <span class="dollar-sign"><i class="fa-solid fa-money-bill"></i></span>
                                    <%= novoDado.getSalarioMin()%> <span>-</span> <%= novoDado.getSalarioMax()%> Mzn 
                                </div>
                            </div>
                            <div class="card-ver-mais">
                                <form action="vermais.jsp" method="post">
                                    <input type="hidden" name="empresa" value="<%= novoDado.getEmpresa()%> ">
                                    <input type="hidden" name="titulo" value="<%= novoDado.getTitulo()%> ">
                                    <input type="hidden" name="posicao" value="<%= novoDado.getPosicao()%>">
                                    <input type="hidden" name="categoria" value="<%= novoDado.getSetor()%>">
                                    <input type="hidden" name="tipo" value="<%= novoDado.getTipo()%>">
                                    <input type="hidden" name="salarioMin" value="<%= novoDado.getSalarioMin()%>">
                                    <input type="hidden" name="salarioMax" value="<%= novoDado.getSalarioMax()%>">
                                    <input type="hidden" name="descricao" value="<%= novoDado.getDescricao()%>">
                                    <input type="hidden" name="localizacao" value="<%= novoDado.getLocalizacao()%>">
                                    <input type="hidden" name="requisitos" value="<%= novoDado.getRequisitos()%>">

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
            // Selecionar os elementos relevantes
            const radios = document.querySelectorAll('.filter-radio');
            const projects = document.querySelectorAll('.project');

            // Adicionar o evento de alteração aos radio buttons
            radios.forEach(radio => {
                radio.addEventListener('change', () => {
                    // Obter o valor do filtro selecionado
                    const selectedFilter = document.querySelector('input[name="category"]:checked').value;

                    // Mostrar ou ocultar os projetos com base no filtro selecionado
                    projects.forEach(project => {
                        const projectFilters = Array.from(project.classList)
                                .filter(className => className !== 'project');

                        if (projectFilters.includes(selectedFilter)) {
                            project.style.display = 'block';
                        } else {
                            project.style.display = 'none';
                        }
                    });
                });
            });


        </script>
    </body>
</html>
