
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import DTO.EmpresasDTO;

public class EmpresasDAO {

    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

    public void Cadastrar(EmpresasDTO objEmpresasDTO) throws ClassNotFoundException {
        String sql = "insert into tbEmpresas(Nome_Empresa, Contato, Email, Descricao) values(?,?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpresasDTO.getNomeEmpresa());
            prepS.setString(2, objEmpresasDTO.getContato());
            prepS.setString(3, objEmpresasDTO.getEmail());
            prepS.setString(4, objEmpresasDTO.getDescricao());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }
}
