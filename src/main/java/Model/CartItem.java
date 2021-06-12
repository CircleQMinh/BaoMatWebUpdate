/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ASUS
 */
public class CartItem {
    private int productID;
    private String productName;
    private String pictureString;
    private int quantity;
    private int price;
    
    public CartItem(){
        
    }

    public CartItem(int productID, String productName, String pictureString, int quantity, int price) {
        this.productID = productID;
        this.productName = productName;
        this.pictureString = pictureString;
        this.quantity = quantity;
        this.price = price;
    }
    
    public int getProductID() {
        return productID;
    }
    public String getProductName() {
        return productName;
    }
    public int getQuantity(){
        return this.quantity;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPictureString() {
        return pictureString;
    }

    public void setPictureString(String pictureString) {
        this.pictureString = pictureString;
    }
    
    public void setQuantity(int quantity){
        this.quantity=quantity;
    }
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartItem{" + "productID=" + productID + ", productName=" + productName + ", pictureString=" + pictureString + ", quantity=" + quantity + '}';
    }
    
}
