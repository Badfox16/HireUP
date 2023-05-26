<%-- 
    Document   : update
    Created on : May 10, 2023, 2:03:05 AM
    Author     : godal
--%>


<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <%
            String senhaNova = request.getParameter("inpNovaSenha");
            String senhaConfirmar = request.getParameter("inpConfirmarSenha");
            if (senhaNova != null && senhaConfirmar != null) {
                if (senhaNova.equals(senhaConfirmar)) {
                    try {

                        EmpresasDTO dto = new EmpresasDTO();
                        dto.setNomeEmpresa(request.getParameter("inpEmpresa"));
                        dto.setSetor(request.getParameter("inpSetor"));
                        dto.setSenha(request.getParameter("inpNovaSenha"));
                        dto.setEmail(request.getParameter("inpEmail"));
                        dto.setTipoEmpresa(request.getParameter("inpTipoEmpresa"));
                        dto.setLocalizacao(request.getParameter("inpLocalizacao"));
                        dto.setDescricao(request.getParameter("inpDescricao"));
                        dto.setIdEmpresa(Integer.parseInt(request.getParameter("inpIdEmpresa")));

                        EmpresasDAO dao = new EmpresasDAO();
                        dao.update(dto);

                        response.sendRedirect("../perfil-da-empresa.jsp");
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }

                }
            }

        %>
    </body>
</html>
