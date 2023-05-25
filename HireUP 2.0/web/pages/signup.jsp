
<%@page import="DAO.UsuariosDAO"%>
<%@page import="DTO.UsuariosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign UP</title>
    </head>
    <body>
        <%
            
            request.setCharacterEncoding("UTF-8");
            
            try {
                UsuariosDTO objUsuariosDTO = new UsuariosDTO();
                  
                    objUsuariosDTO.setEmail(request.getParameter("email"));
                    objUsuariosDTO.setNome(request.getParameter("nome"));
                    objUsuariosDTO.setApelido(request.getParameter("apelido"));
                    objUsuariosDTO.setSetor(request.getParameter("setor"));
                    objUsuariosDTO.setLocalizacao(request.getParameter("localizacao"));
                    objUsuariosDTO.setFormacao(request.getParameter("formacao"));
                    objUsuariosDTO.setSenha(request.getParameter("senha"));
                    
                    UsuariosDAO objUsuariosDAO = new UsuariosDAO();
                    objUsuariosDAO.Cadastrar(objUsuariosDTO);
                   
                    
            } catch (Exception e) {
              
            }

             response.sendRedirect("login.html");
        %>
    </body>
</html>
