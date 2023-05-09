package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import DTO.EmpresasDTO;
import java.util.ArrayList;
import java.util.List;

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

    public List<EmpresasDTO> listar() {
        String sql = "select Nome_Empresa,Contato,Email from tbEmpresas;";
        ArrayList<EmpresasDTO> listar = new ArrayList<>();
        EmpresasDTO empDao = new EmpresasDTO();

        try {
            conexao = new ConexaoDAO().conexaoBD();
            prepS = conexao.prepareStatement(sql);
            rSet = prepS.executeQuery();

            while (rSet.next()) {
                empDao.setNomeEmpresa(rSet.getString("Nome_Empresa"));
                empDao.setContato(rSet.getString("Contato"));
                empDao.setEmail(rSet.getString("Email"));
                listar.add(empDao);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error " + e.getMessage());
        }
        return listar;
    }
}
