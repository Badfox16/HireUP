
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

    public void Cadastrar(EmpregosDTO objEmpregosDTO) throws ClassNotFoundException {
        String sql = "insert into tbempregos(Titulo, Posicao, Salario_Min, Salario_Max, Categoria, Localizacao, Tipo, Descricao, Requisitos) values(?,?,?,?,?,?,?,?,?)";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            
            prepS.setString(1, objEmpregosDTO.getTitulo());
            prepS.setString(2, objEmpregosDTO.getPosicao());
            prepS.setInt(3, objEmpregosDTO.getSalarioMin());
            prepS.setInt(4, objEmpregosDTO.getSalarioMax());
            prepS.setString(5, objEmpregosDTO.getCategoria());
            prepS.setString(6, objEmpregosDTO.getLocalizacao());
            prepS.setString(7, objEmpregosDTO.getTipo());
            prepS.setString(8, objEmpregosDTO.getDescricao());
            prepS.setString(9, objEmpregosDTO.getRequisitos());

            prepS.execute();
            prepS.close();
            conexao.close();
        } catch (SQLException e) {

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
                String titulo = rs.getString("titulo");
                String posicao = rs.getString("Posicao");
                int SalarioMin = rs.getInt("SalarioMin");
                int SalarioMax = rs.getInt("SalarioMax");
                String Categoria = rs.getString("Categoria");
                String Localizacao = rs.getString("Localizacao");
                String Tipo = rs.getString("Tipo");
                String Descricao = rs.getString("Descricao");
                String Requisitos = rs.getString("Requisitos");

                EmpregosDTO Emprego = new EmpregosDTO();
                Emprego.setTitulo(titulo);
                Emprego.setPosicao(posicao);
                Emprego.setSalarioMin(SalarioMin);
                Emprego.setSalarioMax(SalarioMax);
                Emprego.setCategoria(Categoria);
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
        String sql = "update tbEmpregInt Posicao=?, SalarioMin=?, SalarioMax=?, Categoria=?, Localizacao=?, Tipo=?, Descricao=?, Requisitos=? where Id_Emprego=?";
        conexao = new ConexaoDAO().conexaoBD();

        try {
            prepS = conexao.prepareStatement(sql);

            prepS.setString(1, objEmpregosDTO.getPosicao());
            prepS.setInt(2, objEmpregosDTO.getSalarioMin());
            prepS.setInt(3, objEmpregosDTO.getSalarioMin());
            prepS.setString(4, objEmpregosDTO.getCategoria());
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

}
