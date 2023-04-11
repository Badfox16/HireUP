
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import DTO.UsuariosDTO;

public class UsuariosDAO {
    
    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;
    
    public ResultSet LoginUsr(UsuariosDTO objUsuariosDTO) throws ClassNotFoundException{
        String sql = "select * from tbUsuarios where Email = ? and Senha = ?";
        conexao = new ConexaoDAO().conexaoBD();
        
        try {

            prepS = conexao.prepareStatement(sql);
            
            prepS.setString(1, objUsuariosDTO.getEmail());
            prepS.setString(2, objUsuariosDTO.getSenha());
            
            rSet = prepS.executeQuery();
            return rSet;

        } catch (SQLException erro) {
           JOptionPane.showMessageDialog(null, "Verificar credenciais: "+ erro);
        }
        return null;
        
    }

    public void Cadastrar(UsuariosDTO objUsuariosDTO) throws ClassNotFoundException {
        String sql = "insert into tbUsuarios(Email, Nome, Senha) values(?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objUsuariosDTO.getEmail());
            prepS.setString(2, objUsuariosDTO.getNome());        
            prepS.setString(3, objUsuariosDTO.getSenha());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }

}
