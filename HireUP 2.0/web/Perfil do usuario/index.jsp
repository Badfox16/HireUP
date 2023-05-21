<%-- 
    Document   : index
    Created on : May 10, 2023, 3:35:11 AM
    Author     : godal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.UsuariosDTO,DAO.UsuariosDAO,java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="../css/navbar.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <script src="https://kit.fontawesome.com/1f168297b1.js" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Perfil do usuário</title>
    </head>

    <body>

    <body>
        <!-- Login obrigatorio -->
        <%
            if (session.getAttribute("mail") == null) {
                response.sendRedirect("../pages/login.jsp");
            }
        %>
        <div class="navbar">
            <div class="left-nav">
                <a href="#" class="brand"><img src="../img/logo.png" alt="Logo" class="logo" height="30"></a>

            </div>

            <div class="nav-middle">
                <nav class="nav-menu">
                    <a href="../index.html" class="nav-link">Home</a>
                    <a href="./empresa.jsp" class="nav-link">Empresas</a>
                    <a href="./browse.jsp" class="nav-link">Vagas</a>
                </nav>
            </div>


            <div>
                <nav class="right-nav" style="visibility: hidden;">
                    <a href="./submitJob.jsp" class="nav-link">Poste um Emprego</a>
                    <a href="./submitJob.jsp" class="nav-link"><i class="fa-solid fa-inbox"></i></a>
                    <button class="btn-primary">Log in</button>
                </nav>

            </div>
        </div>

        <!-- HEADER END  -->
        <section class="section about-section gray-bg" id="about">
            <div class="container my-50">
                <form action="editarUsuario.jsp" method="post">
                    <div class="row align-items-center flex-row-reverse">
                        <div class="col-lg-6">
                            <div class="about-text go-to">
                                <%
                                    UsuariosDAO dao = new UsuariosDAO();
                                    UsuariosDTO dto = new UsuariosDTO();
                                    String email = (String) session.getAttribute("mail");
                                    dto.setEmail(email);

                                    List<UsuariosDTO> listar = (List<UsuariosDTO>) dao.listSelect(dto);
                                    for (UsuariosDTO lister : listar) {
                                %>

                                <h3 class="dark-color">Olá <%=lister.getNome()%></h3>
                                <h6 class="theme-color lead">
                                    A Lead UX & UI designer based in Canada
                                </h6>
                                <p>
                                    <textarea readonly="true" style="width: 100%;height: 8rem;overflow: auto;resize: none;border: none;outline: none">
                                        <%=lister.getDescricao()%>
                                    </textarea>
                                </p>
                                <div class="row about-list">
                                    <div class="col-md-6">
                                        <div class="media">
                                            <label>Nome:</label>
                                            <p><%=lister.getNome()%></p>
                                        </div>
                                        <div class="media">
                                            <label>Apelido:</label>
                                            <p><%=lister.getApelido()%></p>
                                        </div>
                                        <div class="media">
                                            <label>E-mail:</label>
                                            <p><%=lister.getEmail()%></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="media">
                                            <label>Setor:</label>
                                            <p><%=lister.getSetor()%></p>
                                        </div>
                                        <div class="media">
                                            <label>Localizacao:</label>
                                            <p><%=lister.getLocalizacao()%></p>
                                        </div>
                                        <div class="media">
                                            <label>Formacao:</label>
                                            <p><%=lister.getFormacao()%></p>
                                        </div>
                                    </div>
                                </div>
                                <%};%>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="about-avatar">
                                <img
                                    src="https://bootdey.com/img/Content/avatar/avatar7.png"
                                    title=""
                                    alt=""
                                    />
                            </div>
                        </div>
                    </div>
                    <div class="counter w-25">
                        <input
                            style="border: none; background-color: transparent;margin: 0 30%;"
                            type="submit"
                            value="Editar o Perfil"
                            />
                    </div>
                </form>
            </div>
        </section>
    </body>

</html>