/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Blog;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
/**
 *
 * @author KHOAPHAN
 */
public class BlogDao {
    public static Blog getBlo(int id){
        Transaction transaction = null;
        Blog blo = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try   {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            blo = (Blog) session.get(Blog.class, id);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return blo;
    }
    
    
    //
    public static List < Blog > getAllBlo() {

        Transaction transaction = null;
        List < Blog > listOfblo = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfblo = session.createQuery("from Blog ").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfblo;
    }
    
    ////////////////////////////////////////////////
    public static void updateBlo(Blog blo) { //edit toàn bộ các cột trong customer
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(blo);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        finally{
            session.close();
        }
    }
    ////////////////////////////////////////////////
    
    
    
    /////////////////////////////////////////////////////////
     // edit 1 số cột
    public static void editBlo(Integer blogId, String blogName, String blogContent, String synopsis){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Blog blo=(Blog)session.get(Blog.class, blogId);   
        blo.setBlogId(blogId);
        blo.setBlogName(blogName);
        blo.setBlogContent(blogContent);
        blo.setSynopsis(synopsis);
        
        
        
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(blo);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        finally{
            session.close();
        }
    }
    ////////////////////////////////
    
    
     public static void deleteBlo(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Blog blo = session.get(Blog.class, id);
            if (blo != null) {
                session.delete(blo);

            }

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    
    //
    public static void saveBlo(Blog blo) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(blo);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
}
