<%-- 
    Document   : ajax_add_item
    Created on : Jan 9, 2021, 8:45:23 AM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="Model.Cart"%>
<%@page import="Dao.ProductDao"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try {
            String strAction = request.getParameter("action");
            System.out.println("jsjhdhs");
            System.out.println(strAction);
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
                                System.out.println("sdhfskhf");
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
           
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        %>
    </body>
</html>
