
package DTO;

public class EmpresasDTO {
    private int IdEmpresa;
    private String NomeEmpresa, TipoEmpresa, Setor, Email, Senha, Descricao, Localizacao, Empregos, Categorias;
    
    public String getCategorias() {
        return Categorias;
    }
    public void setCategorias(String categorias) {
        Categorias = categorias;
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
    public String getTipoEmpresa() {
        return TipoEmpresa;
    }
    public void setTipoEmpresa(String tipoEmpresa) {
        TipoEmpresa = tipoEmpresa;
    }
    public String getSetor() {
        return Setor;
    }
    public void setSetor(String setor) {
        Setor = setor;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String email) {
        Email = email;
    }
    public String getSenha() {
        return Senha;
    }
    public void setSenha(String senha) {
        Senha = senha;
    }
    public String getDescricao() {
        return Descricao;
    }
    public void setDescricao(String descricao) {
        Descricao = descricao;
    }
    public String getLocalizacao() {
        return Localizacao;
    }
    public void setLocalizacao(String localizacao) {
        Localizacao = localizacao;
    }
    public String getEmpregos() {
        return Empregos;
    }
    public void setEmpregos(String empregos) {
        Empregos = empregos;
    }

  
}
