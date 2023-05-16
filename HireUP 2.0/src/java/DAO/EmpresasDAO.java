package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

import javax.swing.JOptionPane;

import DTO.EmpresasDTO;
import java.util.ArrayList;
import java.util.List;

public class EmpresasDAO {

    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

    public void Cadastrar(EmpresasDTO objEmpresasDTO) throws ClassNotFoundException {
        String sql = "insert into tbEmpresas(Nome_Empresa, Tipo_Empresa, Setor, Email, Senha, Descricao, Localizacao) values(?,?,?,?,?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpresasDTO.getNomeEmpresa());
            prepS.setString(2, objEmpresasDTO.getTipoEmpresa());
            prepS.setString(3, objEmpresasDTO.getSetor());
            prepS.setString(4, objEmpresasDTO.getEmail());
            prepS.setString(5, objEmpresasDTO.getSenha());
            prepS.setString(6, objEmpresasDTO.getDescricao());
            prepS.setString(7, objEmpresasDTO.getLocalizacao());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }

        public List<EmpresasDTO> listar() throws SQLException, ClassNotFoundException {

        List<EmpresasDTO> listaUsuarios = new ArrayList<>();

        String sql = "SELECT * FROM tbEmpresas";
        conexao = new ConexaoDAO().conexaoBD();
        Statement stmt = null;
        ResultSet rs = null;
        try {

            stmt = conexao.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("Id_Empresa");
                String nome = rs.getString("Nome_Empresa");
                String tipo = rs.getString("Tipo_Empresa");
                String setor = rs.getString("Setor");
                String email = rs.getString("Email");
                String senha = rs.getString("Senha");
                String descricao = rs.getString("Descricao");
                String localizacao = rs.getString("Localizacao");
                String empregos = rs.getString("Empregos");

                EmpresasDTO empresa = new EmpresasDTO();
                empresa.setIdEmpresa(id);
                empresa.setNomeEmpresa(nome);
                empresa.setTipoEmpresa(tipo);
                empresa.setSetor(setor);
                empresa.setEmail(email);
                empresa.setSenha(senha);
                empresa.setDescricao(descricao);
                empresa.setLocalizacao(localizacao);
                empresa.setEmpregos(empregos);
            
                listaUsuarios.add(empresa);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        } finally {
            stmt.close();
            rs.close();
            conexao.close();
        }
        return listaUsuarios;
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
        String sql = "delete from tbEmpresas where Id_Empresa=?;";
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

    public List<EmpresasDTO> listarEmpresas(EmpresasDTO listarDTO) throws SQLException, ClassNotFoundException {
        List<EmpresasDTO> listar = new ArrayList<>();
        conexao = new ConexaoDAO().conexaoBD();
        EmpresasDTO dto = new EmpresasDTO();
        String sql = "select * from tbEmpresas where Email=?;";

        prepS = conexao.prepareStatement(sql);
        prepS.setString(1, listarDTO.getEmail());

        rSet = prepS.executeQuery();
        if (rSet.next()) {
            dto.setNomeEmpresa(rSet.getString("Nome_Empresa"));
            dto.setEmail(rSet.getString("Email"));
            dto.setDescricao(rSet.getString("Descricao"));
            dto.setSenha(rSet.getString("Senha"));
            dto.setSetor(rSet.getString("Setor"));
            dto.setIdEmpresa(rSet.getInt("Id_Empresa"));
            dto.setLocalizacao(rSet.getString("localizacao"));
            dto.setTipoEmpresa(rSet.getString("Tipo_Empresa"));
            listar.add(dto);

            prepS.close();
            conexao.close();
        }
        return listar;
    }
}
