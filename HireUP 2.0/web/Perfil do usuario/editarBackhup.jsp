<%-- 
    Document   : newjsp
    Created on : May 26, 2023, 12:19:20 AM
    Author     : godal
--%>

<%@page import="DTO.CategoriasDTO"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="stylesheet" href="../Pages - Empresas/css/footer.css">
        <script defer src="../js/form.js"></script>
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <link rel="stylesheet" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
    <body>
        <%@include file="../pages/header.jsp" %>
        <main class="main">
            <section class="leftSide">
                <%                    UsuariosDAO dao = new UsuariosDAO();
                    UsuariosDTO dto = new UsuariosDTO();
                    String email = (String) session.getAttribute("mail");
                    dto.setEmail(email);

                    List<UsuariosDTO> listar = (List<UsuariosDTO>) dao.perfilUsuario(dto);
                    for (UsuariosDTO lister : listar) {
                %>

                <form action="Controller/updateUsuario.jsp" method="post" id="myForm">
                    <div class="userInfo">
                        <div class="name">
                            <label>Nome</label>
                            <input type="text"  name="inpNome" value="<%=lister.getNome()%>" />
                            <label for="">Apelido</label>
                            <input type="text"  name="inpApelido" value="<%=lister.getApelido()%>"/>
                        </div>
                        <div class="contact">
                            <label for="">Email</label>
                            <input type="text"  readonly="true"  name="inpEmail" value="<%=lister.getEmail()%>"/>
                            <label for="">Contato</label>
                            <input type="text"  name="inpContato" value="<%=lister.getContato()%>" />
                        </div>
                    </div>
                    <div class="addictionInfo">
                        <div class="location">
                            <label for="">Localizacao</label>
                            <input type="text" name="inpLocalizacao" id="inpLocalizacao" value="<%=lister.getLocalizacao()%>" />
                            <label for="">Setor</label>
                            <select name="inpSetor" class="form-control">
                                <%
                                    CategoriasDAO categorias = new CategoriasDAO();
                                    List<CategoriasDTO> listaCategoria = (List<CategoriasDTO>) categorias.listarCategorias();

                                    String selected = request.getParameter("Setor");

                                    for (CategoriasDTO novaCategoria : listaCategoria) {

                                        if (novaCategoria.getNome().equals(selected)) {

                                %>
                                <option checked class="form-control"  value="<%=novaCategoria.getNome()%>"><%=novaCategoria.getNome()%></option>
                                <%
                                } else {
                                %>
                                <option class="form-control"  value="<%= novaCategoria.getNome()%>"><%= novaCategoria.getNome()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label for="">Formacao</label>
                            <input type="text" name="inpFormacao" value="<%=lister.getFormacao()%>"/>
                        </div>
                        <div class="password">
                            <label for="">Senha</label>
                            <input type="password"  name="inpNovaSenha" value="<%=lister.getSenha()%>" />
                            <label for="">Confirmar Senha</label>
                            <input type="password" name="inpConfirmarSenha" value="<%=lister.getSenha()%>" />
                        </div>
                    </div>
                    <div class="aboutMe">
                        <textarea name="" id="" cols="30" rows="10"><%=lister.getDescricao()%></textarea>
                    </div>
                    <div class="buttons">
                        <button>Atualizar</button>
                        <button onclick="formUserChange()" >Deletar</button>
                    </div>
                </form>
            </section>

            <section class="rightSide">
                <div class="profileImage">
                    <img src="https://picsum.photos/200" alt="" />
                    <input type="file" name="" id="" />
                </div>
                <div class="profileComents">
                    <label for=""></label>
                    <p>Comentarios</p>
                </div>
                <div class="profileName">
                    <h3><%=lister.getNome()%></h3>
                    <h4><%=lister.getLocalizacao()%></h4>
                </div>
                <hr style="width: 100%" />
                <div class="profileDescription">
                    <p><%=lister.getDescricao()%></p>
                </div>
            </section>
        </main>
        <%}%>
        <%@include file="../Pages - Empresas/footer.jsp" %>
    </body>
</html>
