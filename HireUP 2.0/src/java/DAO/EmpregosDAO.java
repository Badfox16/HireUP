package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import DTO.EmpregosDTO;

public class EmpregosDAO {

    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

    public void cadastrarEmprego(EmpregosDTO emprego) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO tbEmpregos (Empresa, Titulo, Posicao, SalarioMin, SalarioMax, Setor, Localizacao, Tipo, Descricao, Requisitos) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        conexao = new ConexaoDAO().conexaoBD();
        PreparedStatement stmt = null;
        
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, emprego.getEmpresa());
            stmt.setString(2, emprego.getTitulo());
            stmt.setString(3, emprego.getPosicao());
            stmt.setInt(4, emprego.getSalarioMin());
            stmt.setInt(5, emprego.getSalarioMax());
            stmt.setString(6, emprego.getSetor());
            stmt.setString(7, emprego.getLocalizacao());
            stmt.setString(8, emprego.getTipo());
            stmt.setString(9, emprego.getDescricao());
            stmt.setString(10, emprego.getRequisitos());
            
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            conexao.close();
        }
    }
    

    public List<EmpregosDTO> listarEmpregos() throws SQLException, ClassNotFoundException {

        List<EmpregosDTO> listaEmpregos = new ArrayList<>();

        String sql = "SELECT * FROM tbEmpregos";
        conexao = new ConexaoDAO().conexaoBD();
        Statement stmt = null;
        ResultSet rs = null;
        try {

            stmt = conexao.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String empresa = rs.getString("Empresa");
                String titulo = rs.getString("titulo");
                String posicao = rs.getString("Posicao");
                int SalarioMin = rs.getInt("SalarioMin");
                int SalarioMax = rs.getInt("SalarioMax");
                String Setor = rs.getString("Setor");
                String Localizacao = rs.getString("Localizacao");
                String Tipo = rs.getString("Tipo");
                String Descricao = rs.getString("Descricao");
                String Requisitos = rs.getString("Requisitos");

                EmpregosDTO Emprego = new EmpregosDTO();
                Emprego.setEmpresa(empresa);
                Emprego.setTitulo(titulo);
                Emprego.setPosicao(posicao);
                Emprego.setSalarioMin(SalarioMin);
                Emprego.setSalarioMax(SalarioMax);
                Emprego.setSetor(Setor);
                Emprego.setLocalizacao(Localizacao);
                Emprego.setTipo(Tipo);
                Emprego.setDescricao(Descricao);
                Emprego.setRequisitos(Requisitos);

                listaEmpregos.add(Emprego);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        } finally {
            stmt.close();
            rs.close();
            conexao.close();
        }
        return listaEmpregos;
    }

    public void Remover(EmpregosDTO objEmpregosDTO) throws ClassNotFoundException {
        String sql = "delete from tbEmpregos where Id_Emprego=?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setInt(1, objEmpregosDTO.getIdEmprego());

            prepS.execute();
            prepS.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }

    public void editarEmpregos(EmpregosDTO objEmpregosDTO) throws ClassNotFoundException {
        String sql = "update tbEmpreg Posicao=?, SalarioMin=?, SalarioMax=?, Setor=?, Localizacao=?, Tipo=?, Descricao=?, Requisitos=? where Id_Emprego=?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpregosDTO.getPosicao());
            prepS.setInt(2, objEmpregosDTO.getSalarioMin());
            prepS.setInt(3, objEmpregosDTO.getSalarioMin());
            prepS.setString(4, objEmpregosDTO.getSetor());
            prepS.setString(5, objEmpregosDTO.getLocalizacao());
            prepS.setString(6, objEmpregosDTO.getTipo());
            prepS.setString(7, objEmpregosDTO.getDescricao());
            prepS.setString(8, objEmpregosDTO.getRequisitos());
            prepS.setInt(9, objEmpregosDTO.getIdEmprego());

            prepS.execute();
            prepS.close();

        } catch (SQLException e) {

        }
    }

    public List<EmpregosDTO> pesquisarEmpregos(String valor) throws SQLException, ClassNotFoundException {
        List<EmpregosDTO> listaEmpregos = new ArrayList<>();
        String sql = "SELECT * FROM tbEmpregos WHERE LOWER(Posicao) LIKE ?";
        conexao = new ConexaoDAO().conexaoBD();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, "%" + valor.toLowerCase() + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("Id_Emprego");
                String empresa = rs.getString("Empresa");
                String titulo = rs.getString("Titulo");
                String posicao = rs.getString("Posicao");
                int salarioMin = rs.getInt("SalarioMin");
                int salarioMax = rs.getInt("SalarioMax");
                String setor = rs.getString("Setor");
                String localizacao = rs.getString("Localizacao");
                String tipo = rs.getString("Tipo");
                String descricao = rs.getString("Descricao");
                String requisitos = rs.getString("Requisitos");

                EmpregosDTO emprego = new EmpregosDTO();
                emprego.setIdEmprego(id);
                emprego.setEmpresa(empresa);
                emprego.setTitulo(titulo);
                emprego.setPosicao(posicao);
                emprego.setSalarioMin(salarioMin);
                emprego.setSalarioMax(salarioMax);
                emprego.setSetor(setor);
                emprego.setLocalizacao(localizacao);
                emprego.setTipo(tipo);
                emprego.setDescricao(descricao);
                emprego.setRequisitos(requisitos);

                listaEmpregos.add(emprego);
            }
        } catch (Exception e) {
        
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
            conexao.close();
        }
        return listaEmpregos;
    }

    public List<EmpregosDTO> perfilEmprego(EmpregosDTO empregosDTO) throws SQLException, ClassNotFoundException {
        List<EmpregosDTO> listar = new ArrayList<>();
        conexao = new ConexaoDAO().conexaoBD();
        EmpregosDTO dto = new EmpregosDTO();
        String sql = "select * from tbEmpregos where Empresa=?;";

        prepS = conexao.prepareStatement(sql);
        prepS.setString(1, empregosDTO.getEmpresa());

        rSet = prepS.executeQuery();
        if (rSet.next()) {
            dto.setEmpresa(rSet.getString("Empresa"));
            dto.setPosicao(rSet.getString("Posicao"));
            dto.setDescricao(rSet.getString("Descricao"));
            dto.setSetor(rSet.getString("Setor"));
            dto.setIdEmprego(rSet.getInt("Id_Emprego"));
            dto.setLocalizacao(rSet.getString("localizacao"));
            dto.setSalarioMin(rSet.getInt("SalarioMin"));
            dto.setSalarioMax(rSet.getInt("SalarioMax"));
            dto.setRequisitos(rSet.getString("Requisitos"));
            dto.setDescricao(rSet.getString("Descricao"));

            listar.add(dto);

            prepS.close();
            conexao.close();
        }
        return listar;
    }
    

}
