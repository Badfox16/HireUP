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
import DTO.EmpregosDTO;
import DTO.EmpresasDTO;
import DTO.UsuariosDTO;

public class CandidaturasDAO {

    private Connection conexao;
    private PreparedStatement prepS;
    private ResultSet rSet;

    /*É RASCUNHOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
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
     */
    //VAI APRENDER NO PAGES/Candidaturas.jsp como listar
    public List<CandidaturasDTO> listarCandidaturas() throws SQLException, ClassNotFoundException {
        List<CandidaturasDTO> listaCandidaturas = new ArrayList<>();
        String sql = "SELECT c.Id_Candidatura, c.Estado, c.Fale_Sobre, c.Pq_Voce, "
                + "u.Id_Usuario, u.Email, u.Nome, u.Apelido, u.Setor as SetorUsuario, u.Localizacao as LocalizacaoUsuario, "
                + "e.Id_Empresa, e.Nome_Empresa, e.Tipo_Empresa, e.Setor as SetorEmpresa, e.Email as EmailEmpresa, e.Localizacao as LocalizacaoEmpresa, "
                + "emp.Id_Emprego, emp.Empresa, emp.Titulo, emp.Posicao, emp.SalarioMin, emp.SalarioMax, emp.Setor as SetorEmprego, emp.Localizacao as LocalizacaoEmprego, emp.Tipo as TipoEmprego, emp.Descricao, emp.Requisitos "
                + "FROM tbCandidaturas c "
                + "JOIN tbUsuarios u ON c.UsuarioFK = u.Id_Usuario "
                + "JOIN tbEmpresas e ON c.EmpresaFK = e.Id_Empresa "
                + "JOIN tbEmpregos emp ON c.EmpregoFK = emp.Id_Emprego";

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

                // Configurar informações do usuário
                UsuariosDTO usuario = new UsuariosDTO();
                usuario.setIdUsuario(rs.getInt("Id_Usuario"));
                usuario.setEmail(rs.getString("Email"));
                usuario.setNome(rs.getString("Nome"));
                usuario.setApelido(rs.getString("Apelido"));
                usuario.setSetor(rs.getString("SetorUsuario"));
                usuario.setLocalizacao(rs.getString("LocalizacaoUsuario"));
                candidatura.setUsuarioFK(usuario);

                // Configurar informações da empresa
                EmpresasDTO empresa = new EmpresasDTO();
                empresa.setIdEmpresa(rs.getInt("Id_Empresa"));
                empresa.setNomeEmpresa(rs.getString("Nome_Empresa"));
                empresa.setTipoEmpresa(rs.getString("Tipo_Empresa"));
                empresa.setSetor(rs.getString("SetorEmpresa"));
                empresa.setEmail(rs.getString("EmailEmpresa"));
                empresa.setLocalizacao(rs.getString("LocalizacaoEmpresa"));
                candidatura.setEmpresaFK(empresa);

                // Configurar informações do emprego
                EmpregosDTO emprego = new EmpregosDTO();
                emprego.setIdEmprego(rs.getInt("Id_Emprego"));
                emprego.setEmpresa(rs.getString("Empresa"));
                emprego.setTitulo(rs.getString("Titulo"));
                emprego.setPosicao(rs.getString("Posicao"));
                emprego.setSalarioMin(rs.getInt("SalarioMin"));
                emprego.setSalarioMax(rs.getInt("SalarioMax"));
                emprego.setSetor(rs.getString("SetorEmprego"));
                emprego.setLocalizacao(rs.getString("LocalizacaoEmprego"));
                emprego.setTipo(rs.getString("TipoEmprego"));
                emprego.setDescricao(rs.getString("Descricao"));
                emprego.setRequisitos(rs.getString("Requisitos"));
                candidatura.setEmpregoFK(emprego);

                listaCandidaturas.add(candidatura);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }

