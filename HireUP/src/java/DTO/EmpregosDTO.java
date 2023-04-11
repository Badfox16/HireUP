package DTO;

public class EmpregosDTO {
    private int IdEmprego, SalarioMin, SalarioMax;
    private String Posicao, Categoria, Descricao, Requisitos;
    private String Localizacao, Tipo, Titulo;
    
 
    public String getTitulo() {
        return Titulo;
    }
    public void setTitulo(String titulo) {
        Titulo = titulo;
    }
    public String getLocalizacao() {
        return Localizacao;
    }
    public void setLocalizacao(String localizacao) {
        Localizacao = localizacao;
    }
    public String getTipo() {
        return Tipo;
    }
    public void setTipo(String tipo) {
        Tipo = tipo;
    }
    public int getIdEmprego() {
        return IdEmprego;
    }
    public void setIdEmprego(int idEmprego) {
        IdEmprego = idEmprego;
    }
    public int getSalarioMin() {
        return SalarioMin;
    }
    public void setSalarioMin(int salarioMin) {
        SalarioMin = salarioMin;
    }
    public int getSalarioMax() {
        return SalarioMax;
    }
    public void setSalarioMax(int salarioMax) {
        SalarioMax = salarioMax;
    }
    public String getPosicao() {
        return Posicao;
    }
    public void setPosicao(String posicao) {
        Posicao = posicao;
    }
    public String getCategoria() {
        return Categoria;
    }
    public void setCategoria(String categoria) {
        Categoria = categoria;
    }
    public String getDescricao() {
        return Descricao;
    }
    public void setDescricao(String descricao) {
        Descricao = descricao;
    }
    public String getRequisitos() {
        return Requisitos;
    }
    public void setRequisitos(String requisitos) {
        Requisitos = requisitos;
    }

}
