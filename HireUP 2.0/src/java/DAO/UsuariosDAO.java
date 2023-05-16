package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import DTO.UsuariosDTO;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO {

    Connection conexao;
    PreparedStatement prepS;
    ResultSet rSet;

    public ResultSet LoginUsr(UsuariosDTO objUsuariosDTO) throws ClassNotFoundException {
        String sql = "select * from tbUsuarios where Email = ? and Senha = ?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objUsuariosDTO.getEmail());
            prepS.setString(2, objUsuariosDTO.getSenha());

            rSet = prepS.executeQuery();
            return rSet;

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "Verificar credenciais: " + erro);
        }
        return null;

    }

    public void Cadastrar(UsuariosDTO objUsuariosDTO) throws ClassNotFoundException {
        String sql = "insert into tbUsuarios(Email, Nome, Senha) values(?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objUsuariosDTO.getEmail());
            prepS.setString(2, objUsuariosDTO.getNome());
            prepS.setString(3, objUsuariosDTO.getSenha());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }

    }

    public List<UsuariosDTO> listarUsuarios() throws SQLException, ClassNotFoundException {

        List<UsuariosDTO> listaUsuarios = new ArrayList<>();

        String sql = "SELECT * FROM tbUsuarios";
        conexao = new ConexaoDAO().conexaoBD();
        Statement stmt = null;
        ResultSet rs = null;
        try {

            stmt = conexao.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String email = rs.getString("Email");
                String nome = rs.getString("Nome");
                String apelido = rs.getString("Apelido");
                String setor = rs.getString("Setor");
                String localizacao = rs.getString("Localizacao");
                String formacao = rs.getString("Formacao");
                String senha = rs.getString("Senha");

                UsuariosDTO usuario = new UsuariosDTO();
                usuario.setEmail(email);
                usuario.setNome(nome);
                usuario.setApelido(apelido);
                usuario.setSetor(setor);
                usuario.setLocalizacao(localizacao);
                usuario.setFormacao(formacao);
                usuario.setSenha(senha);

                listaUsuarios.add(usuario);
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

    public void editarUsuario(UsuariosDTO usuario) throws ClassNotFoundException, SQLException {

        String sql = "UPDATE tbUsuarios SET Nome = ?, Apelido = ?, Setor = ?, Localizacao = ?, Formacao = ? WHERE Email = ?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, usuario.getNome());
            prepS.setString(2, usuario.getApelido());
            prepS.setString(3, usuario.getSetor());
            prepS.setString(4, usuario.getLocalizacao());
            prepS.setString(5, usuario.getFormacao());
            prepS.setString(6, usuario.getEmail());

            prepS.executeUpdate();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ConexaoSQL: " + e.getMessage());
        }
    }

    public void deletarUsuario(UsuariosDTO delete) throws ClassNotFoundException {
        String sql = "delete from tbUsuarios where Email =?";
        conexao = new ConexaoDAO().conexaoBD();
        try {
            prepS = conexao.prepareStatement(sql);
            prepS.setString(1, delete.getEmail());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public List<UsuariosDTO> listSelect(UsuariosDTO listDTO) throws SQLException, ClassNotFoundException {
        List<UsuariosDTO> listar = new ArrayList<>();
        String sql = "SELECT * FROM tbUsuarios where Email = ?";
        UsuariosDTO dto = new UsuariosDTO();
        conexao = new ConexaoDAO().conexaoBD();
        prepS = conexao.prepareStatement(sql);

        prepS.setString(1, listDTO.getEmail());
        rSet = prepS.executeQuery();

        if (rSet.next()) {
            dto.setNome(rSet.getString("Nome"));
            dto.setEmail(rSet.getString("Email"));
            dto.setApelido(rSet.getString("Apelido"));
            dto.setFormacao(rSet.getString("Formacao"));
            dto.setSenha(rSet.getString("Senha"));
            dto.setLocalizacao(rSet.getString("Localizacao"));
            dto.setSetor(rSet.getString("Setor"));

            listar.add(dto);
            prepS.close();
            conexao.close();
        }
        return listar;
    }
}
