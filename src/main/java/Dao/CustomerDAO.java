/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Customer;
import java.util.Calendar;
import java.util.Date;
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
public class CustomerDAO {
    
    //
    public static Customer getCus(int id){
        Transaction transaction = null;
        Customer cus = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try   {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            cus = (Customer) session.get(Customer.class, id);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return cus;
    }
    
    
    //
    public static List < Customer > getAllCus() {

        Transaction transaction = null;
        List < Customer > listOfcus = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfcus = session.createQuery("from Customer ").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfcus;
    }
    
    ////////////////////////////////////////////////
    public static void updateCus(Customer cus) { //edit toàn bộ các cột trong customer
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(cus);
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
    public static void editCus(Integer customerId, String CustomerName, String address, String phone, String email,String sex){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Customer cus=(Customer)session.get(Customer.class, customerId);   
        cus.setCustomerName(CustomerName);
        cus.setAddress(address);
        cus.setPhone(phone);
        cus.setEmail(email);
        cus.setSex(sex);
        
        
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(cus);
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
    
    
     public static void deleteCus(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Customer cus = session.get(Customer.class, id);
            if (cus != null) {
                session.delete(cus);

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
    public static void saveCus(Customer cus) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(cus);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    ////////////////////////////
    public static boolean addCustomerInformation(Customer customer)
    {
        Transaction transaction = null;
        SessionFactory sessionFactory =HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try 
        {
            //transaction
            transaction= session.beginTransaction();
            //add
            session.save(customer);
            System.out.println("save customer ok");
            //
            transaction.commit();session.close();
            return true;
        } 
        catch (Exception e) 
        {
            System.out.println("add customer information exception");
        }
        return false;
    }
    //////////////////////////////
    public boolean updateCustomerInformation(Customer customer)
    {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try 
        {
            //transaction
            transaction= session.beginTransaction();
            //add
            session.update(customer);
            //
            transaction.commit();session.close();
        } 
        catch (Exception e) 
        {
            System.out.println("update customer information exception");
        }
        return false;
    }
    /////////////////////////////
    @SuppressWarnings("unchecked")
	public static Customer getCustomerInformationByEmail(String email)
    {
        Transaction transaction = null;
        Customer  customer = null;
        SessionFactory sessionFactory =  HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            System.out.print(email);
            // start a transaction
            transaction = session.beginTransaction();
            // get an account object          
            Query<Customer> query = session.createQuery("from Customer cus where cus.email=:email");
            query.setParameter("email", email);
            customer=query.uniqueResult();
            // commit transaction
            transaction.commit();session.close();
            return customer;
        }
        catch(Exception e)
        {
            System.out.println("CustomerDAO getCusbyEmail exception");
            if (transaction != null) {
                transaction.rollback();session.close();
            }
            return null;
        }               
    }
}
