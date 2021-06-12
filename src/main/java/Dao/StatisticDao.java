/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Revenue;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASUS
 */
public class StatisticDao {
    public static List < ? > getRevenue(String fd,String td){
        Transaction transaction = null;
        List < ? > listOfRev = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfRev = session.createQuery("select date_format(r.date,'%Y-%m-%d'),sum(revenue) from Revenue r  group by r.date having r.date>='"+fd+"' and r.date<='"+td+"'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfRev;
    }
    public static List < Revenue > getAllRevenue(){
        Transaction transaction = null;
        List < Revenue > listOfRev = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfRev = session.createQuery("from Revenue").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfRev;
    }
}
