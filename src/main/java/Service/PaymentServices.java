/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;
import Model.OrderPaypal;
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
import java.util.*;
 

/**
 *
 * @author ASUS
 */
public class PaymentServices {
    private static final String CLIENT_ID = "ARvtmMwpe9zy0JHwI-fPcWNmBmdjRn9zHRkcbuDKI3RU46krO6ibim7tpbexbJS113HUo9e-MFZZRpwp";
    private static final String CLIENT_SECRET = "EFWSuUYWgP2_Vf6apj2oY6GhsWqRmacH7GKEbDvlN8WHdI82aHN-3RDtTBix0BKjkwq70xOWNE2uUozs";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderPaypal orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        PayerInfo payerInfo = new PayerInfo();
        //Thong tin thanh toan o day
        payerInfo.setFirstName("Dong").setLastName("Than Trong").setEmail("sb-kozad3621585@business.example.com");
        payer.setPayerInfo(payerInfo);
        
        return payer;
    }
     
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("https://shop-online-18110.herokuapp.com/index.jsp");
        redirectUrls.setReturnUrl("https://shop-online-18110.herokuapp.com/ExecutePaymentServlet");

        return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(OrderPaypal orderDetail) {
        // Hoa don
        Details details = new Details();
        details.setShipping(orderDetail.getShipping());
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getTax());
        //Tien, khong set duoc VND
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        // Co the bo danh sach mat hang vao day
        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getProductName());
        item.setPrice(orderDetail.getSubtotal());
        item.setTax(orderDetail.getTax());
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);  
     
        return listTransaction;
    }    
    
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
     
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
                }
            }      
     
        return approvalLink;
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    public Payment executePayment(String paymentId, String payerId)
        throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}
