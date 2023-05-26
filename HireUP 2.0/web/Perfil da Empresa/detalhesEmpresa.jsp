<%@page import="DTO.CategoriasDTO"%>
<%@page import="DAO.CategoriasDAO"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>
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
        <link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" class="hr1" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            />
        <title>HireUP - Perfil da Empresa</title>
    </head>
    <body>
        <%@include file="../Pages - Empresas/header_empresa.jsp" %>
        <form action="editarEmpresa.jsp" method="post">
            <div class="container-fluid rounded bg-white">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div
                            class="d-flex flex-column align-items-center text-center p-3 py-5"
                            >
                            <%                                EmpresasDAO dao = new EmpresasDAO();
                                EmpresasDTO dto = new EmpresasDTO();
                                dto.setEmail(request.getParameter("inpEmail"));
                                List<EmpresasDTO> listar = (List<EmpresasDTO>) dao.perfilEmpresa(dto);
                            %>
                            <%
                                for (EmpresasDTO lister : listar) {
                            %>
                            <img
                                class="rounded-circle mt-5"
                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQF2psCzfbB611rnUhxgMi-lc2oB78ykqDGYb4v83xQ1pAbhPiB&usqp=CAU"
                                /><span class="font-weight-bold"><%=lister.getNomeEmpresa()%></span
                            ><span class="text-black-50"><%=lister.getEmail()%></span
                            ><span> </span>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="p-3 py-5">
                            <div
                                class="d-flex justify-content-between align-items-center mb-3"
                                >
                                <h4 class="text-right">Configuracoes do Perfil</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">Nome da Empresa</label
                                    ><input readonly="true"
                                            name="inpNome"
                                            type="text"
                                            class="form-control"
                                            placeholder="Nome"
                                            value="<%=lister.getNomeEmpresa()%>"
                                            />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Localizacao</label
                                    ><input readonly="true"
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
                                <div class="col-md-12 mt-3">
                                    <label class="labels">Tipo de Empresa</label>
                                    <input
                                        readonly="true"
                                        name="inpEmail"
                                        type="text"
                                        class="form-control"
                                        placeholder="Email"
                                        value="<%=lister.getTipoEmpresa()%>"
                                        />
                                </div>  
                            </div>
                            <div class="row mt-3">
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Setor</label>
                                    <input
                                        readonly="true"
                                        name="inpEmail"
                                        type="text"
                                        class="form-control"
                                        placeholder="Email"
                                        value="<%=lister.getSetor()%>"
                                        />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label for="exampleFormControlTextarea1" class="form-label">Descricao</label>
                                    <textarea readonly="true" name="inpDescricao" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=lister.getDescricao()%></textarea>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../Pages - Empresas/footer.jsp" %>
        </form>
    </body>
</html>

</html>