        return listaCandidaturas;
    }

    public List<CandidaturasDTO> listarCandidaturasPorUsuario(int idUsuario) throws SQLException, ClassNotFoundException {
        List<CandidaturasDTO> listaCandidaturas = new ArrayList<>();
        String sql = "SELECT c.Id_Candidatura, c.Estado, c.Fale_Sobre, c.Pq_Voce, "
                + "u.Id_Usuario, u.Email, u.Nome, u.Apelido, u.Setor as SetorUsuario, u.Localizacao as LocalizacaoUsuario, "
                + "e.Id_Empresa, e.Nome_Empresa, e.Tipo_Empresa, e.Setor as SetorEmpresa, e.Email as EmailEmpresa, e.Localizacao as LocalizacaoEmpresa, "
                + "emp.Id_Emprego, emp.Empresa, emp.Titulo, emp.Posicao, emp.SalarioMin, emp.SalarioMax, emp.Setor as SetorEmprego, emp.Localizacao as LocalizacaoEmprego, emp.Tipo as TipoEmprego, emp.Descricao, emp.Requisitos "
                + "FROM tbCandidaturas c "
                + "JOIN tbUsuarios u ON c.UsuarioFK = u.Id_Usuario "
                + "JOIN tbEmpresas e ON c.EmpresaFK = e.Id_Empresa "
                + "JOIN tbEmpregos emp ON c.EmpregoFK = emp.Id_Emprego "
                + "WHERE u.Id_Usuario = ?";

        conexao = new ConexaoDAO().conexaoBD();

        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();

            while (rs.next()) {
                CandidaturasDTO candidatura = new CandidaturasDTO();
                candidatura.setIdCandidatura(rs.getInt("Id_Candidatura"));
                candidatura.setEstado(rs.getString("Estado"));
                candidatura.setFaleSobre(rs.getString("Fale_Sobre"));
                candidatura.setPqVoce(rs.getString("Pq_Voce"));

                // Configurar informações do usuário
                UsuariosDTO usuario = new UsuariosDTO();
                usuario.setIdUsuario(rs.getInt("Id_Usuario"));
                usuario.setEmail(rs.getString("Email"));
                usuario.setNome(rs.getString("Nome"));
                usuario.setApelido(rs.getString("Apelido"));
                usuario.setSetor(rs.getString("SetorUsuario"));
                usuario.setLocalizacao(rs.getString("LocalizacaoUsuario"));
                candidatura.setUsuarioFK(usuario);

                // Configurar informações da empresa
                EmpresasDTO empresa = new EmpresasDTO();
                empresa.setIdEmpresa(rs.getInt("Id_Empresa"));
                empresa.setNomeEmpresa(rs.getString("Nome_Empresa"));
                empresa.setTipoEmpresa(rs.getString("Tipo_Empresa"));
                empresa.setSetor(rs.getString("SetorEmpresa"));
                empresa.setEmail(rs.getString("EmailEmpresa"));
                empresa.setLocalizacao(rs.getString("LocalizacaoEmpresa"));
                candidatura.setEmpresaFK(empresa);

                // Configurar informações do emprego
                EmpregosDTO emprego = new EmpregosDTO();
                emprego.setIdEmprego(rs.getInt("Id_Emprego"));
                emprego.setEmpresa(rs.getString("Empresa"));
                emprego.setTitulo(rs.getString("Titulo"));
                emprego.setPosicao(rs.getString("Posicao"));
                emprego.setSalarioMin(rs.getInt("SalarioMin"));
                emprego.setSalarioMax(rs.getInt("SalarioMax"));
                emprego.setSetor(rs.getString("SetorEmprego"));
                emprego.setLocalizacao(rs.getString("LocalizacaoEmprego"));
                emprego.setTipo(rs.getString("TipoEmprego"));
                emprego.setDescricao(rs.getString("Descricao"));
                emprego.setRequisitos(rs.getString("Requisitos"));
                candidatura.setEmpregoFK(emprego);

                listaCandidaturas.add(candidatura);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }

        return listaCandidaturas;
    }

    public void deletarCandidatura(int idCandidatura) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM tbCandidaturas WHERE Id_Candidatura = ?";

        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setInt(1, idCandidatura);

            prepS.executeUpdate();
        } finally {
            if (prepS != null) {
                prepS.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
    }

}
