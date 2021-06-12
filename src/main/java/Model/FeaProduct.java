/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Comparator;

/**
 *
 * @author ASUS
 */
public class FeaProduct implements Comparator<FeaProduct>{
    private int id;
    private int quantity;

    public FeaProduct(int id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }

    public FeaProduct() {
    }

    @Override
    public String toString() {
        return "FeaProduct{" + "id=" + id + ", quantity=" + quantity + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public int compare(FeaProduct o1, FeaProduct o2) {
        return o2.getQuantity() - o1.getQuantity(); 
    }
    
}
