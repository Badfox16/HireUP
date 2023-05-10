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
        String sql = "select * from tbEmpresas;";
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
                empDao.setDescricao(rSet.getString("Descricao"));
                empDao.setContato(rSet.getString("Contato"));
                empDao.setSetor(rSet.getString("Setor"));
                empDao.setIdEmpresa(rSet.getInt("Id_Empresa"));
                empDao.setLocalizacao(rSet.getString("localizacao"));
                empDao.setTipo_Empresa(rSet.getString("Tipo_Empresa"));
                listar.add(empDao);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error " + e.getMessage());
        }
        return listar;
    }

    public void update(EmpresasDTO parametro) {
        String sql = "update tbEmpresas set Nome_Empresa = ?,Contato = ?,Email = ?,Descricao = ?,Setor = ?,Empregos = ?,Tipo_Empresa = ?,Localizacao = ? where Id_Empresa = ?;";

        try {
            conexao = new ConexaoDAO().conexaoBD();
            PreparedStatement status = conexao.prepareStatement(sql);

            status.setString(1, parametro.getNomeEmpresa());
            status.setString(2, parametro.getContato());
            status.setString(3, parametro.getEmail());
            status.setString(4, parametro.getDescricao());
            status.setString(5, parametro.getSetor());
            status.setString(6, parametro.getEmpregos());
            status.setString(7, parametro.getTipo_Empresa());
            status.setString(8, parametro.getLocalizacao());
            status.setInt(9, parametro.getIdEmpresa());

            status.execute();
            status.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error" + e.getMessage());
        }

    }
}
