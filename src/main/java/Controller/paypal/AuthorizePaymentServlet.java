/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.paypal;

import Dao.OrderDAO;
import Dao.OrderdetailDAO;
import Dao.ProductDao;
import Model.Cart;
import Model.CartItem;
import Model.Customer;
import Model.Order;
import Model.OrderPaypal;
import Model.Orderdetail;
import Model.OrderdetailId;
import Service.CartService;
import Service.PaymentServices;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class AuthorizePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public AuthorizePaymentServlet() {
    }
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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");request.setCharacterEncoding("UTF-8");
       //String product = request.getParameter("product");
       //Luu don
       HttpSession session = request.getSession();
        Date dateship = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("DateShip"));
        String name = request.getParameter("CustomerNameShip");
        String address = request.getParameter("AddressShip");
        String phone  = request.getParameter("PhoneShip");
        String email = request.getParameter("EmailShip");
        /* Customer saved in Session  --- demo 10 */
        Customer csm = (Customer) session.getAttribute("userInfo");
        System.out.println(csm.toString());
        Order ord = new Order();
        Date orderDate = new Date();
        ord.setRequiredDate(dateship);
        ord.setOrderDate(orderDate);
        ord.setStatus(5);
        ord.setOrderName(name);
        ord.setOrderAdress(address);
        ord.setOrderPhone(phone);
        ord.setOrderEmail(email);
        ord.setCustomer(csm);
        ord.setPaymentType("Paypal");
        OrderDAO.saveOrder(ord);
        int csmid = csm.getCustomerId();
        int status = 5;
        /* Cutomer saved in Session  */
        Order ordcsm = OrderDAO.getOrderByStatus(status, csmid);
        Cart cart = (Cart)session.getAttribute("cart");
        List<CartItem> cit = cart.getItems();
        for(int i=0;i<cit.size();i++){
            Orderdetail orddetail = new Orderdetail();
            OrderdetailId oid = new OrderdetailId(ordcsm.getOrderId(), cit.get(i).getProductID());
            orddetail.setId(oid);
            orddetail.setOrder(ordcsm);
            orddetail.setProduct(ProductDao.getPro(cit.get(i).getProductID()));
            orddetail.setQuantityOrdered(cit.get(i).getQuantity());
            OrderdetailDAO.saveOrderdetail(orddetail);
        }
        ordcsm.setStatus(1);
        System.out.println(ordcsm);
        OrderDAO.updateEmp(ordcsm);
        request.setAttribute("status_pay", "success");
        //
        String product = "Ý dĩ";
        String subtotal = String.valueOf(CartService.getTotalCost(cart.getItems()));
        String shipping = "20000";
        String tax = "0";
        String total = String.valueOf(Integer.parseInt(subtotal)+Integer.parseInt(tax)+Integer.parseInt(shipping));
        OrderPaypal orderPaypal = new OrderPaypal(product, subtotal, shipping, tax, total);
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderPaypal);
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AuthorizePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AuthorizePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
