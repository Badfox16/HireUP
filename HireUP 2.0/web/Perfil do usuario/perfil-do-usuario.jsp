<%@page import="DTO.CategoriasDTO"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="stylesheet" href="../Pages - Empresas/css/footer.css">
        <script defer src="../js/form.js"></script>
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            />
        <title>HireUP - Perfil</title>
    </head>
    <body>
        <%
            if (session.getAttribute("mail") == null) {
                response.sendRedirect("../pages/login.jsp");
            }
        %>
        <%@include file="../pages/header.jsp" %>
        <form action="editarUsuario.jsp" >
            <div class="container-fluid rounded bg-white">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div
                            class="d-flex flex-column align-items-center text-center p-3 py-5"
                            >
                            <%                                UsuariosDAO dao = new UsuariosDAO();
                                UsuariosDTO dto = new UsuariosDTO();
                                String email = (String) session.getAttribute("mail");
                                dto.setEmail(email);

                                List<UsuariosDTO> listar = (List<UsuariosDTO>) dao.perfilUsuario(dto);
                                for (UsuariosDTO lister : listar) {
                            %>
                            <img
                                class="rounded-circle mt-5"
                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQF2psCzfbB611rnUhxgMi-lc2oB78ykqDGYb4v83xQ1pAbhPiB&usqp=CAU"
                                /><span class="font-weight-bold"><%=lister.getNome()%></span
                            ><span class="text-black-50"><%=lister.getEmail()%></span
                            ><span> </span>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="p-3 py-5">
                            <div
                                class="d-flex justify-content-between align-items-center mb-3"
                                >
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">Nome</label
                                    ><input readonly=""
                                        name="inpNome"
                                        type="text"
                                        class="form-control"
                                        placeholder="Nome"
                                        value="<%=lister.getNome()%>"
                                        />
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Apelido</label
                                    ><input readonly=""
                                        name="inpApelido"
                                        type="text"
                                        class="form-control"
                                        value="<%=lister.getApelido()%>"
                                        placeholder="Apelido"
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Telefone</label
                                    ><input readonly=""
                                        name="inpContato"
                                        type="text"
                                        class="form-control"
                                        placeholder="+258 84 0000000"
                                        value="<%=lister.getContato()%>"
                                        />
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Localizacao</label
                                    ><input readonly=""
                                        name="inpLocalizacao"
                                        type="text"
                                        class="form-control"
                                        placeholder="Localizacao"
                                        value="<%=lister.getLocalizacao()%>"
                                        />
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Email</label
                                    ><input
                                        readonly="true"
                                        name="inpEmail"
                                        type="text"
                                        class="form-control"
                                        placeholder="Email"
                                        value="<%=lister.getEmail()%>"
                                        />
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Formacao</label
                                    ><input readonly=""
                                        name="inpFormacao"
                                        type="text"
                                        class="form-control"
                                        value="<%=lister.getFormacao()%>"
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Senha</label
                                    ><input readonly=""
                                        name="inpNovaSenha"
                                        type="password"
                                        class="form-control"
                                        value="<%=lister.getSenha()%>"
                                        />
                                </div>
                          
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">

                                    <select name="inpSetor" class="form-control" readonly="">
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
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label for="exampleFormControlTextarea1" class="form-label">Descricao</label>
                                    <textarea readonly="true" name="inpDescricao" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=lister.getDescricao()%></textarea>
                                </div>
                            </div>
                            <%}%>
                            <div class="mt-5 text-center d-flex justify-content-between">
                                <button
                                    class="btn btn-primary profile-button"
                                    type="submit"
                                    >
                                    Editar o Perfil
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../Pages - Empresas/footer.jsp" %>
        </form>
    </body>
</html>
