/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author godal
 */
public class ComentariosDAO {

    private final  Connection CONEXAO = new ConexaoDAO().conexaoBD();
    private final static List<ComentariosDAO> LISTCOMENTARIO = new ArrayList<>();
    private final ComentariosDAO OBJCOMENTDAO = new ComentariosDAO();
    private PreparedStatement prSet = null;
    private ResultSet rstSet = null;

    public void create(ComentariosDAO createDAO) throws ClassNotFoundException, SQLException {
        
    }
}
