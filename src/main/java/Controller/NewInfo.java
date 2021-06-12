/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AdminDAO;
import Dao.CustomerDAO;
import Dao.EmployeeDao;
import Model.Admin;
import Model.Customer;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class NewInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String type=request.getParameter("type");
        String sex=request.getParameter("sex");
        String address=request.getParameter("address");
        String url="";
        try{
            if(name==null||email==null||phone==null||address==null||name==""||email==""||phone==""||address=="")
            {
                request.setAttribute("msg", "Thông tin không được trống");
                url="/account-info.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
            if(type.equals("admin")){
                Admin a = (Admin)request.getSession().getAttribute("userInfo");
                a.setEmail(email);
                a.setName(name);
                a.setPhone(phone);
                if(sex.equals("1")){
                    sex="Nam";
                }
                else{
                    sex="Nữ";
                }
                a.setSex(sex);
                AdminDAO.updateAcc(a);
                request.setAttribute("msg", "Đổi thông tin thành công");
                url="/account-info.jsp";
            }
            else if(type.equals("employee")){
                Employee a = (Employee)request.getSession().getAttribute("userInfo");
                a.setPhone(phone);
                a.setEmail(email);
                a.setEmployeeName(name);
                a.setAddress(address);
                if(sex.equals("1")){
                    sex="Nam";
                }
                else{
                    sex="Nữ";
                }
                a.setSex(sex);
                EmployeeDao.updateEmp(a);
                request.setAttribute("msg", "Đổi thông tin thành công");
                url="/account-info.jsp";
            }
            else{
                Customer a = (Customer)request.getSession().getAttribute("userInfo");
                a.setEmail(email);
                a.setCustomerName(name);
                a.setPhone(phone);
                a.setAddress(address);
                if(sex.equals("1")){
                    sex="Nam";
                }
                else{
                    sex="Nữ";
                }
                a.setSex(sex);
                CustomerDAO.updateCus(a);
                request.setAttribute("msg", "Đổi thông tin thành công");
                url="/account-info.jsp";
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        catch(ServletException | IOException e){
            request.setAttribute("msg", "Thông tin nhập không hợp lệ");
            url="/account-info.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
