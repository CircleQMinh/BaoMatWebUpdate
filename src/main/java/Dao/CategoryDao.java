/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tcatelate file, choose Tools | Tcatelates
 * and open the tcatelate in the editor.
 */
package Dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASUS
 */
public class CategoryDao {
//    public static List < Category > getAllCate() {
//
//        Transaction transaction = null;
//        List < Category > listOfpro = null;
//        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
//        Session session = sessionFactory.openSession();
//        try  {
//            // start a transaction
//            transaction = session.beginTransaction();
//            // get an user object
//
//            listOfpro = session.createQuery("from Category ").list();
//
//            // commit transaction
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//        }
//        return listOfpro;
//    }
//    public static Category getCategory(int id) {
//
//        Transaction transaction = null;
//        Category cate = null;
//        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
//        Session session = sessionFactory.openSession();
//        try  {
//            // start a transaction
//            transaction = session.beginTransaction();
//            // get an user object
//            cate = (Category) session.get(Category.class, id);
//            // commit transaction
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//        }
//        finally{
//            session.close();
//        }
//        return cate;
//    }
}
