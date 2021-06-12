/*
 * To change this license header, choose License Headers in Accject Accperties.
 * To change this tacclate file, choose Tools | Tacclates
 * and open the tacclate in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Account;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import javax.persistence.NoResultException;
import Model.Account;import Model.Customer;import Model.Employee;import Model.Admin;
/**
 *
 * @author ASUS
 */
public class AccountDao {
    public static List < Account > getAllEmpAcc() {

        Transaction transaction = null;
        List < Account > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery(" from Account acc where acc.type='employee'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Object[] > getAllEmpAccount() {//join 2 bang lai voi nhau

        Transaction transaction = null;
        List < Object[] > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery("select e,a from Employee e,Account a where e.employeeId=a.userId and a.type='employee'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Account > getAllCusAcc() {

        Transaction transaction = null;
        List < Account > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery(" from Account acc where acc.type='customer'").list();

            // commit transaction
            transaction.commit();
            session.close();
            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Object[] > getAllCusAccount() {//join 2 bang lai voi nhau

        Transaction transaction = null;
        List < Object[] > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery("select c,a from Customer c,Account a where c.customerId=a.userId and a.type='customer'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static void saveAcc(Account Acc) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(Acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
     public static void updateAcc(Account Acc) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(Acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static void editAccEmp(int id,String pass)
    {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Account acc=(Account)session.get(Account.class, id);
        acc.setPassword(pass);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static void deleteAcc(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Account Acc = session.get(Account.class, id);
            if (Acc != null) {
                session.delete(Acc);

            }

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    @SuppressWarnings("rawtypes")
	public static boolean CheckCusInUse(int id)
    {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//        Session session = sessionFactory.openSession();
//        String stringquery="select 1 from Order m where m.customer.customerId="+String.valueOf(id);
//        Query query = session.createQuery(stringquery);
//        session.close();
//        return (query.uniqueResult() != null);
        
        Transaction transaction = null;
        boolean rs = true;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            Query query = session.createQuery("select 1 from Order m where m.customer.customerId=:id");//fix
            query.setParameter("id", id);
            rs = (query.uniqueResult() != null);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                session.close();
            }
        }
        return rs;
    }
    public static void deleteAccCus(int id,int uid) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Account Acc = session.get(Account.class, id);
           // session.createSQLQuery("delete from customer where CustomerID=" +String.valueOf(uid)).executeUpdate();
            if (Acc != null) {
                session.delete(Acc);
                
            }

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static Account getAccountByUsername(String username)
    {
        Transaction transaction = null;
        Account account = new Account();
        SessionFactory sessionFactory =HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            System.out.print(username);
            // start a transaction
            transaction = session.beginTransaction();
            // get an account object           
            @SuppressWarnings("unchecked")
			Query<Account> query = session.createQuery("from Account acc where acc.username=:username ");
            query.setParameter("username", username);
            account = query.uniqueResult();
            // commit transaction
            transaction.commit();
            session.close();
            return account;
        } catch (NoResultException nrs) {
            System.out.println("NoRS CustomerDAO getAccCusbyUsername exception");
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
            return null;
        }
    }
    public static Account getAccountByEmail(String email)
    {
        if(getAccountCustomerByEmail(email)!=null)
            return getAccountCustomerByEmail(email);
        else if(getAccountAdminByEmail(email)!=null)
            return getAccountAdminByEmail(email);
        else if(getAccountEmployeeByEmail(email)!=null)
            return getAccountEmployeeByEmail(email);        
        return null;
    }
    public static Account getAccountAdminEmployeeByUsername(String username) //admin + employee account
    {
        Transaction transaction = null;
        Account account = new Account();
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            //begin transaction
            transaction = session.beginTransaction();
            //get object 
            Query<Account> query = session.createQuery("from Account acc WHERE acc.username=:username and not acc.type='customer'", Account.class);
            query.setParameter("username", username);
            account = query.uniqueResult();
            //close transaction
            transaction.commit();
            session.close();
            return account;
        }catch (NoResultException e) {
            System.out.println("NoRS CustomerDAO getAccAdminbyUsername exception");
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
            return null;
        }
    }
    public static Account getAccountAdminByUsername(String username) {
        Transaction transaction = null;
        Account account = new Account();
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            //begin transaction
            transaction = session.beginTransaction();
            //get object 
            Query<Account> query = session.createQuery("from Account acc WHERE acc.username=:username and acc.type='admin'", Account.class);
            query.setParameter("username", username);
            account = query.uniqueResult();
            //close transaction
            transaction.commit();
            session.close();
            return account;
        } catch (NoResultException e) {
            System.out.println("NoRS CustomerDAO getAccAdminbyUsername exception");
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
            return null;
        }
    }
    public static Account getAccountCustomerByEmail(String email)//chưa test
    {
        Transaction transaction = null;
        Account account = new Account();
        String hql = "";
        SessionFactory sessionFactory =HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            hql = "select acc" //customer
                    + " from Account acc,Customer cus"
                    + " where acc.userId=cus.customerId and cus.email=:email and acc.type='customer'";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("email", email);
            account = query.uniqueResult();
            transaction.commit();session.close();
            if(account!=null)
                return account;
        } catch (Exception e) {
            System.out.println("no customer email");
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }        
        return null;
    }
    public static Account getAccountEmployeeByEmail(String email)
    {
        Transaction transaction = null;
        Account account = new Account();
        String hql = "";
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            hql = "select acc" //customer
                    + " from Account acc,Employee emp"
                    + " where acc.userId=emp.employeeId and emp.email=:email and acc.type='employee'";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("email", email);
            account = query.uniqueResult();
            transaction.commit();session.close();
            if(account!=null)
                return account;
        } catch (Exception e) {
            System.out.println("no employee email");
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return null;
    }
    public static Account getAccountAdminByEmail(String email)
    {
        Transaction transaction = null;
        Account account = new Account();
        String hql = "";
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            hql = "select acc" //admin
                    + " from Account acc,Admin adm"
                    + " where acc.userId=adm.id and adm.email=:email and acc.type='admin' ";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("email", email);
            account = query.uniqueResult();
            transaction.commit();session.close();
            if(account!=null)
                return account;
        } catch (Exception e) {
            System.out.println("no admin email");
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }       
        return null;
    }
    public static Object getAccountInformation(Account acc) {
        String role = acc.getType();
        Transaction transaction = null;
        SessionFactory sessionFactory =HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            
            transaction = session.beginTransaction();
            if(role.equals("admin"))
            {
                String hql = "select adm "
                        + "from Admin adm,Account acc "
                        + "where adm.id=acc.userId and acc.username=:username and acc.type='admin'";
                Query<Admin> query = session.createQuery(hql, Admin.class);
                query.setParameter("username", acc.getUsername());
                Admin adm = query.uniqueResult();
                transaction.commit();session.close();
                return adm;         
            }
            else if(role.equals("employee"))
            {
                 String hql = "select emp "
                        + "from Employee emp,Account acc "
                        + "where emp.employeeId=acc.userId and acc.username=:username and acc.type='employee'";
                Query<Employee> query = session.createQuery(hql, Employee.class);
                query.setParameter("username", acc.getUsername());
                Employee emp = query.uniqueResult();
                transaction.commit();session.close();             
                return emp;            
            }
            else if(role.equals("customer"))
            {
                String hql = "select cus " 
                        + "from Customer cus,Account acc "
                        + "where cus.customerId=acc.userId and acc.username=:username and acc.type='customer'";
                Query<Customer> query = session.createQuery(hql,Customer.class);
                query.setParameter("username", acc.getUsername());
                Customer cus = query.uniqueResult();
                transaction.commit();session.close();              
                return cus;          
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();               
            }
            System.out.println("get account info exception");
        }
        return null;
    }
    public static boolean addAccount(Account acc) {
        Transaction transaction = null;
        SessionFactory sessionFactory =HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(acc);
            // commit transaction
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
            System.out.println("add account exception");
            return false;
        }
    }    
    public static void updateAdmin(Admin adm)
    {
         Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(adm);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
}
