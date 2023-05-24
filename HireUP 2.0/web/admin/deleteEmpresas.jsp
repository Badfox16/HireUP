<%-- 
    Document   : deleteEmpresas
    Created on : 16 May 2023, 17:34:31
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit User Data</title>

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
        <div class="container mt-5">
            <!-- edit form column -->
            <div class="col-lg-12 text-lg-center">
                <h2>Excluir Usuário</h2>
                <br>
                <br>
                <p>Tem certeza que deseja <span class="text-danger text-lg-start">excluir</span> o usuário abaixo ?</p>
            </div>
            <div class="col-lg-8 push-lg-4 personal-info">
                
                <form action="verifyDeleteEmpresa.jsp" method="POST">
                    
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">ID</label>
                        <div class="col-lg-9">
                            <input class="form-control" name="Nome" type="text" value="<%= request.getParameter("Id")%>" name="Id" readonly/>
                        </div>
                    </div>
                        
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Nome</label>
                        <div class="col-lg-9">
                            <input class="form-control" name="Nome" type="text" value="<%= request.getParameter("Nome")%>" name="Nome" readonly/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Tipo</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Tipo")%>" name="Tipo" readonly/>
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
                            <input class="form-control" type="text" value="<%= request.getParameter("Setor")%>" name="Setor" readonly/>
                        </div>
                    </div> 

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Localização</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Localizacao")%>" name="Localizacao" readonly/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Formação</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" value="<%= request.getParameter("Formacao")%>" name="Formacao" readonly/>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label"></label>
                        <div class="col-lg-9">
                            <a href="empresas.jsp" class="btn btn-secondary">Cancelar</a>
                            
                            <input type="submit" class="btn btn-danger" value="Confirmar" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>