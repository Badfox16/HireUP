package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import DTO.AdminDTO;

public class AdminDAO {
    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

    public ResultSet LoginAdmin(AdminDTO objAdminDTO) throws ClassNotFoundException {
        String sql = "select * from tbAdmin where Username = ? and Senha = ?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objAdminDTO.getUsername());
            prepS.setString(2, objAdminDTO.getSenha());

            rSet = prepS.executeQuery();
            return rSet;

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "Verificar credenciais: " + erro);
        }
        return null;

    }
}
