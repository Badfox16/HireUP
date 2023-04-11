
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
            try {
                UsuariosDTO objUsuariosDTO = new UsuariosDTO();
                  
                    objUsuariosDTO.setEmail(request.getParameter("email"));
                    objUsuariosDTO.setNome(request.getParameter("nome"));
                    objUsuariosDTO.setSenha(request.getParameter("senha"));
                    
                    UsuariosDAO objUsuariosDAO = new UsuariosDAO();
                    objUsuariosDAO.Cadastrar(objUsuariosDTO);

                    response.sendRedirect("login.html");
                    
            } catch (Exception e) {
                out.print("<script> alert('O login falhou')</script>");
            }

            
        %>
    </body>
</html>
