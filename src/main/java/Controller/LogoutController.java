/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AccountDao;
import Dao.CustomerDAO;
import Dao.EmployeeDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Account;import Model.Admin;
import Model.Customer;
import Model.Employee;
import Service.UserService;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Nhat Minh
 */
public class LogoutController extends HttpServlet {
    private UserService userService=new UserService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        try{
            Account account=(Account)session.getAttribute("account");
            if(account!=null)
            {    
                session.removeAttribute("account");
                session.removeAttribute("userInfo");
                session.removeAttribute("cart");
                session.invalidate();
                String url="";
                if(account.getType().equals("customer"))
                    url="/index.jsp";
                else if(account.getType().equals("employee"))
                    url="/index.jsp";
                else if(account.getType().equals("admin"))
                    url="/index.jsp";
                System.out.println("logout ok");
                response.sendRedirect(request.getContextPath()+url);
                    }
            else
                response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
        catch(Exception e)
        {
            System.out.println("logout exception");
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //
        HttpSession session=request.getSession();
        Account acc=(Account)session.getAttribute("account");
        Object userInfo=(Object)session.getAttribute("userInfo");
        String url="";
        //value     
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String gender=request.getParameter("gender");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String address="";
        if(!acc.getType().equals("admin"))
           address=request.getParameter("address");            
        //errors
        String passwordError = "";
        String phoneError = "";
        String addressError="";
        String emailError="";
        //validate
        Pattern phonePattern = Pattern.compile("\\d{10}");
        Matcher phoneMatcher = phonePattern.matcher(phone); 
        
        if (!phoneMatcher.matches()) 
        {
            phoneError = ":Must be 10 continueous digits";
            url = "/customer-account.jsp";
        }
        Account searchAccount=userService.getAccountByEmail(email);
        if(searchAccount!=null && !(searchAccount.getUsername().equals(acc.getUsername())))
        {
            emailError = ":Already assigned for another account";
            url = "/customer-account.jsp";
        }      
        /*if(!passMatcher.matches())
        {
            passwordError="Not a valid password!";
            url = "/customer-account.jsp";
        }    */  
        if(!url.equals("/customer-account.jsp")) 
        {
            try {           
                acc.setPassword(password);
                if(acc.getType().equals("customer"))
                {
                    Customer cus=(Customer)userInfo; //chưa set cho adm + emp
                    cus.setCustomerName(name);cus.setPhone(phone);cus.setAddress(address);cus.setSex(gender);cus.setEmail(email);
                    CustomerDAO.updateCus(cus);
                    session.setAttribute("userInfo",cus);
                }
                else if(acc.getType().equals("employee"))
                {
                    Employee emp=(Employee)userInfo;
                    emp.setEmployeeName(name);emp.setPhone(phone);emp.setAddress(address);emp.setSex(gender);emp.setEmail(email);
                    EmployeeDao.updateEmp(emp);
                    session.setAttribute("userInfo",emp);
                }
                else if(acc.getType().equals("admin"))
                {
                    Admin adm=(Admin)userInfo;
                    adm.setName(name);adm.setPhone(phone);adm.setSex(gender);adm.setEmail(email);
                    AccountDao.updateAdmin(adm);
                    session.setAttribute("userInfo",adm);
                }
            } catch (Exception e) {
                System.out.print("edit user info exception");
            }               
            response.sendRedirect(request.getContextPath()+"/customer-account.jsp");
        }
        else
        {
            request.setAttribute("emailError", emailError);
            request.setAttribute("phoneError", phoneError);
            request.setAttribute("passwordError", passwordError);
            request.setAttribute("addressError", addressError);
            RequestDispatcher dp = getServletContext().getRequestDispatcher(url);
            dp.forward(request, response);
        }
    }
    /*public boolean isVietnamese(String str)
    {
        Pattern strPattern = Pattern.compile("\\d{10}");
        Matcher strMatcher = strPattern.matcher(str); 
        return false;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>*/

}
