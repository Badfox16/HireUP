/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ComentariosDTO;
import java.sql.*;
import java.util.*;

/**
 *
 * @author godal
 */
public class ComentariosDAO {

    private final Connection CONEXAO;
    private final List LISTCOMENTARIO;
    private PreparedStatement prSet;
    private ResultSet rstSet;

    public ComentariosDAO() throws ClassNotFoundException {
        this.CONEXAO = new ConexaoDAO().conexaoBD();
        this.LISTCOMENTARIO = new ArrayList<>();
        this.prSet = null;
        this.rstSet = null;
    }

//    Comentario dos usuarios apenas (chat global)
    public void comentarioUsuario(ComentariosDTO createDTO) throws ClassNotFoundException, SQLException {
        String sql = "insert into tbComentarios (Id_UsuarioFK,Comentario) values(?,?);";
        prSet = CONEXAO.prepareStatement(sql);

        prSet.setInt(1, createDTO.getIdUsuarioFK());
        prSet.setString(2, createDTO.getComentario());

        prSet.execute();
        prSet.close();
        CONEXAO.close();
    }

//    Comentario da empresa (no perfil da empresa e no global)
    public void comentarioEmpresa(ComentariosDTO createDTO) throws ClassNotFoundException, SQLException {
        String sql = "insert into tbComentarios (Id_UsuarioFK,Id_EmpresaFK,Comentario) values(?,?,?);";
        prSet = CONEXAO.prepareStatement(sql);

        prSet.setInt(1, createDTO.getIdUsuarioFK());
        prSet.setInt(2, createDTO.getIdEmpresaFK());
        prSet.setString(3, createDTO.getComentario());

        prSet.execute();
        prSet.close();
        CONEXAO.close();
    }

//    Listar os comentarios (chat global)
    public List<ComentariosDTO> userComentario() throws ClassNotFoundException, SQLException {
        String sql = "select Nome as Usuario, Comentario from tbComentarios as Coments join tbUsuarios as Users on Coments.Id_UsuarioFK = Users.Id_Usuario  order by Id_Comentario;";
        prSet = CONEXAO.prepareStatement(sql);

        rstSet = prSet.executeQuery();
        while (rstSet.next()) {
            ComentariosDTO objComentDTO = new ComentariosDTO();

            objComentDTO.setComentario(rstSet.getString("Comentario"));
            objComentDTO.setNome(rstSet.getString("Usuario"));

            LISTCOMENTARIO.add(objComentDTO);
        }
        prSet.close();
        CONEXAO.close();
        return LISTCOMENTARIO;
    }

//    Listar da empresa (no perfil da empresa)
}
