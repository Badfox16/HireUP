<%-- 
    Document   : candidaturaDetails
    Created on : May 26, 2023, 8:35:29 AM
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <title>Detalhes Candidatura</title>
    </head>
    <body>
        <%
            if (session.getAttribute("mail") == null) {
                response.sendRedirect("login.jsp");
            }

            request.setCharacterEncoding("UTF-8");
        %>

        <%@include file="header.jsp" %>

        <div class="container">

            <section>

                <div class="d-flex align-items-center">
                    <img src="../img/logo.png" alt="alt" style="height: 48px; margin: 3rem 2rem 3rem 0;" />
                    <span><%= request.getParameter("Empresa")%></span>
                </div>


                <div>
                    <h2>Cargo</h2>

                    <p>
                        <span class="icon-location"
                              ><i class="fa-solid fa-location-dot"></i
                            ></span>
                            <%= request.getParameter("Localizacao")%> 
                            
                            
                            <span class="icon-dolar" style="margin-left: 2rem;"
                                      ><i class="fa-solid fa-dollar-sign"></i
                                    ></span>
                                <%= request.getParameter("SalarioMin")%> - <%= request.getParameter("SalarioMax")%>
                    </p>
                </div>

                <div>
                    <h2>Requisitos Mínimos</h2>

                    <p>

                        <%= request.getParameter("Requisitos")%>
                    </p>
                </div>
                <div>
                    <h2>Descrição do Emprego</h2>

                    <p>

                        <%= request.getParameter("Descricao")%>
                    </p>
                </div>
              


            </section>


            <form action="candidaturas.jsp" method="post">
                <h2>1. Detalhe pessoal</h2>
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nome" aria-describedby="emailHelp" value="<%=request.getParameter("Nome")%>" readonly>
                    <div id="emailHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="apelido" class="form-label">Apelido</label>
                    <input type="text" class="form-control" id="apelido" aria-describedby="emailHelp" value="<%=request.getParameter("Apelido")%>" readonly>

                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=request.getParameter("Email")%>" readonly>

                </div>
                <h2>2.Perfil</h2>
                <div class="mb-3">
                    <label for="why" class="form-label" style="font-weight: bold;font-size: 1rem;">Porque você quer trabalhar conosco?</label>

                    <textarea class="form-control" name="why"
                              cols="80"
                              rows="12"
                              placeholder="Porque você é a pessoa certa para a vaga?"

                              style="margin:0; resize: none;" readonly>
                     <%=request.getParameter("About")%>"


                    </textarea>

                </div>

                <div class="mb-3">
                    <label for="why" class="form-label" style="font-weight: bold;font-size: 1rem;">Porque você é a pessoa certa para a vaga?</label>

                    <textarea class="form-control" name="why"
                              cols="80"
                              rows="12"
                              placeholder="Porque você é a pessoa certa para a vaga?"

                              style="margin:0; resize: none;" readonly>
                        
                         <%=request.getParameter("Why")%>"

                    </textarea>

                </div>

                <button type="submit" class="btn btn-secondary">VOLTAR</button>
            </form>


        </div>
    </body>
</html>
