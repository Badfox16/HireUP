<%-- 
    Document   : updateUsuario
    Created on : May 11, 2023, 8:38:39 PM
    Author     : godal
--%>

<%@page import="DTO.UsuariosDTO"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UsuariosDAO dao = new UsuariosDAO();
            UsuariosDTO dto = new UsuariosDTO();

            String senhaNova = request.getParameter("inpNovaSenha");
            String senhaConfirmar = request.getParameter("inpConfirmarSenha");
            if (senhaNova != null && senhaConfirmar != null) {
                if (senhaNova.equals(senhaConfirmar)) {
                    try {
                        dto.setNome(request.getParameter("inpNome"));
                        dto.setApelido(request.getParameter("inpApelido"));
                        dto.setEmail(request.getParameter("inpEmail"));
                        dto.setLocalizacao(request.getParameter("inpLocalizacao"));
                        dto.setSetor(request.getParameter("inpSetor"));
                        dto.setSenha(request.getParameter("inpConfirmarSenha"));
                        dto.setFormacao(request.getParameter("inpFormacao"));
                        dto.setDescricao(request.getParameter("inpDescricao"));
                        dto.setContato(request.getParameter("inpContato"));
                        dao.editarUsuario(dto);
                        response.sendRedirect("../perfil-do-usuario.jsp");
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                } else {
                    out.print("<div><script>alert('Senhas diferente')</script></>");
                }
            }

        %>
    </body>
</html>
