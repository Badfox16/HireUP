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
        String sql = "insert into tbEmpresas(Nome_Empresa, Senha, Email, Descricao) values(?,?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpresasDTO.getNomeEmpresa());
            prepS.setString(2, objEmpresasDTO.getSenha());
            prepS.setString(3, objEmpresasDTO.getEmail());
            prepS.setString(4, objEmpresasDTO.getDescricao());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }

    public List<EmpresasDTO> listar() throws ClassNotFoundException {
        String sql = "select * from tbEmpresas;";
        ArrayList<EmpresasDTO> listar = new ArrayList<>();
        EmpresasDTO dto = new EmpresasDTO();
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);
            rSet = prepS.executeQuery();

            while (rSet.next()) {
                dto.setNomeEmpresa(rSet.getString("Nome_Empresa"));
                dto.setEmail(rSet.getString("Email"));
                dto.setDescricao(rSet.getString("Descricao"));
                dto.setSenha(rSet.getString("Senha"));
                dto.setSetor(rSet.getString("Setor"));
                dto.setIdEmpresa(rSet.getInt("Id_Empresa"));
                dto.setLocalizacao(rSet.getString("localizacao"));
                dto.setTipoEmpresa(rSet.getString("Tipo_Empresa"));
                listar.add(dto);
            }
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error " + e.getMessage());
        }
        return listar;
    }

    public void update(EmpresasDTO update) throws ClassNotFoundException {
        String sql = "update tbEmpresas set Nome_Empresa = ?,Senha = ?,Email = ?,Descricao = ?,Setor = ?,Empregos = ?,Tipo_Empresa = ?,Localizacao = ? where Id_Empresa = ?;";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, update.getNomeEmpresa());
            prepS.setString(2, update.getSenha());
            prepS.setString(3, update.getEmail());
            prepS.setString(4, update.getDescricao());
            prepS.setString(5, update.getSetor());
            prepS.setString(6, update.getEmpregos());
            prepS.setString(7, update.getTipoEmpresa());
            prepS.setString(8, update.getLocalizacao());
            prepS.setInt(9, update.getIdEmpresa());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error" + e.getMessage());
        }
    }

    public void deletEmpresa(EmpresasDTO delete) throws ClassNotFoundException {
        String sql = "delete from tbEmpresas where Id_Empresa=?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setInt(1, delete.getIdEmpresa());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }
}
