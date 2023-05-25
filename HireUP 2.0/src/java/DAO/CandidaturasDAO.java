package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import DTO.CandidaturasDTO;
import java.sql.PreparedStatement;

public class CandidaturasDAO {

    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

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
    
    
    
    
    
}
