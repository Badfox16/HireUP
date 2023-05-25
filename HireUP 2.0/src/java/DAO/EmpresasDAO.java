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


    public ResultSet LoginEmpresa(EmpresasDTO objEmpresasDTO) throws ClassNotFoundException {
        String sql = "select * from tbEmpresas where Email = ? and Senha = ?";
        String sql2 = "select * from tbEmpresas where Email = ?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpresasDTO.getEmail());
            prepS.setString(2, objEmpresasDTO.getSenha());

            rSet = prepS.executeQuery();
            return rSet;

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "Verificar credenciais: ");
        }
        return null;
        

    }

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
        List<EmpresasDTO> listaEmpresas = new ArrayList<>();
        String sql = "SELECT * FROM tbEmpresas";
        conexao = new ConexaoDAO().conexaoBD();

        prepS = conexao.prepareStatement(sql);
        rSet = prepS.executeQuery();

        while (rSet.next()) {
            EmpresasDTO objEmpresa = new EmpresasDTO();

            objEmpresa.setIdEmpresa(rSet.getInt("Id_Empresa"));
            objEmpresa.setNomeEmpresa(rSet.getString("Nome_Empresa"));
            objEmpresa.setTipoEmpresa(rSet.getString("Tipo_Empresa"));
            objEmpresa.setSetor(rSet.getString("Setor"));
            objEmpresa.setEmail(rSet.getString("Email"));
            objEmpresa.setSenha(rSet.getString("Senha"));
            objEmpresa.setDescricao(rSet.getString("Descricao"));
            objEmpresa.setLocalizacao(rSet.getString("Localizacao"));
            objEmpresa.setEmpregos(rSet.getString("Empregos"));
            objEmpresa.setCategorias(rSet.getString("Categorias"));

            listaEmpresas.add(objEmpresa);
        }
        prepS.close();
        conexao.close();
        return listaEmpresas;
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

    public List<EmpresasDTO> perfilEmpresa(EmpresasDTO listarDTO) throws SQLException, ClassNotFoundException {
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
            dto.setEmpregos(rSet.getString("Empregos"));
            dto.setCategorias(rSet.getString("Categorias"));

            listar.add(dto);

            prepS.close();
            conexao.close();
        }
        return listar;
    }
}
