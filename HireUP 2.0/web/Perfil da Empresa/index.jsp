<%-- 
    Document   : index
    Created on : May 9, 2023, 11:24:23 PM
    Author     : godal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.EmpresasDTO,DAO.EmpresasDAO,java.util.*" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://kit.fontawesome.com/1f168297b1.js" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Perfil da Empresa</title>
    </head>

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
                    <!-- <a href="./browse.jsp" class="nav-link" style="visibility: hidden;">Vagas</a> -->
                </nav>
            </div>
            <div>
                <nav class="right-nav">
                    <a href="./submitJob.jsp" class="nav-link">Poste um Emprego</a>
                    <a href="./submitJob.jsp" class="nav-link"><i class="fa-solid fa-inbox"></i></a>
                    <!-- <button class="btn-primary">Log in</button> -->
                </nav>

            </div>
        </div>
        <!-- HEADER END  -->

        <div class="container-fluid text-center emp-profile">
            <div class="container">
                <form action="editarEmpresa.jsp" method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <!--                            IMAGEM                           -->
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                                     alt="" />

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="profile-head">
                                <%
                                    EmpresasDAO dao = new EmpresasDAO();
                                    EmpresasDTO dto = new EmpresasDTO();
                                    String email = (String) session.getAttribute("mail");
                                    dto.setEmail(email);
                                    List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.listarEmpresas(dto);
                                %>
                                <%
                                    for (EmpresasDTO lister : listar) {
                                %>
                                <!--                            NOME                             -->
                                <h2>
                                    <strong><%=lister.getNomeEmpresa()%></strong>
                                </h2>
                                <h6>
                                    <%=lister.getEmail()%>
                                </h6>

                                <!--            ID DA EMPRESA                   -->
                                <p class="proile-rating"> Número de identificacao: <%=lister.getIdEmpresa()%> </p>

                            </div>
                        </div>
                        <div class=" col-md-2">
                            <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" />
                        </div>
                    </div>

                    <div class="container mt-3">
                        <h4><strong>Empresa overview</strong></h4>

                        <table class="table table-borderless tabela">
                            <tbody>
                                <tr>
                                    <td>Sector: <%=lister.getSetor()%></td>
                                    <td>Empresa: <%=lister.getTipoEmpresa()%></td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td>Email: <%=lister.getEmail()%></td>
                                    <td>Localização: <%=lister.getLocalizacao()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="container d-flex">

                        <h5><strong>Descrição da empresa</strong></h5>
                        <h1>&nbsp;&nbsp;&nbsp;</h1>
                        <div class="content-Empresa">
                            <textarea disabled id="textDescricao">
                                <%=lister.getDescricao()%> 
                            </textarea>
                        </div>
                    </div>
                    <%};
                    %>
                </form>
            </div>
        </div>
    </div>
</body>

</html>