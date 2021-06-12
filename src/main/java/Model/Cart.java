/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {
    //Order and Orderdetail
    private int id;
    private List<CartItem> items;
    private int status;
    private int customerID;

    public Cart() {
    }

    public Cart(int id, List<CartItem> items, int status, int customerID) {
        this.id = id;
        this.items = items;
        this.status = status;
        this.customerID = customerID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", items=" + items +
                ", status=" + status +
                ", customerID=" + customerID +
                '}';
    }
}
