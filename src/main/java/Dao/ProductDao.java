/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tprolate file, choose Tools | Tprolates
 * and open the tprolate in the editor.
 */
package Dao;


import Hibernate.HibernateUtil;
import Model.FeaProduct;
import Model.Product;
import Model.Unapprovedproduct;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author ASUS
 */
public class ProductDao {
    public static Product getPro(int id) {

        Transaction transaction = null;
        Product pro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            pro = (Product) session.get(Product.class, id);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return pro;
    }
    @SuppressWarnings("unchecked")
	public static List<Product> getProSearch(String text){
        Transaction transaction = null;
        List < Product > listOfpro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            text = "%" + text + "%";
            String query = "select s from Product s where s.productName like :text";
            listOfpro = session.createQuery(query).setParameter("text", text).list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        System.out.println("Load duoc so product: " + listOfpro.size());
        return listOfpro;
    }
    public static Unapprovedproduct getUnPro(int id) {

        Transaction transaction = null;
        Unapprovedproduct pro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            pro = (Unapprovedproduct) session.get(Unapprovedproduct.class, id);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return pro;
    }
    public static List<FeaProduct> getFeaturedProduct(){
        Transaction transaction = null;
        List <?> listofFea = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        System.out.println("Start get Featured product");
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listofFea = session.createQuery("select a.id.productId,SUM(a.quantityOrdered) from Orderdetail a GROUP BY a.id.productId ").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        System.out.println(listofFea.size() + "alo alo alo");
        List<FeaProduct> lists = new ArrayList<FeaProduct>();
        for(int i=0;i<listofFea.size();i++){
            Object[] object = (Object[])listofFea.get(i);
            FeaProduct fea = new FeaProduct(Integer.parseInt(String.valueOf(object[0])),Integer.parseInt(String.valueOf(object[1])));
            lists.add(fea);
        }
        Collections.sort(lists, new FeaProduct());
        for(int j=0;j<lists.size();j++){
            System.out.println(lists.get(j).getId() + "  ");
        }
        System.out.println(lists.size() + "alo alo alo");
        return lists;
    }
    public static List<Product> getAllProSortbyDate(){
        Transaction transaction = null;
        List < Product > listOfpro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfpro = session.createQuery("from Product ").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        for (int i=0;i<listOfpro.size();i++)
            for(int j=i;j<listOfpro.size();j++){
                Date a = listOfpro.get(i).getDateAdded();
                Date b = listOfpro.get(j).getDateAdded();
                if(a.compareTo(b)<0){
                    Product t = listOfpro.get(i);
                    listOfpro.set(i, listOfpro.get(j));
                    listOfpro.set(j, t);
                }
            }
        
        return listOfpro;
    }
    public static List < Product > getAllPro() {

        Transaction transaction = null;
        List < Product > listOfpro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfpro = session.createQuery("from Product ").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfpro;
    }
    public static List < Unapprovedproduct > getAllUnPro() {

        Transaction transaction = null;
        List < Unapprovedproduct > listOfpro = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfpro = session.createQuery("from Unapprovedproduct").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfpro;
    }
    
    public static void savePro(Product pro) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(pro);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    public static void saveunPro(Unapprovedproduct pro) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(pro);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
     public static void updatePro(Product pro) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(pro);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    public static void deletePro(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Product pro = session.get(Product.class, id);
            if (pro != null) {
                session.delete(pro);

            }

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    public static void deleteUnPro(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Unapprovedproduct pro = session.get(Unapprovedproduct.class, id);
            if (pro != null) {
                session.delete(pro);

            }

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
     public static void editProCount(int proID,int count){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Product pro=(Product)session.get(Product.class, proID);
        pro.setQuantity(pro.getQuantity()-count);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(pro);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    
    public static boolean CheckProInUse(int id)
    {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//        Session session = sessionFactory.openSession();
//        String stringquery="select 1 from Orderdetail m where m.product.id="+String.valueOf(id);
//        Query query = session.createQuery(stringquery);session.close();
//        return (query.uniqueResult() != null);

        
        Transaction transaction = null;
        boolean rs = true;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            @SuppressWarnings("rawtypes")
			Query query = session.createQuery("select 1 from Orderdetail m where m.product.id=:id");
            query.setParameter("id", id);
            rs = (query.uniqueResult() != null);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
               session.close();
                System.err.println(e);
            }
        }
        return rs;
    }
}
