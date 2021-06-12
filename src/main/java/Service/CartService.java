/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;
import Model.*;

import java.util.List;

/**
 *
 * @author ASUS
 */
public class CartService {
    public static int getCost(CartItem item){
        return item.getQuantity()*item.getPrice();
    }
    public static int getTotalCost(List<CartItem> cartItem){
        int totalCost=0;
        for(int i=0;i<cartItem.size();i++)
        {
            totalCost=totalCost+getCost(cartItem.get(i));
        }
        return totalCost;
    }
}
