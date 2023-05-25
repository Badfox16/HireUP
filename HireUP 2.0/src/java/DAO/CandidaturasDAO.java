package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import DTO.CandidaturasDTO;

public class CandidaturasDAO {

    private Connection conexao;
    private PreparedStatement prepS;
    private ResultSet rSet;
    
    //É RASCUNHOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

    public List<CandidaturasDTO> listarCandidaturas() throws SQLException, ClassNotFoundException {
        List<CandidaturasDTO> listaCandidaturas = new ArrayList<>();
        String sql = "SELECT * FROM tbCandidaturas "
                + "JOIN tbUsuarios ON tbCandidaturas.UsuarioFK = tbUsuarios.Id_Usuario "
                + "JOIN tbEmpresas ON tbCandidaturas.EmpresaFK = tbEmpresas.Id_Empresa";

        conexao = new ConexaoDAO().conexaoBD();

        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conexao.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                CandidaturasDTO candidatura = new CandidaturasDTO();
                candidatura.setIdCandidatura(rs.getInt("Id_Candidatura"));
                candidatura.setEstado(rs.getString("Estado"));
                candidatura.setFaleSobre(rs.getString("Fale_Sobre"));
                candidatura.setPqVoce(rs.getString("Pq_Voce"));
                candidatura.setEmpresaFK(rs.getInt("EmpresaFK"));
                candidatura.setUsuarioFK(rs.getInt("UsuarioFK"));
                candidatura.setEmpregoFK(rs.getInt("EmpregoFK"));

                listaCandidaturas.add(candidatura);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar candidaturas: " + e.getMessage());
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
            conexao.close();
        }

        return listaCandidaturas;
    }

    public void cadastrarCandidatura(CandidaturasDTO candidatura) throws ClassNotFoundException {
        String sql = "INSERT INTO tbCandidaturas (Estado, Fale_Sobre, Pq_Voce, EmpresaFK, UsuarioFK, EmpregoFK) VALUES (?, ?, ?, ?, ?, ?)";

        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setString(1, candidatura.getEstado());
            prepS.setString(2, candidatura.getFaleSobre());
            prepS.setString(3, candidatura.getPqVoce());
            prepS.setInt(4, candidatura.getEmpresaFK());
            prepS.setInt(5, candidatura.getUsuarioFK());
            prepS.setInt(6, candidatura.getEmpregoFK());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar candidatura: " + e.getMessage());
        }
    }

    public void atualizarCandidatura(CandidaturasDTO candidatura) throws ClassNotFoundException {
        String sql = "UPDATE tbCandidaturas SET Estado = ?, Fale_Sobre = ?, Pq_Voce = ?, EmpresaFK = ?, UsuarioFK = ?, EmpregoFK = ? WHERE Id_Candidatura = ?";

        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setString(1, candidatura.getEstado());
            prepS.setString(2, candidatura.getFaleSobre());
            prepS.setString(3, candidatura.getPqVoce());
            prepS.setInt(4, candidatura.getEmpresaFK());
            prepS.setInt(5, candidatura.getUsuarioFK());
            prepS.setInt(6, candidatura.getEmpregoFK());
            prepS.setInt(7, candidatura.getIdCandidatura());

            prepS.executeUpdate();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar candidatura: " + e.getMessage());
        }
    }

    public void excluirCandidatura(int idCandidatura) throws ClassNotFoundException {
        String sql = "DELETE FROM tbCandidaturas WHERE Id_Candidatura = ?";
        
        conexao = new ConexaoDAO().conexaoBD();
        
        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setInt(1, idCandidatura);

            prepS.executeUpdate();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir candidatura: " + e.getMessage());
        }
    }
}
