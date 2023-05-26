<%-- 
    Document   : index
    Created on : May 25, 2023, 6:39:27 PM
    Author     : godal
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="stylesheet" href="../Pages - Empresas/css/footer.css">
        <script defer src="../js/form.js"></script>
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>HireUP - Perfil da Empresa</title>
    </head>
    <body>
        <%@include file="../pages/header.jsp" %>
        <form action="Controller/updateUsuario.jsp" method="post" id="myForm">
            <div class="container-fluid rounded bg-white">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div
                            class="d-flex flex-column align-items-center text-center p-3 py-5"
                            >
                          
                            <img
                                class="rounded-circle mt-5"
                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQF2psCzfbB611rnUhxgMi-lc2oB78ykqDGYb4v83xQ1pAbhPiB&usqp=CAU"
                                /><span class="font-weight-bold"></span
                            ><span class="text-black-50"></span
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
                                    <label class="labels">Nome da Empresa</label
                                    ><input
                                        name="inpNome"
                                        type="text"
                                        class="form-control"
                                        placeholder="Nome"
                                        value=""
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Localizacao</label
                                    ><input
                                        name="inpLocalizacao"
                                        type="text"
                                        class="form-control"
                                        placeholder="Localizacao"
                                        value=""
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
                                        value=""
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Nova senha</label
                                    ><input
                                        name="inpNovaSenha"
                                        type="password"
                                        class="form-control"
                                        value=""
                                        />
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Confirmar senha</label
                                    ><input
                                        name="inpConfirmarSenha"
                                        type="password"
                                        class="form-control"
                                        value=""
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Tipo de Empresa</label
                                    ><input
                                        readonly="true"
                                        name="inpNome"
                                        type="text"
                                        class="form-control"
                                        placeholder="Nome"
                                        value=""
                                        />    
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Tipo de Empresa</label
                                    ><input
                                        readonly="true"
                                        name="inpNome"
                                        type="text"
                                        class="form-control"
                                        placeholder="Nome"
                                        value=""
                                        />    
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label for="exampleFormControlTextarea1" class="form-label">Descricao</label>
                                    <textarea name="inpDescricao" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=lister.getDescricao()%></textarea>
                                </div>
                            </div>
                            <%}%>
                            <div class="mt-5 text-center d-flex justify-content-between">
                                <button
                                    class="btn btn-primary profile-button"
                                    type="submit"
                                    >
                                    Atulizar
                                </button>

                                <button
                                    onclick="formUserChange()" 
                                    class="btn btn-danger profile-button"
                                    type="submit"
                                    >
                                    Deletar
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
