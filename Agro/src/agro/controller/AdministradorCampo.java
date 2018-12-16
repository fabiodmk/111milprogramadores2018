/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agro.controller;

import agro.dao.UsuarioDao;
import agro.dao.UsuarioDaoHibernate;
import agro.dto.Usuario;
import agro.ui.PantallaRegistrarCampo;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Fabio
 */
public class AdministradorCampo {
    
    private final SessionFactory sessionFactory;
    
    private final UsuarioDao usuarioDao;
    private Usuario usuario;
    
    public AdministradorCampo(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
        // creamos las instancias de los objetos de acceso a datos
        this.usuarioDao = new UsuarioDaoHibernate(sessionFactory);
    }
    
    public void run () {
        new PantallaRegistrarCampo(this).setVisible(true);
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Usuario getUserLogged(){
        List<Usuario> usuarios = new ArrayList<>();
        usuarios = this.usuarioDao.recoveryAll();
        return usuarios.get(0);
    }
    
    /*
    public void imprimir(Pedido pedido) {
        new ImpresorFactura(pedido).setVisible(true);
    }
    
    public void iniciarGenerarReporte () {
        new GestorReporte(sessionFactory).run();
    }
    */
}
