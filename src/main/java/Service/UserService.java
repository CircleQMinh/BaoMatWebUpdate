/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;
import Dao.AccountDao;import Dao.CustomerDAO;
import Model.Account;import Model.Customer;
/**
 *
 * @author ASUS
 */
public class UserService {

	public Account getAccountByUsername(String username)
    {
        return AccountDao.getAccountByUsername(username);
    }
    public Account getAccountAdminByUsername(String username)
    {
        return AccountDao.getAccountAdminByUsername(username);
    }
	public Account getAccountAdminEmployeeByUsername(String username)
    {
        return AccountDao.getAccountAdminEmployeeByUsername(username);
    }
    public Account getAccountByEmail(String email)
    {
        return AccountDao.getAccountByEmail(email);
    }
    public Object getAccountInformation(Account account)
    {
        return AccountDao.getAccountInformation(account);
    }
    public boolean addAccount(Account acc)
    {
        return AccountDao.addAccount(acc);
    }
    public boolean addCustomerInformation(Customer cus)
    {
        return CustomerDAO.addCustomerInformation(cus);
    }
    public Customer  getCustomerInformationByEmail(String email)
    {
        return CustomerDAO.getCustomerInformationByEmail(email);
    }
    public boolean editAccount(Account acc)
    {
        AccountDao.updateAcc(acc);
        return true;
    }
}
