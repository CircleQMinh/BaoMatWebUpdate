/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASUS
 */
public class DashboardDao {
    public static int SoNhanVien()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Employee").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoSanPham()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Product").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoKhachHang()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Customer").uniqueResult();
            count=c.intValue();session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoTaiKhoan()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Account").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoOrder()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Order").uniqueResult();
            count=c.intValue();session.close();
            
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
}
