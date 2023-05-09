
package DTO;

public class EmpresasDTO {
    private int IdEmpresa;
    private String NomeEmpresa, Contato, Email, Descricao,Setor,Empregos,Tipo_Empresa,Localizacao;

    public String getSetor() {
        return Setor;
    }

    public void setSetor(String Setor) {
        this.Setor = Setor;
    }

    public String getEmpregos() {
        return Empregos;
    }

    public void setEmpregos(String Empregos) {
        this.Empregos = Empregos;
    }

    public String getTipo_Empresa() {
        return Tipo_Empresa;
    }

    public void setTipo_Empresa(String Tipo_Empresa) {
        this.Tipo_Empresa = Tipo_Empresa;
    }

    public String getLocalizacao() {
        return Localizacao;
    }

    public void setLocalizacao(String Localizacao) {
        this.Localizacao = Localizacao;
    }
    
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
