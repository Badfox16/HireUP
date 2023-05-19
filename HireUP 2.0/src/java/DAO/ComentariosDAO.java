/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ComentarioDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author godal
 */
public class ComentariosDAO {

    private final Connection CONEXAO;
    private final static List<ComentariosDAO> LISTCOMENTARIO = new ArrayList<>();
    private final ComentarioDTO OBJCOMENTDTO = new ComentarioDTO();
    private PreparedStatement prSet = null;
    private ResultSet rstSet = null;

    public ComentariosDAO() throws ClassNotFoundException {
        this.CONEXAO = new ConexaoDAO().conexaoBD();
    }

    public void create(ComentarioDTO createDTO) throws ClassNotFoundException, SQLException {
        String sql = "insert into tbComentarios (Comentario,UsuarioId,PerfilId) values(?,?,?);";
        prSet = CONEXAO.prepareStatement(sql);

        prSet.setString(1, createDTO.);
    }
}
