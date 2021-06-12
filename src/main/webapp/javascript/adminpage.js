/* global CanvasJS */

function AAA()
{
    alert("AAAAAAAAAA");
}
function LoadPage(pagename){
    openPage(pagename);
}
function SetRedirect(pagename,id){
    var page = document.getElementById('pagere');
    var idre = document.getElementById('idre');
    page.value=pagename;
    idre.value=id;
    document.getElementById("re").submit();
}
function openPage(pageName) {

var i, tabcontent;
tabcontent = document.getElementsByClassName("divcontent");
for (i = 0; i < tabcontent.length; i++) {
  tabcontent[i].style.display = "none";
}
document.getElementById(pageName).style.display = "block";
}
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  var d = new Date();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('time').innerHTML =d.toDateString()+" "+
  h + ":" + m + ":" + s;
  
  var elms = document.querySelectorAll("[id='time']");
  for(var i = 0; i < elms.length; i++) 
  {
       elms[i].innerHTML =d.toDateString()+" "+
         h + ":" + m + ":" + s;
  }
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i;}  // add zero in front of numbers < 10
  return i;
}

function miniTable(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
        else {
            content.style.display = "none";
            btn.innerHTML="+";
         }
}
function miniChart(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
    content.style.width="500px";
}





function openForm(fname) {
    document.getElementById(fname).style.display = "block";
}

function closeForm(fname) {
    document.getElementById(fname).style.display = "none";
}
function clickme(name){
    document.getElementById(name).click();
}
function FilterTable(name,inputid,btn,sel) {
    var input, filter, table, tr, td, i, txtValue,value;
    input = document.getElementById(inputid);
    filter = input.value.toUpperCase();
    if(filter===""){
        clickme(btn);
    }
    else
    {
        table = document.getElementById(name);
        tr = table.getElementsByTagName("tr");
        value = parseInt(document.getElementById(sel).value);
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[value];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } 
                else {
                     tr[i].style.display = "none";
                }
            }       
        }
    }    
}
function setMindate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).setAttribute("min", today);
}
function setMaxdate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).setAttribute("max", today);
}
function FillForm1()
{
    document.getElementById("name-emp").value="";
    document.getElementById("mail-emp").value="";
    document.getElementById("phone-emp").value="";
    document.getElementById("add-emp").value="";
    document.getElementById("salary-emp").value="";
  
}
function FillForm2(name,sex,email,phone,add,pay,sal,eid)
{
    document.getElementById("name-emp-edit").value=name;
    document.getElementById("mail-emp-edit").value=email;
    document.getElementById("phone-emp-edit").value=phone;
    document.getElementById("add-emp-edit").value=add;
    document.getElementById("salary-emp-edit").value=sal;
    document.getElementById("paycheck-emp-edit").value=pay;
    document.getElementById("eid-emp-edit").value=eid;
    if(sex==="Nữ"){
        document.getElementById("sex-emp-edit").options.selectedIndex =1;
    }   
}
function FillForm3(pay,wd,last,eid)
{
    document.getElementById("paycheckempatt-edit").value=pay;
    document.getElementById("eidempatt-edit").value=eid;
    document.getElementById("lastempatt-edit").value=last;
    document.getElementById("workdayempatt-edit").value=wd;
 
}

function FillForm4(a,b,c)
{
    document.getElementById("username_edit_emp").value=a;
    document.getElementById("userpass_edit_emp").value=b;
    document.getElementById("acc_eid_edit").value=c;
}
function FillForm5(a)
{
    document.getElementById("acc_eid_create").value=a;
}

function FillForm6()
{
    document.getElementById("name-cus").value="";
    document.getElementById("mail-cus").value="";
    document.getElementById("phone-cus").value="";
    document.getElementById("add-cus").value="";
}
function FillForm7()
{
    document.getElementById("name-pro-add").value="";
    document.getElementById("mota-pro-add").value="";
    document.getElementById("price-pro-add").value="";
    document.getElementById("qua-pro-add").value="";
    document.getElementById("category-pro-add").value="";
    document.getElementById("url-pro-add").value="";
    document.getElementById("uploaded-pro").scr="https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607672014/1_kkeis8.png";
}
function FillForm7edit(name,mota,price,qua,cate,url,id)
{
    document.getElementById("name-pro-edit").value=name;
    document.getElementById("mota-pro-edit").value=mota;
    document.getElementById("price-pro-edit").value=price;
    document.getElementById("qua-pro-edit").value=qua;
    document.getElementById("category-pro-edit").value=cate;
    document.getElementById("url-pro-edit").value=url;
    document.getElementById("id-pro-edit").value=id;
    var img = document.getElementById("uploaded-pro-edit");
    img.setAttribute("src",url);
}

