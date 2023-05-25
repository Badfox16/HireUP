/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author Pedro Nhamirre
 */
public class CandidaturasDTO {

    private int idCandidatura;
    private String estado;
    private String faleSobre;
    private String pqVoce;
    private int empresaFK;
    private int usuarioFK;
    private int empregoFK;

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

    public int getEmpresaFK() {
        return empresaFK;
    }

    public void setEmpresaFK(int empresaFK) {
        this.empresaFK = empresaFK;
    }

    public int getUsuarioFK() {
        return usuarioFK;
    }

    public void setUsuarioFK(int usuarioFK) {
        this.usuarioFK = usuarioFK;
    }

    public int getEmpregoFK() {
        return empregoFK;
    }

    public void setEmpregoFK(int empregoFK) {
        this.empregoFK = empregoFK;
    }

    
}
