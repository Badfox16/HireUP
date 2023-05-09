
package DTO;

public class EmpresasDTO {
    private int IdEmpresa;
    private String NomeEmpresa, Contato, Email, Descricao;
    
    public int getIdEmpresa() {
        return IdEmpresa;
    }
    public void setIdEmpresa(int idEmpresa) {
        IdEmpresa = idEmpresa;
    }
    public String getNomeEmpresa() {
        return NomeEmpresa;
    }
    public void setNomeEmpresa(String nomeEmpresa) {
        NomeEmpresa = nomeEmpresa;
    }
    public String getContato() {
        return Contato;
    }
    public void setContato(String contato) {
        Contato = contato;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String email) {
        Email = email;
    }
    public String getDescricao() {
        return Descricao;
    }
    public void setDescricao(String descricao) {
        Descricao = descricao;
    }

}
