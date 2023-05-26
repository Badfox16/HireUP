<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DTO.EmpresasDTO" %>
<%@ page import="DAO.EmpresasDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cadastrar Vagas</title>
        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Font-->
        <link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
        <link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <!-- Main Style Css -->
        <link rel="stylesheet" href="./css/style.css"/>
    </head>
    <body class="form-v10">
        <%
            if (session.getAttribute("email") == null) {
                response.sendRedirect("loginRemake.jsp");
            }

        %>
        <%            EmpresasDAO dao = new EmpresasDAO();
            EmpresasDTO listarDTO = new EmpresasDTO();
            String a = "";
            a = (String) session.getAttribute("email");
            listarDTO.setEmail(a);
            List<EmpresasDTO> listaEmpresas = (List<EmpresasDTO>) dao.perfilEmpresa(listarDTO);
        %>
        <% for (EmpresasDTO empresa : listaEmpresas) {%>
        <%@include file="header_empresa.jsp" %>
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="cadastrarEmprego.jsp" method="post" id="myform">
                    <div class="form-left">
                        <h2>Descrição da vaga</h2>
                        <div class="form-row">
                            <input type="text" name="posicao" class="company" id="company" placeholder="Cargo" required>
                        </div>
                        <div class="form-row">
                            <select name="tipo">
                                <option class="option" selected disabled>Escolha o tipo de Emprego</option>
                                <option class="option" value="Tempo Inteiro">Tempo Inteiro</option>
                                <option class="option" value="Tempo Parcial">Tempo Parcial</option>
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        <div class="form-group">
                            <div class="form-row form-row-1">
                                <input type="number" name="salario_min" id="first_name" class="input-text" placeholder="Salario Minimo" required>
                            </div>
                            <div class="form-row form-row-2">
                                <input type="number" name="salario_max" id="last_name" class="input-text" placeholder="Salario Maximo" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <select name="setor">
                                <option value="" disabled selected>Selecione o Sector</option>
                                <option value="Tecnologias de Informacao">Tecnologias de Informação</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Telecomunicao">Telecomunição</option>
                                <option value="Administracao">Administração</option>
                                <option value="Construcao">Construção</option>
                                <option value="Saude">Saúde</option>
                                <option value="Industrial">Industrial</option>
                                <option value="Multimedia">Multimedia</option>
                                <option value="Seguranca">Segurança</option>
                                <option value="Outro">Outro</option>
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>

                        <div class="form-group">
                            <div class="form-row form-row-3">
                                <input type="text" name="localizacao" class="business" id="business" placeholder="Localização" required>
                            </div>

                        </div>
                        <div class="form-row form-row-3">
                            <input type="text" name="empresa" class="business" id="business" style="display: none;" required value="<%= empresa.getNomeEmpresa()%>">
                        </div>
                    </div>
                    <div class="form-right">
                        <h2>Informações adicionais</h2>
                        <div class="form-row">
                            <textarea name="descricao" id="" cols="45" rows="9" placeholder="Descrição da vaga"></textarea>
                        </div>

                        <div class="form-row">
                            <textarea name="requisitos" id="" cols="45" rows="9" placeholder="Requisitos para a vaga"></textarea>
                        </div>
                        <div class="form-checkbox">
                            <label class="container"><p>Ao continuar concorda com <a href="#" class="text">Termos e Condições</a> do HireUP.</p>
                                <input type="checkbox" checked name="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="form-row-last">
                            <input type="submit" name="register" class="register" value="Criar Vaga">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <% }%>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>