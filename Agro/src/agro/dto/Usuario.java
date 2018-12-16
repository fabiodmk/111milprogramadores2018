/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agro.dto;

import java.util.Date;

/**
 *
 * @author Fabio
 */
public class Usuario {
    Integer id;
    String usuario;
    String password;
    Date registrationDate;
    Integer anulado;
    
    public Usuario(){
        
    }
    
    public Usuario(Integer id, String usuario, String password, Date registrationDate, Integer anulado){
        this.id = id;
        this.usuario = usuario;
        this.password = password;
        this.registrationDate = registrationDate;
        this.anulado = anulado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Integer getAnulado() {
        return anulado;
    }

    public void setAnulado(Integer anulado) {
        this.anulado = anulado;
    }
    
    
    
}
