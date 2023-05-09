package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import DTO.CategoriasDTO;

public class CategoriasDAO {


    public List<CategoriasDTO> listarCategorias() throws SQLException, ClassNotFoundException {

        List<CategoriasDTO> listaCategorias = new ArrayList<>();

        String sql = "SELECT * FROM tbCategorias";
        Connection conexao = new ConexaoDAO().conexaoBD();
        Statement stmt = null;
        ResultSet rs = null;
        try {

            stmt = conexao.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String Nome = rs.getString("Nome");

                CategoriasDTO Categoria = new CategoriasDTO();
                Categoria.setNome(Nome);


                listaCategorias.add(Categoria);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        } finally {
            stmt.close();
            rs.close();
            conexao.close();
        }
        return listaCategorias;
    }
}
