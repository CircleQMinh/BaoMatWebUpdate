/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $('#myorder-refresh').click(function(){
        $('#myordertable').load("shipper.jsp #tablemyorder",function(){
            $('#tablemyorder').tablePagination({
                perPage:10,
                showAllButton:true
            });
            $("button[id|='order-complete']").click(function() {
                if (confirm('Hoàn thành giao hàng?')) {
                    openForm('formwait');
                    $.ajax({
                        type: "post",
                        url: "ajax/shipper/ajax-shipper-done.jsp", //this is my servlet
                        data: {
                            OID:$(this).closest('tr').find('td').eq(0).text()
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                            console.log(success); // div#success
                            closeForm('formwait');
                            alert(success);
                            clickme('myorder-refresh');
                            clickme('new-order-refresh');
                            clickme('old-order-refresh');
                        },
                        error: function(xhr, textStatus, error){
                            console.log(xhr.statusText);
                            console.log(textStatus);
                            console.log(error);
                            console.log("Fail");
                        }
                    });
                }
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
            $("button[id|='ord-remove'").click(function(){
                openForm("deleteOrder");
                var id =$(this).closest('tr').find('td').eq(0).text();
                document.getElementById("orderid-edit").value =id;
                document.getElementById("ordernote-edit").value ="Điền lý do hủy đơn hàng";
            }); 
        });    
    });
    $('#new-order-refresh').click(function(){
        $('#ordertable').load("shipper.jsp #tableorder",function(){
            $('#tableorder').tablePagination({
                perPage:10,
                showAllButton:true
            });
            $("button[id|='order-acc']").click(function() {
                if (confirm('Nhận giao hàng?')) {
                    $.ajax({
                        type: "post",
                        url: "ajax/shipper/ajax-shipper-accept.jsp", //this is my servlet
                        data: {
                            SID:$('#shipperid').val(),
                            OID:$(this).closest('tr').find('td').eq(0).text()
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                            console.log(success); // div#success
                            alert(success);
                            clickme('myorder-refresh');
                            clickme('new-order-refresh');
                            clickme('old-order-refresh');
                        },
                        error: function(xhr, textStatus, error){
                            console.log(xhr.statusText);
                            console.log(textStatus);
                            console.log(error);
                            console.log("Fail");
                        }
                    });
                }
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
        });
    });
    $('#old-order-refresh').click(function(){
        $('#orderhistable').load("shipper.jsp #tablehisorder",function(){
            $('#tablehisorder').tablePagination({
                perPage:10,
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
        });
    });
    $('#editorder_status').click(function(){
        $.ajax({
            type: "post",
            url: "ajax/shipper/ajax-shipper-ord-rev.jsp", //this is my servlet
            data: {
                id: $('#orderid-edit').val(),
                note: $('#ordernote-edit').val(),
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    clickme('myorder-refresh');
    clickme('new-order-refresh');
    clickme('old-order-refresh');
});    