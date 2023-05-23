package DTO;

public class EmpregosDTO {
    private int IdEmprego, SalarioMin, SalarioMax;
    private String Posicao, Setor, Descricao, Requisitos, Empresa;
    private String Localizacao, Tipo, Titulo;

    public int getIdEmprego() {
        return IdEmprego;
    }

    public void setIdEmprego(int IdEmprego) {
        this.IdEmprego = IdEmprego;
    }

    public int getSalarioMin() {
        return SalarioMin;
    }

    public void setSalarioMin(int SalarioMin) {
        this.SalarioMin = SalarioMin;
    }

    public int getSalarioMax() {
        return SalarioMax;
    }

    public void setSalarioMax(int SalarioMax) {
        this.SalarioMax = SalarioMax;
    }

    public String getPosicao() {
        return Posicao;
    }

    public void setPosicao(String Posicao) {
        this.Posicao = Posicao;
    }

    public String getSetor() {
        return Setor;
    }

    public void setSetor(String Setor) {
        this.Setor = Setor;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public String getRequisitos() {
        return Requisitos;
    }

    public void setRequisitos(String Requisitos) {
        this.Requisitos = Requisitos;
    }

    public String getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(String Empresa) {
        this.Empresa = Empresa;
    }

    public String getLocalizacao() {
        return Localizacao;
    }

    public void setLocalizacao(String Localizacao) {
        this.Localizacao = Localizacao;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

   
 
}
