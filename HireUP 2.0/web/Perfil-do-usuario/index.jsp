<%-- 
    Document   : index
    Created on : May 25, 2023, 2:36:52 PM
    Author     : godal
--%>

<%@page import="DTO.CategoriasDTO"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.UsuariosDTO,DAO.UsuariosDAO,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />

        <title>HireUp - Perfil do Usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
            integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
            crossorigin="anonymous"
            />
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <script defer src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script defer type="text/javascript"></script>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="my-5">
                        <h3>Meu perfil</h3>
                        <hr />
                    </div>
                    <form class="file-upload">
                        <div class="row mb-5 gx-5">
                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div
                                    class="bg-secondary-soft px-4 py-5 rounded"
                                    >
                                    <%
                                        UsuariosDAO dao = new UsuariosDAO();
                                        UsuariosDTO dto = new UsuariosDTO();
                                        String email = (String) session.getAttribute("mail");
                                        dto.setEmail(email);

                                        List<UsuariosDTO> listar = (List<UsuariosDTO>) dao.perfilUsuario(dto);
                                        for (UsuariosDTO lister : listar) {
                                    %>

                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">
                                            Contact detail
                                        </h4>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   >Nome *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="First name"
                                                value="<%=lister.getNome()%>"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   >Apelido *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Last name"
                                                value="<%=lister.getApelido()%>"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   >Telefone *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Phone number"
                                                value="<%=lister.getContato()%>"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   >Setor *</label
                                            >
                                            <select name="Setor" class="form-control">

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

                                        <div class="col-md-6">
                                            <label
                                                for="inputEmail4"
                                                class="form-label"
                                                >Email *</label
                                            >
                                            <input
                                                readonly="true" 
                                                type="email"
                                                class="form-control"
                                                id="inputEmail4"
                                                value="<%=lister.getEmail()%>"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   >Descricao *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Phone number"
                                                value="<%=lister.getDescricao()%>"
                                                />
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>

                            <div class="col-xxl-4">
                                <div
                                    class="bg-secondary-soft px-4 py-5 rounded"
                                    >
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">
                                            Upload your profile photo
                                        </h4>
                                        <div class="text-center">
                                            <div
                                                class="square position-relative display-2 mb-3"
                                                >
                                                <i
                                                    class="fas fa-fw fa-user position-absolute top-50 start-50 translate-middle text-secondary"
                                                    ></i>
                                            </div>

                                            <input
                                                type="file"
                                                id="customFile"
                                                name="file"
                                                hidden
                                                />
                                            <label
                                                class="btn btn-success-soft btn-block"
                                                for="customFile"
                                                >Upload</label
                                            >
                                            <button
                                                type="button"
                                                class="btn btn-danger-soft"
                                                >
                                                Remove
                                            </button>

                                            <p class="text-muted mt-3 mb-0">
                                                <span class="me-1">Note:</span
                                                >Minimum size 300px x 300px
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-5 gx-5">
                            <div class="col-xxl-6 mb-5 mb-xxl-0">
                                <div
                                    class="bg-secondary-soft px-4 py-5 rounded"
                                    >
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">
                                            Social media detail
                                        </h4>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fab fa-fw fa-facebook me-2 text-facebook"
                                                    ></i
                                                >Facebook *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Facebook"
                                                value="http://www.facebook.com"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fab fa-fw fa-twitter text-twitter me-2"
                                                    ></i
                                                >Twitter *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Twitter"
                                                value="http://www.twitter.com"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fab fa-fw fa-linkedin-in text-linkedin me-2"
                                                    ></i
                                                >Linkedin *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Linkedin"
                                                value="http://www.linkedin.com"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fab fa-fw fa-instagram text-instagram me-2"
                                                    ></i
                                                >Instagram *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Instragram"
                                                value="http://www.instragram.com"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fas fa-fw fa-basketball-ball text-dribbble me-2"
                                                    ></i
                                                >Dribble *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Dribble"
                                                value="http://www.dribble.com"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                   ><i
                                                    class="fab fa-fw fa-pinterest text-pinterest"
                                                    ></i
                                                >Pinterest *</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder
                                                aria-label="Pinterest"
                                                value="http://www.pinterest.com"
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xxl-6">
                                <div
                                    class="bg-secondary-soft px-4 py-5 rounded"
                                    >
                                    <div class="row g-3">
                                        <h4 class="my-4">Change Password</h4>

                                        <div class="col-md-6">
                                            <label
                                                for="exampleInputPassword1"
                                                class="form-label"
                                                >Old password *</label
                                            >
                                            <input
                                                type="password"
                                                class="form-control"
                                                id="exampleInputPassword1"
                                                />
                                        </div>

                                        <div class="col-md-6">
                                            <label
                                                for="exampleInputPassword2"
                                                class="form-label"
                                                >New password *</label
                                            >
                                            <input
                                                type="password"
                                                class="form-control"
                                                id="exampleInputPassword2"
                                                />
                                        </div>

                                        <div class="col-md-12">
                                            <label
                                                for="exampleInputPassword3"
                                                class="form-label"
                                                >Confirm Password *</label
                                            >
                                            <input
                                                type="password"
                                                class="form-control"
                                                id="exampleInputPassword3"
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div
                            class="gap-3 d-md-flex justify-content-md-end text-center"
                            >
                            <button type="button" class="btn btn-danger btn-lg">
                                Delete profile
                            </button>
                            <button
                                type="button"
                                class="btn btn-primary btn-lg"
                                >
                                Update profile
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
