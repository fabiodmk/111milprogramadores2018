/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agro.dao;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import agro.dto.Usuario;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;

/**
 *
 * @author Fabio
 */
public class UsuarioDaoHibernate implements UsuarioDao{
    
    private final SessionFactory sessionFactory;

    public UsuarioDaoHibernate(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Override
    public List<Usuario> recoveryAll() {
        Session session = sessionFactory.openSession();
        
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         Criteria cr = session.createCriteria(Usuario.class);
         // Add restriction.
         List usuarios = cr.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
        return null;
        /*Session session = sessionFactory.openSession();        
        Criteria crit = session.createCriteria(Usuario.class);
        List<Usuario> results = crit.list();
        return results;*/
    }
    
}
