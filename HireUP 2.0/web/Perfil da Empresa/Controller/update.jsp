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
            try {

//                int k = Integer.parseInt(request.getParameter("idEmpresa"));
                EmpresasDTO dto = new EmpresasDTO();
                dto.setNomeEmpresa(request.getParameter("inpEmpresa"));
                dto.setSetor(request.getParameter("inpseto"));
                dto.setContato(request.getParameter("inpContato"));
                dto.setEmail(request.getParameter("inpEmail"));
                dto.setTipo_Empresa(request.getParameter("inpTipoEmpresa"));
                dto.setLocalizacao(request.getParameter("inpLocalizacao"));
                dto.setDescricao(request.getParameter("inpDescricao"));
                dto.setIdEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
    
//                out.print(k);
                EmpresasDAO dao = new EmpresasDAO();
                dao.update(dto);

                response.sendRedirect("../index.jsp");
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
