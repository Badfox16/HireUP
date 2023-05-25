<%-- 
    Document   : editEmpresas 
    Created on : 16 May 2023, 17:33:55
    Author     : Pedro Nhamirre
--%>

<%@page import="DTO.CategoriasDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Company's Data</title>

        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


        <style>
            .rdOnly{
                border: none !important;
                background-color: transparent !important;
                font-weight: bold;
                width: fit-content !important;
                user-select:none !important;
                outline:none;
            }
        </style>
    </head>
    <body>

        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("loginA.jsp");
            }

            request.setCharacterEncoding("UTF-8");

        %>

        <div class="container mt-5">
            <!-- edit form column -->
            <div class="col-lg-12 text-lg-center">
                <h2>Editar Perfil da Empresa</h2>
                <br>
                <br>
            </div>
            <div class="col-lg-8 push-lg-4 personal-info">

                <form action="verifyEmpresaEdit.jsp" method="POST">

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">ID</label>
                        <div class="col-lg-9">
                            <input class="form-control rdOnly" name="Id" type="text" value="<%= request.getParameter("Id")%>" name="Id" readonly/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Nome</label>
                        <div class="col-lg-9">
                            <input class="form-control" name="Nome" type="text" value="<%= request.getParameter("Nome")%>" name="Nome"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Tipo</label>

                        <div class="col-lg-9">

                            <select class="form-control w-100" aria-label="Default select example"  name="Tipo">


                                <%
                                    String[] tipos = {"Empresa - Publica", "Empresa - Privada", "Sem Fins Lucrativos", "Governo", "Subsidiaria", "Firma", "Contratual", "Outro"};

                                    String selectedOne = request.getParameter("Tipo");

                                    for (int i = 0; i < tipos.length; i++) {
                                        if (tipos[i].equals(selectedOne)) {
                                %>
                                <option selected value="<%= selectedOne%>"><%= selectedOne%></option> 
                                <%
                                } else {
                                %>
                                <option value="<%= tipos[i]%>"><%= tipos[i]%></option> 
                                <%
                                        }
                                    }
                                %>


                            </select>

                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Setor</label>
                        <div class="col-lg-9">

                            <select class="form-control  w-100" aria-label="Default select example"  name="Setor">

                                <%
                                    CategoriasDAO categorias = new CategoriasDAO();
                                    List<CategoriasDTO> listaCategoria = (List<CategoriasDTO>) categorias.listarCategorias();

                                    String selected = request.getParameter("Setor").trim();

                                    for (CategoriasDTO novaCategoria : listaCategoria) {
                                        if (novaCategoria.getNome().equals(selected)) {
                                %>
                                <option selected value="<%=novaCategoria.getNome()%>"><%=novaCategoria.getNome()%></option>
                                <%
                                } else {
                                %>
                                <option value="<%=novaCategoria.getNome()%>"><%=novaCategoria.getNome()%></option>
                                <%
                                        }
                                    }
                                %>

                            </select>

                        </div>
                    </div> 

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Email</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="email" value="<%= request.getParameter("Email")%>" name="Email" readonly/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Localização</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Localizacao")%>" name="Localizacao"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Empregos</label>
                        <div class="col-lg-9">
                            <input class="form-control rdOnly" type="text" value="<%= request.getParameter("Empregos")%>" name="Empregos" readonly/>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label"></label>
                        <div class="col-lg-9">
                            <a href="empresas.jsp" class="btn btn-secondary">Cancel</a>

                            <input type="submit" class="btn btn-primary" value="Save Changes" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

