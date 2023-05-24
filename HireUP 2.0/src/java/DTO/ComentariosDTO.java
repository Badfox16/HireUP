/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author godal
 */
public class ComentariosDTO {

    private String Comentario, Nome, Data;
    private int IdUsuarioFK, IdEmpresaFK;

    public ComentariosDTO() {
        super();
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public int getIdUsuarioFK() {
        return IdUsuarioFK;
    }

    public void setIdUsuarioFK(int IdUsuarioFK) {
        this.IdUsuarioFK = IdUsuarioFK;
    }

    public int getIdEmpresaFK() {
        return IdEmpresaFK;
    }

    public void setIdEmpresaFK(int IdEmpresaFK) {
        this.IdEmpresaFK = IdEmpresaFK;
    }

    public String getData() {
        return Data;
    }

    public void setData(String Data) {
        this.Data = Data;
    }
}
