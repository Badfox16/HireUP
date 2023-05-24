<%-- 
    Document   : index
    Created on : May 19, 2023, 5:27:28 PM
    Author     : godal
--%>

<%@page import="DAO.ComentariosDAO"%>
<%@page import="DTO.ComentariosDTO"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("mail") == null) {
        response.sendRedirect("../pages/login.jsp");
    }

    String login = (String) session.getAttribute("mail");
    UsuariosDTO objUsuarioDTO = new UsuariosDTO();

    objUsuarioDTO.setEmail(login);
    List<ComentariosDTO> objComentario = (List<ComentariosDTO>) new ComentariosDAO().userComentario();
    List<UsuariosDTO> listarUsuario = (List<UsuariosDTO>) new UsuariosDAO().perfilUsuario(objUsuarioDTO);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="stylesheet" href="./Css/style.css">
        <script
            src="https://kit.fontawesome.com/1f168297b1.js"
            crossorigin="anonymous"
        ></script>

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../pages/navbar.html" %>
        <form action="" method="get">

            <%
                for (ComentariosDTO listar : objComentario) {
            %>
            <div class="tabComentarios">
                <div class="comentario">
                    <div class="author">
                        <i
                            id="hideComent"
                            class="fa-sharp fa-solid fa-eye-slash"
                            ></i>
                        <h6 style="visibility: hidden">Jere</h6>

                        <div class="comentarioHeader">
                            <h1><em><%=listar.getNome()%></em></h1>
                        </div>
                    </div>
                    <div class="comentarioBody">
                        <p>
                            <%=listar.getComentario()%>
                        </p>
                    </div>
                    <div class="comentarioFooter">
                        <br />
                        <small>11:49</small>
                    </div>
                </div>
            </div>
            <%}%>
        </form>
        <button id="HideShow"><i class="fa-solid fa-comment"></i></button>
        <div class="tabComentar">
            <form action="Controller/submitComentario.jsp" method="get">
                <%
                    for (UsuariosDTO listarUsuarios : listarUsuario) {
                %>
                <input
                    type="hidden"
                    name="inpIdUsuario"
                    value="<%=listarUsuarios.getIdUsuario()%>"
                    />
                <textarea
                    name="inpComentario"
                    placeholder="Bora porra"
                    cols="55"
                    rows="15"
                    id="inpComentario"
                    ></textarea>
                <input type="submit" value="Enviar" id="inpSubmit" />
                <%}%>
            </form>
        </div>

        <script src="../js/jquery-3.7.0.min.js"></script>
        <script src="../js/ComentariosJS.js"></script>
    </body>
</html>
