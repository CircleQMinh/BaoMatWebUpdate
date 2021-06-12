/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var row_per_page=8;
var emptable_count = 1;
var atttable_count = 1;
var protable_count = 1;
var custable_count = 1;
var empacctable_count = 1;
var cusacctable_count = 1;

$(document).ready(function(){
    startTime();
    setMaxdate('lastempatt-edit');
    setMindate('paycheckempatt-edit');
//                các nút chuyển trang
    $('#dashboard').click(function(){
         openForm('formwait');
         $("#home").load( "dashboard.jsp #ds", function() {
            startTime();
            closeForm('formwait'); 
        });
    });
//                jquery của employee
    $('#emppage').click(function(){
        openForm('formwait');
        $("#home").load( "employee.jsp #employee", function() {
            startTime();            
            $('#employeerefresh').click(function(){
                $("#employeetable").load( "employee.jsp #tableemp",function(){
                    $('#tableemp').tablePagination({
                        perPage: 7,
                        initPage:emptable_count,                      
                        showAllButton:false
                    });
                    emptable_count=1;
                    $("button[id|='emp_edit']").click(function() {
                        openForm("form2");
                        getId_emptable(this);
                        var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                        var emp_edit_name=$(this).closest('tr').find('td').eq(1).text();
                        var emp_edit_sex=$(this).closest('tr').find('td').eq(2).text();
                        var emp_edit_email=$(this).closest('tr').find('td').eq(3).text();
                        var emp_edit_phone=$(this).closest('tr').find('td').eq(4).text();
                        var emp_edit_add=$(this).closest('tr').find('td').eq(5).text();
                        var emp_edit_pay=$(this).closest('tr').find('td').eq(7).text();
                        var emp_edit_sal=$(this).closest('tr').find('td').eq(6).text();
                        FillForm2(emp_edit_name,emp_edit_sex,emp_edit_email,emp_edit_phone,emp_edit_add,
                                emp_edit_pay,emp_edit_sal,emp_edit_eid);
                    });
                    $("button[id|='emp_del']").click(function() {
                        if (confirm('Xóa nhân viên khỏi database?')) {
                            getId_emptable(this);
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);openForm('formwait');
                                $.ajax({
                                    type: "post",
                                    url: "ajax/employee/ajax-delete-emp.jsp", //this is my servlet
                                    data: {
                                        EID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme("employeerefresh");clickme('att-refresh');
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });
            });
            $('#att-refresh').click(function(){
                $("#att-table").load( "employee.jsp #empatt1",function(){
                   $('#empatt1').tablePagination({
                        perPage: 7,
                        initPage:atttable_count, 
                        showAllButton:false
                    });
                    atttable_count=1;
                    $("button[id|='editemp-att']").click(function() {
                        getId_atttable(this);
                        openForm("form3");
                        var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                        var emp_edit_pay=$(this).closest('tr').find('td').eq(3).text();
                        var emp_edit_wd=$(this).closest('tr').find('td').eq(4).text();
                        var emp_edit_last=$(this).closest('tr').find('td').eq(5).text();
                        FillForm3(
                                emp_edit_pay,emp_edit_wd,emp_edit_last,emp_edit_eid);
                    });
                    $("button[id|='check-att']").click(function() {
                        if (confirm('Chấm công nhân viên ?')) {
                            getId_atttable(this);
                            openForm('formwait');
                            var eid=$(this).closest('tr').find('td').eq(0).text();
                            var ld=$(this).closest('tr').find('td').eq(5).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/employee/ajax-chamcong-emp.jsp", //this is my servlet
                                data: {
                                    EID:eid,
                                    LD:ld
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                    closeForm('formwait');
                                    alert(success); // div#success
                                    clickme("att-refresh");clickme("employeerefresh");
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");
                                }
                            });
                        }
                        else{

                        }
                    });
                    $("button[id|='payluong-att']").click(function() {
                        var eid=$(this).closest('tr').find('td').eq(0).text();
                        var sal=$(this).closest('tr').find('td').eq(2).text();
                        var wd=$(this).closest('tr').find('td').eq(4).text();
                        getId_atttable(this);
                        var msg=TinhLuong(sal,wd);
                        if (confirm('Trả lương cho nhân viên ? Lương phải trả là : '+msg)) {  
                            openForm('formwait');
                            $.ajax({
                                type: "post",
                                url: "ajax/employee/ajax-traluong-emp.jsp", //this is my servlet
                                data: {
                                    EID:eid   
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                    closeForm('formwait');
                                    alert(success); // div#success
                                    clickme("att-refresh");clickme("employeerefresh");
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");
                                }
                            });
                        }
                        else{

                        }
                    });
                });
            });
            clickme('employeerefresh');
            clickme('att-refresh');
            closeForm('formwait');
        });

    });
    
    
    //                jquery của customer
    $('#cuspage').click(function(){
        openForm('formwait');
        $("#home").load( "customer.jsp #customer", function() {
            startTime();            
            $('#customerrefresh').click(function(){
                $("#customertable").load( "customer.jsp #tablecus",function(){
                    $('#tablecus').tablePagination({
                        perPage: 7,
                        initPage:custable_count,                      
                        showAllButton:false
                    });
                    custable_count=1;
                    $("button[id|='cus_edit']").click(function() {
                        openForm("form11");
                        getId_custable(this);                   
                    });
                    $("button[id|='cus_history']").click(function() {
                        $("#customerhistory").load("ajax/order/ajax-customer-history.jsp #tablehistory" , {
                            ID:$(this).closest('tr').find('td').eq(0).text()
                        },function(){
                            $("button[id|='ord_info'").click(function(){
                                openForm('formwait');
                                var id =$(this).closest('tr').find('td').eq(0).text();
                                $.ajax({
                                    type: "post",
                                    url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                    data: {
                                        ID:id               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#info").html();
                                        $("#order-info-form").html(success);closeForm('formwait');
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");closeForm('formwait');
                                    }
                                });
                                 openForm("order-info-form");
                            });
                        });
                    });
                    $("button[id|='cus_del']").click(function() {
                        if (confirm('Xóa khách hàng khỏi database?')) {
                            getId_custable(this);
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);openForm('formwait');
                                $.ajax({
                                    type: "post",
                                    url: "ajax/customer/ajax-delete-customer.jsp", //this is my servlet
                                    data: {
                                        CID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme("customerrefresh");
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });
            });
            
            clickme('customerrefresh');         
            closeForm('formwait');
        });

    });
    ////kết thúc
    
    
    
//                jquery của pro
    $('#propage').click(function(){
         openForm('formwait');
        $("#home").load( "product.jsp #product", function() {
            startTime();
            $('#productrefresh').click(function(){
                $("#producttable").load( "product.jsp #tablepro",function(){
                    $('#tablepro').tablePagination({
                        perPage: 7,
                        initPage:protable_count,
                        showAllButton:false
                    });           
                    protable_count=1;
                    $("button[id|='pro_edit']").click(function() {
                        openForm('form7edit');   
                        getId_protable(this);
                        var url=$(this).closest('tr').find('img').attr("src");
                        var id=$(this).closest('tr').find('td').eq(0).text();
                        var name=$(this).closest('tr').find('td').eq(1).text();
                        var mota=$(this).closest('tr').find('td').eq(2).text();
                        var price=$(this).closest('tr').find('td').eq(3).text();
                        var qua=$(this).closest('tr').find('td').eq(4).text();
                        var cate=$(this).closest('tr').find('td').eq(5).text();
                        FillForm7edit(name,mota,price,qua,cate,url,id);
                    });
                    $("button[id|='pro_del']").click(function() {
                        if (confirm('Xóa sản phẩm khỏi database?')) {
                            openForm('formwait');
                            getId_protable(this);
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/product/ajax-delete-product.jsp", //this is my servlet
                                    data: {
                                        ID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme("productrefresh");
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });                   
            }); 
            
            $('#unproductrefresh').click(function(){
                $("#unproducttable").load( "product.jsp #tableunpro",function(){
                    $('#tableunpro').tablePagination({
                        perPage: 7,
                        initPage:protable_count,
                        showAllButton:false
                    });           
                    $("button[id|='pro_OK']").click(function() {
                        if (confirm('Duyệt sản phẩm ?')) {
                            openForm('formwait');
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/product/ajax-approve-product.jsp", //this is my servlet
                                    data: {
                                        ID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme("productrefresh");
                                        clickme("unproductrefresh");
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);closeForm('formwait');
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        }
                    });
                                 
                });                   
            }); 
            clickme('productrefresh');
            clickme('unproductrefresh');
            closeForm('formwait');
        });
    });
    // jquery của cus
    /*$('#cuspage').click(function(){
         openForm('formwait');
         $("#home").load( "customer.jsp #customer", function() {
             startTime();
             closeForm('formwait');
        });
    });*/
    // jquery của acc
    $('#accpage').click(function(){
         openForm('formwait');
         $("#home").load( "account.jsp #account", function() {
             startTime();
            $('#accrefresh').click(function(){
                $("#acctable").load( "account.jsp #tableacc",function(){
                    $('#tableacc').tablePagination({
                        perPage: 7,
                        initPage:empacctable_count,
                        showAllButton:false
                    }); 
                    empacctable_count=1;
                    $("button[id|='acc_edit']").click(function() {
                        openForm('formeditaccemp');   
                        getId_empacctable(this);
                        var name=$(this).closest('tr').find('td').eq(1).text();
                        var id=$(this).closest('tr').find('td').eq(0).text();
                        var uid=$(this).closest('tr').find('td').eq(3).text(); 
                        FillFormaccedit(id,name,uid);
                    });
                    $("button[id|='acc_del']").click(function() {
                        getId_empacctable(this);
                        if (confirm('Xóa tài khoản nhân viên khỏi database?')) {
                            openForm('formwait');     
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/account/ajax-delete-account-emp.jsp", //this is my servlet
                                    data: {
                                        ID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme('accrefresh');
                                        clickme('empnoaccrefresh');
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });        
            });
            $('#empnoaccrefresh').click(function(){
                $("#empnoacctable").load( "account.jsp #tableempnoacc",function(){
                    $('#tableempnoacc').tablePagination({
                        perPage: 7,
                        showAllButton:false
                    });
                    $("button[id|='create_emp_acc']").click(function() {
                        var id=$(this).closest('tr').find('td').eq(0).text();  
                        FillFormempnoacc(id);
                        openForm('formempnoacc');
                                                                  
                        console.log(id);
                    });
                });
            });
            $('#acccusrefresh').click(function(){
                $("#acccustable").load( "account.jsp #tableacccus",function(){
                    $('#tableacccus').tablePagination({
                        perPage: 7,
                        initPage:cusacctable_count,
                        showAllButton:false
                    });
                    cusacctable_count=1;
                    $("button[id|='acccus_del']").click(function() {
                        var uid=$(this).closest('tr').find('td').eq(3).text(); 
                        if (confirm('Xóa tài khoản khách hàng khỏi database ?')) {
                            getId_cusacctable(this);
                            openForm('formwait');
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);console.log(uid);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/account/ajax-delete-account-cus.jsp", //this is my servlet
                                    data: {
                                        ID:textval ,
                                        UID:uid
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme('acccusrefresh');
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });
            });
            clickme('accrefresh');
            clickme('empnoaccrefresh');
            clickme('acccusrefresh');
            closeForm('formwait');
        });
    });
    // jquery của order
    $('#orderpage').click(function(){
         openForm('formwait');
         $("#home").load( "order.jsp #order", function() {
            startTime();
                $('#orderrefresh').click(function(){ 
                    $('#ordertable').load("order.jsp #tableorder",function(){
                        $('#tableorder').tablePagination({
                            perPage:7,
                            showAllButton:true
                        });
                        $("button[id|='ord_info'").click(function(){
                            openForm('formwait');
                            var id =$(this).closest('tr').find('td').eq(0).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                data: {
                                    ID:id               
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#info").html();
                                    $("#order-info-form").html(success);closeForm('formwait');
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");closeForm('formwait');
                                }
                            });
                             openForm("order-info-form");
                        }); 
                        $("button[id|='ord_edit'").click(function(){
                            openForm("updateOrder");
                            var order_edit_id =$(this).closest('tr').find('td').eq(0).text();
                            var order_edit_status=$(this).closest('tr').find('td').eq(1).text();
                             var note=$(this).closest('tr').find('td').eq(8).text();
                            FillFormUpdateOrder(order_edit_id,order_edit_status,note);
                        });                    
                        $("button[id|='ord_del']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefresh");clickme('orderrefreshCk');closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");closeForm('formwait');
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshCk').click(function(){ 
                    $('#ordertableCk').load("order.jsp #tableorderCk",function(){
                        $('#tableorderCk').tablePagination({
                            perPage:7,
                            showAllButton:true
                        });
                        $("button[id|='ord_info_Ck'").click(function(){
                            openForm('formwait');
                            var id =$(this).closest('tr').find('td').eq(0).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                data: {
                                    ID:id               
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#info").html();
                                    $("#order-info-form").html(success);closeForm('formwait');
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");closeForm('formwait');
                                }
                            });
                             openForm("order-info-form");
                        }); 
                        $("button[id|='ord_edit_Ck'").click(function(){
                            openForm("updateOrder");
                            var order_edit_id =$(this).closest('tr').find('td').eq(0).text();
                            var order_edit_status=$(this).closest('tr').find('td').eq(1).text();
                            var note=$(this).closest('tr').find('td').eq(8).text();
                            FillFormUpdateOrder(order_edit_id,order_edit_status,note);
                        });                    
                        $("button[id|='ord_del_Ck']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                          clickme("orderrefresh");  clickme("orderrefreshCk");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");closeForm('formwait');
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshDv').click(function(){ 
                    $('#ordertableDv').load("order.jsp #tableorderDv",function(){
                        $('#tableorderDv').tablePagination({
                            perPage:7,
                            showAllButton:true
                        });
                        $("button[id|='ord_info_Dv'").click(function(){
                            openForm('formwait');
                            var id =$(this).closest('tr').find('td').eq(0).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                data: {
                                    ID:id               
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#info").html();
                                    $("#order-info-form").html(success);closeForm('formwait');
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");closeForm('formwait');
                                }
                            });
                             openForm("order-info-form");
                        }); 
                        $("button[id|='ord_del_Dv']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefreshDv");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);closeForm('formwait');
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshHis').click(function(){ 
                    $('#ordertableHis').load("order.jsp #tableorderHis",function(){
                        $('#tableorderHis').tablePagination({
                            perPage:7,
                            showAllButton:true
                        });   
                        $("button[id|='ord_info_His'").click(function(){
                            openForm('formwait');
                            var id =$(this).closest('tr').find('td').eq(0).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                data: {
                                    ID:id               
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#info").html();
                                    $("#order-info-form").html(success);closeForm('formwait');
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");closeForm('formwait');
                                }
                            });
                             openForm("order-info-form");
                        }); 
                        $("button[id|='ord_del_His']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefreshHis");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);closeForm('formwait');
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshShip').click(function(){ 
                    $('#ordertableShip').load("order.jsp #tableorderShip",function(){
                        $('#tableorderShip').tablePagination({
                            perPage:7,
                            showAllButton:true
                        });
                        $("button[id|='shipper_his']").click(function() {
                            $("#shipper_history").load("ajax/order/ajax-shipper-history.jsp #tablehistory" , {
                                ID:$(this).closest('tr').find('td').eq(0).text()
                            },function(){
                                $("button[id|='ord_info'").click(function(){
                                    openForm('formwait');
                                    var id =$(this).closest('tr').find('td').eq(0).text();
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                                        data: {
                                            ID:id               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#info").html();
                                            $("#order-info-form").html(success);closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");closeForm('formwait');
                                        }
                                    });
                                     openForm("order-info-form");
                                });
                            });
                        });
                    });
                   
                });
            clickme('orderrefresh');
            clickme('orderrefreshCk');
            clickme('orderrefreshDv');
            clickme('orderrefreshHis');
            clickme('orderrefreshShip');
//            clickme('btnUnck');
//            clickme('btnHis');
//            clickme('btnCk');
//            clickme('btnDv');
            
            closeForm('formwait');
        });
    });
    // jquery của blog
    $('#blogpage').click(function(){
         openForm('formwait');
         $("#home").load( "blog.jsp #blog", function() {
             startTime();
             closeForm('formwait');
        });
    });
    //jquery của nạp tiền
    $('#bankpage').click(function(){
        openForm('formwait');
        $("#home").load( "bank.jsp #bank", function() {
             startTime();
             closeForm('formwait');
             $('#bankrefresh').click(function(){
                $("#bankdiv").load( "bank.jsp #banktable",function(){
                    $('#banktable').tablePagination({
                        perPage: 7,
                        initPage:1,                      
                        showAllButton:false
                    });
                    emptable_count=1;
                    $("button[id|='bank_edit']").click(function() {
                        var textval = $(this).closest('tr').find('td').eq(0).text();
                        openForm('bankform');
                        document.getElementById("bank-id").value=textval;
                        document.getElementById("bank-money").value=0;
                    });
                    
                });
            });
            clickme('bankrefresh');
        });
    });
    // jquery của sta
    
    $('#stapage').click(function(){
        openForm('formwait');
        $("#home").load( "statistic.jsp #statistic", function() {
            startTime();
            closeForm('formwait');
            setMindate('to-date');
            setMaxdate('from-date');
            SetDateToday('to-date');
            $('#reload-sta').click(function(){           
                $("#statable").load("statistic.jsp #tablesta" , {
                    FD: document.getElementById("from-date").value,
                    TD: document.getElementById("to-date").value
                },function(){
                    myStaData=[];
                    $('#tablesta tr').each(function(){
//                        console.log($(this).find('td').eq(0).text());
//                        console.log($(this).find('td').eq(1).text());
                        var date=$(this).find('td').eq(0).text();
                        var rev=$(this).find('td').eq(1).text();
                        var intrev = parseInt(rev);
                        var foo = {key:date,value:intrev};
                        myStaData.push(foo);
                    });
                    myStaData.shift();
                    console.log(myStaData);
                    $('#sta-gra').simpleBarGraph({
                        data: myStaData,
                        height: '500px',
                        rowsCount: 10,
                        rowCaptionsWidth: '8px',
                        barsColor: '#70e6e2'
                    });
                });            
            });
        });
    });

//                nút của hidden form
//                    form 1 - them nv
    $('#save_emp').click(function(){
        openForm('formwait');
         $.ajax({
            type: "post",
            url: "ajax/employee/ajax-insert-emp.jsp", //this is my servlet
            data: {
                name: $('#name-emp').val(), 
                mail: $('#mail-emp').val(),
                phone: $('#phone-emp').val(), 
                address: $('#add-emp').val(), 
                sex: $('#sex-emp').val(), 
                salary: $('#salary-emp').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("employeerefresh");clickme('att-refresh');
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    //                    form 2 - edit nv
    $('#edit-emp').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/employee/ajax-edit-emp.jsp", //this is my servlet
            data: {
                eid: $('#eid-emp-edit').val(),
                name: $('#name-emp-edit').val(), 
                mail: $('#mail-emp-edit').val(),
                phone: $('#phone-emp-edit').val(), 
                address: $('#add-emp-edit').val(), 
                sex: $('#sex-emp-edit').val(), 
                salary: $('#salary-emp-edit').val(),
                paycheck: $('#paycheck-emp-edit').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("employeerefresh");clickme('att-refresh');
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    //
    //
    $('#save_cus').click(function(){
        openForm('formwait');
         $.ajax({
            type: "post",
            url: "ajax/customer/ajax-insert-customer.jsp", //this is my servlet
            data: {
                name: $('#name-cus').val(), 
                mail: $('#mail-cus').val(),
                phone: $('#phone-cus').val(), 
                address: $('#add-cus').val(), 
                sex: $('#sex-cus').val()
            
            },
            success: function ( response ){   
                //handleData(response);
                var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("customerrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    //
    // form 11
    $('#edit-cus').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/customer/ajax-edit-customer.jsp", //this is my servlet
            data: {
                cid: $('#cid-cus-edit').val(),
                name: $('#name-cus-edit').val(), 
                mail: $('#mail-cus-edit').val(),
                phone: $('#phone-cus-edit').val(), 
                address: $('#add-cus-edit').val(), 
                sex: $('#sex-cus-edit').val()
                
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("customerrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    
    
//                form 3 - emp att
    $('#editattemp').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/employee/ajax-editatt-emp.jsp", //this is my servlet
            data: {
                eid: $('#eidempatt-edit').val(),
                paycheck: $('#paycheckempatt-edit').val(),
                wd:$('#workdayempatt-edit').val(),
                last:$('#lastempatt-edit').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("att-refresh");clickme("employeerefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    $('#save_pro').click(function(){
        openForm('formwait');
        $.ajax({
           type: "post",
           url: "ajax/product/ajax-insert-product.jsp", //this is my servlet
           data: {
               name: $('#name-pro-add').val(), 
               des: $('#mota-pro-add').val(),
               price: $('#price-pro-add').val(), 
               qua: $('#qua-pro-add').val(), 
               category: $('#category-pro-add').val(), 
               url: $('#url-pro-add').val()
           },
           success: function ( response ){   
               //handleData(response);
               var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
               console.log(success); // div#success
               closeForm('formwait');
               alert(success);
               clickme("productrefresh");
           },
           error: function(xhr, textStatus, error){
               console.log(xhr.statusText);
               console.log(textStatus);
               console.log(error);
           }
       });
   });
    $('#edit_pro').click(function (){
       openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/product/ajax-edit-product.jsp", //this is my servlet
            data: {
                name: $('#name-pro-edit').val(), 
                des: $('#mota-pro-edit').val(),
                price: $('#price-pro-edit').val(), 
                qua: $('#qua-pro-edit').val(), 
                category: $('#category-pro-edit').val(), 
                url: $('#url-pro-edit').val(),
                id: $('#id-pro-edit').val()
                
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                closeForm('formwait');
                clickme("productrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    $('#edit-acc-emp').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/account/ajax-edit-account-emp.jsp", //this is my servlet
            data: {
                id: $('#id-acc-emp-edit').val(),
                name: $('#name-acc-emp-edit').val(),
                pass:$('#pass-acc-emp-edit').val(),
                uid:$('#uid-acc-emp-edit').val(),
                retype:$('#passagain-acc-emp-edit').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                closeForm('formwait');
                clickme('accrefresh');
                clickme('empnoaccrefresh');
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    $('#acc-empnoacc').click(function(){
        openForm('formwait');
        $.ajax({
           type: "post",
           url: "ajax/account/ajax-create-account-emp.jsp", //this is my servlet
           data: {
               name: $('#name-acc-empnoacc').val(), 
               pass: $('#pass-acc-empnoacc').val(),
               id: $('#id-acc-empnoacc').val(),
               retype: $('#passagain-acc-empnoacc').val()
           },
           success: function ( response ){   
               //handleData(response);
               var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
               console.log(success); // div#success
               alert(success);
               closeForm('formwait');
               clickme('accrefresh');
                clickme('empnoaccrefresh');
           },
           error: function(xhr, textStatus, error){
               console.log(xhr.statusText);
               console.log(textStatus);
               console.log(error);
           }
       });
   });
   $('#editorder_status').click(function(){
        $.ajax({
            type: "post",
            url: "ajax/order/ajax-edit-ord.jsp", //this is my servlet
            data: {
                eid: $('#orderid-edit').val(),
                note: $('#ordernote-edit').val(),
                status: $('#order-status').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                clickme("orderrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    
    
    $('#bank_add_money').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/customer/ajax-bank-customer.jsp", //this is my servlet
            data: {
                CID: $('#bank-id').val(),
                money: $('#bank-money').val() 
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
                clickme("bankrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    
    $('#rev_add_money').click(function (){
        openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/statistic/ajax-rev-add.jsp", //this is my servlet
            data: {
                day: $('#add-rev-date').val(),
                money: $('#rev-money').val() 
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                closeForm('formwait');
                alert(success);
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    
   ////hàm kiểm tra nhập lại pass co dúng
    $('#pass-acc-empnoacc, #passagain-acc-empnoacc').on('keyup', function () {
        if ($('#pass-acc-empnoacc').val() === $('#passagain-acc-empnoacc').val()) {
          $('#message-create-emp-acc').html('OK').css('color', 'green');
        } else 
          $('#message-create-emp-acc').html('Password Not Matching').css('color', 'red');
    });
   $('#pass-acc-emp-edit, #passagain-acc-emp-edit').on('keyup', function () {
        if ($('#pass-acc-emp-edit').val() === $('#passagain-acc-emp-edit').val()) {
          $('#message-edit-emp-acc').html('OK').css('color', 'green');
        } else 
          $('#message-edit-emp-acc').html('Password Not Matching').css('color', 'red');
    });
    
   
});



// hàm ghi lại trang đang xem
function  getId_emptable(element) {
    emptable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
function  getId_custable(element) {
    custable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
function  getId_atttable(element) {
    atttable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
function  getId_protable(element) {
    protable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
function  getId_empacctable(element) {
    empacctable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
function  getId_cusacctable(element) {
    cusacctable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}