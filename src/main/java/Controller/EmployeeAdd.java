/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class EmployeeAdd extends HttpServlet {

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
            out.println("<title>Servlet EmployeeAdd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeAdd at " + request.getContextPath() + "</h1>");
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
            String errorsql="Kh??ng c?? l???i ";
            String salary = request.getParameter("salary").trim();
            if("".equals(salary)||salary==null)
            {
                errorsql="L???i : Ch??a nh???p l????ng nh??n vi??n";
            }
            try{
                int salint=Integer.parseInt(salary);  
                if(salint<0)
                {
                    errorsql="L???i : L????ng nh??n vi??n kh??ng h???p l??? (ph???i l???n h??n 0)";
                }
            }
            catch(Exception e)
            {
                errorsql="L???i : L????ng nh??n vi??n kh??ng h???p l??? (nh???p s???)";
            }
            String add = request.getParameter("address").trim();
            if("".equals(add)||add==null)
            {
                errorsql="L???i : Ch??a nh???p ?????a ch??? nh??n vi??n";
            }
            String phone = request.getParameter("phone").trim();
            if("".equals(phone)||phone==null)
            {
                errorsql="L???i : Ch??a nh???p s??? ??i???n tho???i nh??n vi??n";
            }
            if(!(phone.matches("^[0-9]*$") && phone.length() > 8)){
                errorsql="S??? ??i???n tho???i kh??ng h???p l???";
            }
            String mail = request.getParameter("mail").trim();
            if(mail==""||mail==null)
            {
                errorsql="L???i : Ch??a nh???p mail nh??n vi??n";
            }
            Pattern emailpat;
            emailpat = Pattern.compile("\\S+@gmail.com");
            Matcher emailmat=emailpat.matcher(mail);
            if(!emailmat.matches())
            {
               errorsql="L???i : Mail nh??n vi??n kh??ng h???p l??? , nh???p s??? d???ng gmail "; 
            }
            String name = request.getParameter("name").trim();
            if("".equals(name)||name==null)
            {
                errorsql="L???i : Ch??a nh???p t??n nh??n vi??n";
            }
            String sex = request.getParameter("sex");
            Calendar c = Calendar.getInstance();
            c.setTime(new Date()); // Now use today date.
            c.add(Calendar.DATE, 30); // Adding 30 days
            SimpleDateFormat ft = 
            new SimpleDateFormat ("yyyy-MM-dd");
            String date=ft.format(c.getTime());
            c.setTime(new Date());
            c.add(Calendar.DATE, -1);
            String lastatt=ft.format(c.getTime());
            response.setContentType("text/plain");
            //response.getWriter().write(errorsql);
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
