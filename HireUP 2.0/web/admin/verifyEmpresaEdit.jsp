<%-- 
    Document   : verifyEmpresaEdit
    Created on : 20 May 2023, 13:04:32
    Author     : Pedro Nhamirre
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DAO.EmpresasDAO"%>
<%@page import="DTO.EmpresasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            try {
                EmpresasDTO empresaDTO = new EmpresasDTO();
                
                empresaDTO.setIdEmpresa(Integer.parseInt(request.getParameter("Id")));
                empresaDTO.setNomeEmpresa(request.getParameter("Nome"));
                empresaDTO.setTipoEmpresa(request.getParameter("Tipo"));
                empresaDTO.setSetor(request.getParameter("Setor"));
                empresaDTO.setEmail(request.getParameter("Email"));
                empresaDTO.setLocalizacao(request.getParameter("Localizacao"));
                empresaDTO.setEmpregos(request.getParameter("Empregos"));
                
                EmpresasDAO empresaDAO = new EmpresasDAO();
                empresaDAO.update(empresaDTO);

                response.sendRedirect("empresas.jsp");
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + e.getMessage());
            }
           
        %>
    </body>
</html>
