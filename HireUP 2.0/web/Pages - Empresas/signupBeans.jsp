<%-- 
    Document   : signupEmpresa
    Created on : 11 May,2023, 19:57:41
    Author     : mutizo
--%>
<%@page import="DAO.EmpresasDAO" %>
<%@page import="DTO.EmpresasDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empresa</title>
    </head>
    <body>
        
        <% 
            try {
                    request.setCharacterEncoding("UTF-8");
                    EmpresasDTO objEmpresasDTO = new EmpresasDTO();
                    
                    
                    objEmpresasDTO.setNomeEmpresa(request.getParameter("nome"));
                    objEmpresasDTO.setTipoEmpresa(request.getParameter("tipo"));
                    objEmpresasDTO.setSetor(request.getParameter("setor"));
                    objEmpresasDTO.setEmail(request.getParameter("email"));
                    objEmpresasDTO.setSenha(request.getParameter("senha"));
                    objEmpresasDTO.setDescricao(request.getParameter("descricao"));
                    objEmpresasDTO.setLocalizacao(request.getParameter("localizacao"));
                    
                    
                    EmpresasDAO objEmpresasDAO = new EmpresasDAO();
                    objEmpresasDAO.Cadastrar(objEmpresasDTO);
                    
                    
                } catch (Exception e) {
                    RequestDispatcher rd = request.getRequestDispatcher("signupEmpresa.html");
                
                }
        
                response.sendRedirect("loginEmpresa.html");
        %>

    </body>
</html>
