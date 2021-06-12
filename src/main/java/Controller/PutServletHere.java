/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EmployeeDao;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class PutServletHere extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PutServletHere</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PutServletHere at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String mail=request.getParameter("mail");
        String phone=request.getParameter("phone");
        String add=request.getParameter("address");
        String sal=request.getParameter("salary");
        String pay=request.getParameter("paycheck");
        String workdate=request.getParameter("workdate");
        String lastatt=request.getParameter("lastatt");
        int intsal=Integer.valueOf(sal);
        Date payday=Date.valueOf(pay);
        int wd=Integer.valueOf(workdate);
        Date lastd=Date.valueOf(lastatt);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + name + "</h1>");
            out.println("<h1>" + sex + "</h1>");
            out.println("<h1>" + mail + "</h1>");
            out.println("<h1>" + phone + "</h1>");
            out.println("<h1>" + add + "</h1>");
            out.println("<h1>" + intsal + "</h1>");
            out.println("<h1>" + payday + "</h1>");
            out.println("<h1>" + wd + "</h1>");
            out.println("<h1>" + lastd + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            
            
//            Employee emp=new Employee(name,sex,mail,phone,add,intsal,payday,wd,lastd);
//            EmployeeDao.saveEmp(emp); 
            
//            Employee emp=new Employee(32,name,sex,mail,phone,add,intsal,payday,wd,lastd);
//            EmployeeDao.updateEmp(emp);
            
//            EmployeeDao.deleteEmp(33);
        }
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
