/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ProductDao;
import Model.Cart;
import Model.CartItem;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class CartServlet extends HttpServlet {

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
         try {
            String strAction = request.getParameter("action");
            if (strAction != null && !strAction.equals("")) {
                // Xu li them vao gio hang
                if (strAction.equals("add")) {
                    int quantity = 1;
                    int id;
                    if (request.getParameter("prdID_item") != null) {
                        id = Integer.parseInt(request.getParameter("prdID_item"));
                        Product prd = ProductDao.getPro(id);
                        if (prd != null) {
                            if (request.getParameter("prdQuantity_item") != null) {
                                quantity = Integer.parseInt(request.getParameter("prdQuantity_item"));
                            }
                            HttpSession session = request.getSession();
                            if (session.getAttribute("cart") == null) {
                                Cart cart = new Cart();
                                List<CartItem> listItems = new ArrayList<CartItem>();
                                CartItem item = new CartItem();
                                item.setProductID(prd.getProductId());
                                item.setProductName(prd.getProductName());
                                item.setPictureString(prd.getPicture());
                                item.setQuantity(quantity);
                                item.setPrice(prd.getPrice());
                                System.out.println(item.toString());
                                listItems.add(item);
                                cart.setItems(listItems);
                                session.setAttribute("cart", cart);
                            } else {
                                Cart cart = (Cart)session.getAttribute("cart");
                                List<CartItem> listItems = cart.getItems();
                                boolean check = false;
                                for (CartItem item : listItems) {
                                    if (item.getProductID() == prd.getProductId()) {
                                        item.setQuantity(item.getQuantity() + quantity);
                                        check = true;
                                    }
                                }
                                if (check == false) {
                                    CartItem item = new CartItem();
                                    item.setProductID(prd.getProductId());
                                    item.setProductName(prd.getProductName());
                                    item.setPictureString(prd.getPicture());
                                    item.setPrice(prd.getPrice());
                                    item.setQuantity(quantity);
                                    listItems.add(item);
                                }
                                cart.setItems(listItems);
                                session.setAttribute("cart", cart);

                            }
                        }
                    }
                }
                // Xu li khac
            }
           response.sendRedirect(request.getContextPath() + "/products.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
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
