package Model;
// Generated Dec 11, 2020 10:38:08 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name="product"
    ,catalog="dbthuongmaidientu"
)
public class Product  implements java.io.Serializable {


     private Integer productId;
     private String productName;
     private String productDescription;
     private Integer price;
     private Integer quantity;
     private String category;
     private String picture;
     private Date dateAdded;
     private Set<Orderdetail> orderdetails = new HashSet<Orderdetail>(0);

    public Product() {
    }

	
    public Product(String productName) {
        this.productName = productName;
    }
    public Product(String productName, String productDescription, Integer price, Integer quantity, String category, String picture, Date dateAdded, Set<Orderdetail> orderdetails) {
       this.productName = productName;
       this.productDescription = productDescription;
       this.price = price;
       this.quantity = quantity;
       this.category = category;
       this.picture = picture;
       this.dateAdded = dateAdded;
       this.orderdetails = orderdetails;
    }

    public Product(String productName, String productDescription, Integer price, Integer quantity, String category, String picture, Date dateAdded) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.picture = picture;
        this.dateAdded = dateAdded;
    }

    public Product(Integer productId, String productName, String productDescription, Integer price, Integer quantity, String category, String picture, Date dateAdded) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.picture = picture;
        this.dateAdded = dateAdded;
    }
    
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ProductID", unique=true, nullable=false)
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    
    @Column(name="ProductName", nullable=false, length=45)
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    
    @Column(name="ProductDescription", length=2000)
    public String getProductDescription() {
        return this.productDescription;
    }
    
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    
    @Column(name="Price")
    public Integer getPrice() {
        return this.price;
    }
    
    public void setPrice(Integer price) {
        this.price = price;
    }

    
    @Column(name="Quantity")
    public Integer getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    
    @Column(name="Category", length=45)
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }

    
    @Column(name="Picture", length=500)
    public String getPicture() {
        return this.picture;
    }
    
    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="DateAdded", length=10)
    public Date getDateAdded() {
        return this.dateAdded;
    }
    
    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="product")
    public Set<Orderdetail> getOrderdetails() {
        return this.orderdetails;
    }
    
    public void setOrderdetails(Set<Orderdetail> orderdetails) {
        this.orderdetails = orderdetails;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription=" + productDescription + ", price=" + price + ", quantity=" + quantity + ", category=" + category + ", picture=" + picture + ", dateAdded=" + dateAdded + '}';
    }



    
}


