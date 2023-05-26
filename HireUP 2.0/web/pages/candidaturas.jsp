<%-- 
    Document   : candidaturas
    Created on : May 26, 2023, 12:14:10 AM
    Author     : Pedro Nhamirre
--%>

<%@page import="DAO.UsuariosDAO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DTO.EmpregosDTO"%>
<%@page import="DTO.CandidaturasDTO"%>
<%@page import="DTO.CandidaturasDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CandidaturasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />


        <title>Candidaturas Page</title>

    </head>
    <body>

        <%
            if (session.getAttribute("mail") == null) {
                response.sendRedirect("login.jsp");
            }

            request.setCharacterEncoding("UTF-8");
        %>

        <%@include file="header.jsp" %>

        <div class="container-fluid">

            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>
                        <th>Candidato</th>
                        <th>Empresa</th>
                        <th>Setor</th>
                        <th>Cargo</th>
                        <th>Estado</th>
                        <th>Localização</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <%--                        // Instanciar o DAO de Candidaturas
                         CandidaturasDAO candidaturasDAO = new CandidaturasDAO();

                        try {
                            // Obter a lista de candidaturas com informações de empresas, usuários e empregos
                            List<CandidaturasDTO> listaCandidaturas = candidaturasDAO.listarCandidaturasTeste();

                            // Exibir as informações
                            for (CandidaturasDTO candidatura : listaCandidaturas) {
                                out.println("ID da Candidatura: " + candidatura.getIdCandidatura() + "<br>");
                                out.println("Estado: " + candidatura.getEstado() + "<br>");
                                out.println("Fale sobre: " + candidatura.getFaleSobre() + "<br>");
                                out.println("Por que você: " + candidatura.getPqVoce() + "<br>");

                                // Informações da empresa
                                EmpresasDTO empresa = candidatura.getEmpresaFK();
                                out.println("ID da Empresa: " + empresa.getIdEmpresa() + "<br>");
                                out.println("Nome da Empresa: " + empresa.getNomeEmpresa() + "<br>");
                                out.println("Tipo da Empresa: " + empresa.getTipoEmpresa() + "<br>");
                                out.println("Setor da Empresa: " + empresa.getSetor() + "<br>");
                                out.println("Email da Empresa: " + empresa.getEmail() + "<br>");
                                out.println("Localização da Empresa: " + empresa.getLocalizacao() + "<br>");

                                // Informações do usuário
                                UsuariosDTO usuario = candidatura.getUsuarioFK();
                                out.println("ID do Usuário: " + usuario.getIdUsuario() + "<br>");
                                out.println("Email do Usuário: " + usuario.getEmail() + "<br>");
                                out.println("Nome do Usuário: " + usuario.getNome() + "<br>");
                                out.println("Apelido do Usuário: " + usuario.getApelido() + "<br>");
                                out.println("Setor do Usuário: " + usuario.getSetor() + "<br>");
                                out.println("Localização do Usuário: " + usuario.getLocalizacao() + "<br>");

                                // Informações do emprego
                                EmpregosDTO emprego = candidatura.getEmpregoFK();
                                out.println("ID do Emprego: " + emprego.getIdEmprego() + "<br>");
                                out.println("Empresa do Emprego: " + emprego.getEmpresa() + "<br>");
                                out.println("Título do Emprego: " + emprego.getTitulo() + "<br>");
                                out.println("Posição do Emprego: " + emprego.getPosicao() + "<br>");
                                out.println("Salário Mínimo: " + emprego.getSalarioMin() + "<br>");
                                out.println("Salário Máximo: " + emprego.getSalarioMax() + "<br>");
                                out.println("Setor do Emprego: " + emprego.getSetor() + "<br>");
                                out.println("Localização do Emprego: " + emprego.getLocalizacao() + "<br>");
                                out.println("Tipo do Emprego: " + emprego.getTipo() + "<br>");
                                out.println("Descrição do Emprego: " + emprego.getDescricao() + "<br>");
                                out.println("Requisitos do Emprego: " + emprego.getRequisitos() + "<br>");

                                out.println("<br><br>");
                            }
                        } catch (Exception e) {
                            out.println("Erro ao listar candidaturas: " + e.getMessage());
                        } 
                    --%>

                    <%                        CandidaturasDAO candidaturasDAO = new CandidaturasDAO();

                        UsuariosDTO dtoUser = new UsuariosDTO();
                        dtoUser.setEmail((String) session.getAttribute("mail"));

                        UsuariosDAO daoUser = new UsuariosDAO();
                        List<UsuariosDTO> listaUser = (List<UsuariosDTO>) daoUser.perfilUsuario(dtoUser);

                        int idUser = 0;

                        for (UsuariosDTO novoDtoUser : listaUser) {
                            idUser = novoDtoUser.getIdUsuario();
                        }

                        try {
                            // Obter a lista de candidaturas com informações de empresas, usuários e empregos
                            List<CandidaturasDTO> listaCandidaturas = candidaturasDAO.listarCandidaturasPorUsuario(idUser);

                            // Exibir as informações
                            for (CandidaturasDTO candidatura : listaCandidaturas) {

                                EmpresasDTO empresa = candidatura.getEmpresaFK();
                                UsuariosDTO usuario = candidatura.getUsuarioFK();
                                EmpregosDTO emprego = candidatura.getEmpregoFK();
                    %>
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <img
                                    src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                                    alt=""
                                    style="width: 45px; height: 45px"
                                    class="rounded-circle"
                                    />
                                <div class="ms-3">
                                    <p class="fw-bold mb-1"> <%=usuario.getNome() + " " + usuario.getApelido()%> </p>
                                    <p class="text-muted mb-0"><%= usuario.getEmail()%></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="fw-normal mb-1"><%= empresa.getNomeEmpresa()%></p>
                        </td>
                        <td>
                            <p class="text-muted mb-0"> <%=empresa.getSetor()%></p>
                        </td>
                        <td>
                            <span class="badge badge-success rounded-pill d-inline" 
                                  style="color: black; font-size: 1rem; text-align: center;"
                                  ><%= emprego.getPosicao()%></span>
                        </td>
                        <td><%= candidatura.getEstado()%></td>
                        <td>
                            <%= emprego.getLocalizacao()%>
                        </td>
                        <td>
                            <form action="candidaturaDetails.jsp" method="POST">

                                <input type="hidden" value="<%=empresa.getNomeEmpresa()%>" name="Empresa">
                                <input type="hidden" value="<%=emprego.getPosicao()%>" name="Posicao">
                                <input type="hidden" value="<%=emprego.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=emprego.getSalarioMin()%>" name="SalarioMin">
                                <input type="hidden" value="<%=emprego.getSalarioMax()%>" name="SalarioMax">
                                <input type="hidden" value="<%=emprego.getLocalizacao()%>" name="Localizacao">
                                <input type="hidden" value="<%=emprego.getRequisitos()%>" name="Requisitos">
                                <input type="hidden" value="<%=emprego.getDescricao()%>" name="Descricao">
                                <input type="hidden" value="<%=usuario.getNome()%>" name="Nome">
                                <input type="hidden" value="<%=usuario.getApelido()%>" name="Apelido">
                                <input type="hidden" value="<%=usuario.getEmail()%>" name="Email">
                                <input type="hidden" value="<%=candidatura.getFaleSobre()%>" name="About">
                                <input type="hidden" value="<%=candidatura.getPqVoce()%>" name="Why">

                                <input class="btn btn-primary" type="submit" value="VER MAIS">
                            </form>
                        </td>
                        <td>


                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                CANCELAR CANDIDATURA
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Cancelar Candidatura</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Deseja cancelar a candidatura?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <form action="cancelarCandidatura.jsp">
                                                <input type="hidden" value="<%=candidatura.getIdCandidatura()%>" name="idCandidatura">

                                                <input class="btn btn-danger" type="submit" value="CANCELAR CANDIDATURA">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <%}%>

                    <% } catch (Exception e) {
                            out.println("Erro ao listar candidaturas: " + e.getMessage());
                        }
                    %>



                </tbody>
            </table>









        </div>
    </body>
</html>
