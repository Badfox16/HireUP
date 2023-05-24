<%-- 
    Document   : editUser
    Created on : 14 May 2023, 13:17:51
    Author     : Pedro Nhamirre
--%>

<%@page import="java.util.*"%>
<%@page import="DTO.CategoriasDTO"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit User Data</title>

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />


        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%--
            if(session.getAttribute("user")==null){
                response.sendRedirect("loginA.jsp");
            }

        --%>
        <div class="container mt-5">
            <!-- edit form column -->
            <div class="col-lg-12 text-lg-center">
                <h2>Editar Perfil</h2>
                <br>
                <br>
            </div>
            <div class="col-lg-8 push-lg-4 personal-info">

                <form action="verifyUserEdit.jsp" accept-charset="UTF-8">

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Nome</label>
                        <div class="col-lg-9">
                            <input class="form-control" name="Nome" type="text" value="<%= request.getParameter("Nome")%>" name="Nome"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Apelido</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Apelido")%>" name="Apelido"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Email</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="email" value="<%= request.getParameter("Email")%>" name="Email" readonly/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Setor</label>

                        <div class="col-lg-9">

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
                    </div> 

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Localização</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Localizacao")%>" name="Localizacao"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Formação</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Formacao")%>" name="Formacao"/>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label"></label>
                        <div class="col-lg-9">
                            <a href="users.jsp" class="btn btn-secondary">Cancel</a>

                            <input type="submit" class="btn btn-primary" value="Save Changes" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
                       
    </body>
</html>