function FillForm11(name,sex,email,phone,add,cid)
{
    document.getElementById("name-cus-edit").value=name;
    document.getElementById("mail-cus-edit").value=email;
    document.getElementById("phone-cus-edit").value=phone;
    document.getElementById("add-cus-edit").value=add;
    document.getElementById("cid-cus-edit").value=cid;
    if(sex==="Nữ"){
        document.getElementById("sex-cus-edit").options.selectedIndex =1;
    }   
}
function FillFormaccedit(id,name,uid)
{
    document.getElementById("name-acc-emp-edit").value=name;
    document.getElementById("id-acc-emp-edit").value=id;
    document.getElementById("uid-acc-emp-edit").value=uid;
    document.getElementById("pass-acc-emp-edit").value="";
    document.getElementById("passagain-acc-emp-edit").value="";
}
function FillFormempnoacc(id)
{
    document.getElementById("name-acc-empnoacc").value="";
    document.getElementById("pass-acc-empnoacc").value="";
    document.getElementById("passagain-acc-empnoacc").value="";
    document.getElementById('id-acc-empnoacc').value=id;
}
function FillFormUpdateOrder(id,status,note)
{
    document.getElementById("orderid-edit").value =id;
    document.getElementById("ordernote-edit").value =note;
    document.getElementById("order-status");
    if (status === "Đã duyệt"){
        document.getElementById("order-status").options.selectedIndex=1;
    }
    else{
        document.getElementById("order-status").options.selectedIndex=0;
    }
}
function TinhLuong(sal,wd){
    var a=parseInt(sal);
    var b=parseInt(wd);
    var n=b/30*a;
    return n.toFixed(2);
}
function SubmitMe(name)
{
    document.getElementById(name).submit();
}

//hàm up ảnh //xài cho form khác thì copy rồi đổi tên
// của add pro duct
function ajaxSuccess() {
    response = JSON.parse(this.responseText);
    console.log("ajaxSuccess", typeof this.responseText);
    if(typeof(response["secure_url"]) === 'undefined')
    {
        alert("File chọn không hợp lệ");
    }
    else
    {
        document.getElementById('uploaded-pro').setAttribute("src", response["secure_url"]);//bỏ ảnh vào id nào đó
        document.getElementById('url-pro-add').value=response["secure_url"];
        //alert(response["secure_url"]);
    }
};
function AJAXSubmit(name) {
    var formElement=document.getElementById(name);
    if (!formElement.action) { return; }
    var xhr = new XMLHttpRequest();
    xhr.onload = ajaxSuccess;
    xhr.open("post", "https://api.cloudinary.com/v1_1/dkmk9tdwx/image/upload");
    xhr.send(new FormData(formElement));
};
// của edit pro duct
function ajaxSuccess_edit_product() {
    response = JSON.parse(this.responseText);
    console.log("ajaxSuccess", typeof this.responseText);
    if(typeof(response["secure_url"]) === 'undefined')
    {
        alert("File chọn không hợp lệ");
    }
    else
    {
        document.getElementById('uploaded-pro-edit').setAttribute("src", response["secure_url"]);//bỏ ảnh vào id nào đó
        document.getElementById('url-pro-edit').value=response["secure_url"];
        //alert(response["secure_url"]);
    }
};
function AJAXSubmit_edit_product(name) {
    var formElement=document.getElementById(name);
    if (!formElement.action) { return; }
    var xhr = new XMLHttpRequest();
    xhr.onload = ajaxSuccess_edit_product;
    xhr.open("post", "https://api.cloudinary.com/v1_1/dkmk9tdwx/image/upload");
    xhr.send(new FormData(formElement));
};
//-----------------------------------------------------------------


function SetDateToday(name){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).value = today;
}
 var menu = 1;

function MenuOPCS()
{
    if(menu===1)
    {
        document.getElementById('navlist').style.display='none';
        document.getElementById('sidebar').style.background='000';
        document.getElementById("sidebar").style.height='52px';
        document.getElementById('home').style.width='100%';
        document.getElementById('home').style.marginLeft ='0%';
        document.getElementById("icon-nav").className ='fas fa-angle-double-right';
        menu=0;
    }
    else{
        document.getElementById('navlist').style.display='block';
        document.getElementById('sidebar').style.background='#37474F';
        document.getElementById("sidebar").style.height='100%';
        document.getElementById('home').style.width='88%';
        document.getElementById('home').style.marginLeft ='12%';
        document.getElementById("icon-nav").className ='fas fa-angle-double-left';
        menu=1;
    }
}