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
        <script src="https://kit.fontawesome.com/1f168297b1.js" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="../js/form.js" defer></script>
        <title>Perfil do usuário - Editar</title>
    </head>

    <body>
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

        <div class="container-fluid text-center emp-profile">
            <div class="container">
                <form action="Controller/updateUsuario.jsp" method="post" id="myForm">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <!--                            IMAGEM                           -->
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                                     alt="" style="margin-bottom: 12px"/>

                            </div>
                        </div>
                        <%
                            UsuariosDAO dao = new UsuariosDAO();
                            List<UsuariosDTO> listar = (List<UsuariosDTO>) dao.listarUsuarios();
                            for (UsuariosDTO lister : listar) {
                        %>

                        <div class="col-md-6">
                            <div class="profile-head">
                                <!--                            NOME                             -->
                                <h5>
                                    <%=lister.getNome()%> <%=lister.getApelido()%>
                                </h5>
                                <h6><%=lister.getSetor()%>

                                </h6>

                                <!--            RANKING DO PERFIL DO USER                       -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item mx-auto">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                           aria-controls="home" disabled>Sobre</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <input type="hidden" name="inpSenha" value="<%=lister.getSenha()%>">
                                    <div class="col-md-6">
                                        <label>Apelido </label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpApelido" value="<%=lister.getApelido()%>"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Nome</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpNome"  value="<%=lister.getNome()%>"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpEmail"  value="<%=lister.getEmail()%>"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Formacao</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpFormacao"  value="<%=lister.getFormacao()%>"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Sector</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpSetor"  value="<%=lister.getSetor()%>"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Localizacao</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input type="text" name="inpLocalizacao"  value="<%=lister.getLocalizacao()%>"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%};%>

                        <div class="mt-lg-5">
                            <input type="submit" class="btn-primary" onclick="formUserChange()"  value="Deletar" />
                            <input type="submit" class="btn-primary" style="visibility: hidden" />
                            <input type="submit" class="btn-primary" style="visibility: hidden" />
                            <input type="submit" class="btn-primary" style="visibility: hidden" />
                            <input type="submit" class="btn-primary" style="visibility: hidden" />
                            <input type="submit" class="btn-primary" name="btnAtualizar" value="Atualizar" />
                        </div>
                </form>
            </div>
        </div>
    </body>

</html>