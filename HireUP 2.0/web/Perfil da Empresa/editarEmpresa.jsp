<%-- 
    Document   : editar
    Created on : May 10, 2023, 12:19:55 AM
    Author     : godal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.EmpresasDTO,DAO.EmpresasDAO,java.util.*" %>
<!DOCTYPE html>
<html>
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
            <script src="../js/form.js" defer></script>
            <title>Perfil da Empresa</title>
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
            <form action="Controller/updateEmpresa.jsp" method="post" id="myForm">
                <%
                    EmpresasDAO dao = new EmpresasDAO();
                    EmpresasDTO dto = new EmpresasDTO();
                    String email = (String) session.getAttribute("mail");
                    dto.setEmail(email);
                    List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.perfilEmpresa(dto);
                %>
                <%
                    for (EmpresasDTO lister : listar) {
                %>
                <div class="profile">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                         alt="" style="width: 15%;" />
                    <input type="hidden" name="inpIdEmpresa" value="<%=lister.getIdEmpresa()%>">
                </div>

                <div class="container mt-3">
                    <h2>Atualizar os dados</h2>
                    <table class="table table-borderless tabela">

                        <tr>
                            <td> Nome</td>
                            <td>
                                <input type="text" name="inpEmpresa" value="<%=lister.getNomeEmpresa()%>" class="inptEmpresa">
                            </td>
                        </tr>
                        <tr>
                            <td>Sector</td>
                            <td> <input type="text" name="inpseto" value="<%=lister.getSetor()%>"> </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="inpEmail" value=" <%=lister.getEmail()%>"> </td>
                        </tr>
                        <tr>
                            <td>Senha</td>
                            <td><input type="text" name="inpSenha" value="<%=lister.getSenha()%>"> </td>
                        </tr>
                        <tr>
                            <td>Foco da companhia</td>
                            <td> <input type="text" name="inpTipoEmpresa" value="<%=lister.getTipoEmpresa()%>"> </td>
                        </tr>
                        <tr>
                            <td>Localização</td>
                            <td><input type="text" name="inpLocalizacao" value="<%=lister.getLocalizacao()%>"> </td>
                        </tr>

                        <tr>
                            <td>Descrição</td>
                            <td>
                                <textarea name="inpDescricao" id="inpDescricao" cols="30" rows="10" >
                                    <%=lister.getDescricao()%>
                                </textarea>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" class="btn-primary" id="btn-primary"  value="Atualizar" >
                    <input type="submit" class="btn-primary" onclick="formEmpChange()" value="Deletar" />
                </div>
                <%};%>
            </form>
        </body>

    </html> 