package DTO;

public class CandidaturasDTO {
    private int idCandidatura;
    private String estado;
    private String faleSobre;
    private String pqVoce;
    private EmpresasDTO empresaFK;
    private UsuariosDTO usuarioFK;
    private EmpregosDTO empregoFK;

    public int getIdCandidatura() {
        return idCandidatura;
    }

    public void setIdCandidatura(int idCandidatura) {
        this.idCandidatura = idCandidatura;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFaleSobre() {
        return faleSobre;
    }

    public void setFaleSobre(String faleSobre) {
        this.faleSobre = faleSobre;
    }

    public String getPqVoce() {
        return pqVoce;
    }

    public void setPqVoce(String pqVoce) {
        this.pqVoce = pqVoce;
    }

    public EmpresasDTO getEmpresaFK() {
        return empresaFK;
    }

    public void setEmpresaFK(EmpresasDTO empresaFK) {
        this.empresaFK = empresaFK;
    }

    public UsuariosDTO getUsuarioFK() {
        return usuarioFK;
    }

    public void setUsuarioFK(UsuariosDTO usuarioFK) {
        this.usuarioFK = usuarioFK;
    }

    public EmpregosDTO getEmpregoFK() {
        return empregoFK;
    }

    public void setEmpregoFK(EmpregosDTO empregoFK) {
        this.empregoFK = empregoFK;
    }
}
