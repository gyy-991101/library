<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.gx.po.NewBook"%>
<%@page import="com.gx.dao.impl.ImplBookDao"%>
<%@page import="com.gx.dao.BookDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/style2.css" type="text/css"></link>
 
 
  </head>
  
<body>
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.html"><img src="/library/images/logobook2.png" alt="" title="" border="0" /></a></div>            
        <div id="menu">
           <ul>                                                                       
            <li ><a href="/library/JSP/Main.jsp">首页</a></li>
            <li><a href="/library/JSP/about.jsp">关于我们</a></li>
            <li><a href="/library/servlet/PageServlet">借书</a></li>
            <li><a href="specials.html">还书</a></li>
            <li><a href="/library/servlet/MyRecord">我的记录</a></li>
            <li><a href="/library/servlet/Recommend">猜你喜欢</a></li>
            <li class="selected"><a href="/library/JSP/Register.jsp">注册</a></li>
            </ul>
        </div>     
              
       </div> 
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>注册</div>
        
        	<div class="feat_prod_box_details">
           
            
              	<div class="contact_form">
                <div class="form_subtitle">注册</div>
                 <form name="register" action="#">          
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input id="account" type="text" class="contact_input" />
                    </div>  
                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input id="password" type="text" class="contact_input" />
                    </div> 

                    <div class="form_row">
                    <label class="contact"><strong>邮箱:</strong></label>
                    <input id="E-mail" type="text" class="contact_input" />
                   
                    </div>
 <div class="form_row">
                  
                    <input type="text" class="contact_input" style="width: 175px;margin-left: 80px;height: 25px;" />
                    <input type="button" onclick="sendmail()" id="sendmail" value="验证邮箱">
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>手机号码:</strong></label>
                    <input id="phone" type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>姓名:</strong></label>
                    <input id="UserName" type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>性别:</strong></label>
                   <!--  <input type="text" class="contact_input" /> -->
                   <select id="exampleInputAmount4" onchange="StateOn()" style="width: 255px;">
  
    <option value="0">《--未选择--》</option>
    <option value="1">男</option>
    <option value="2">女</option>
    </select>
                    </div>   
                      <div class="form_row">
                  
                    <input type="text" class="contact_input" style="width: 165px;margin-left: 75px;height: 25px;" />
                    <input type="button" id="send" value="发送验证码">
                    </div>                 

                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                       我同意<a href="#">条约 &amp; 借书规则</a>                        </div>
                    </div> 
 
                    <div class="form_row">
                    <input type="button" class="register" value="注册" onclick="registerclick()" />
                    </div>   
                  </form>     
                </div>  
            
          </div>	
                    
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
  
              <div class="cart">
              </div>
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们图书馆</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
              我校图书室成立于2009年，是集现代化与信息化于一体的功能室，其中包括阅览室和藏书室两部分。 </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>向你推荐</div> 
                     <%  BookDao bookDao3=new ImplBookDao();
               List<NewBook> l3= bookDao3.findAll();
               for(int g=0;g<3;g++)
               {
                %>
                    <div class="new_prod_box">
                       <a href="/library/servlet/BorrowBooksServlet?type=<%=l3.get(g).getBookID()%>"><%=l3.get(g).getBookMC() %></a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="/library/servlet/BorrowBooksServlet?type=<%=l3.get(g).getBookID()%>"><img src="/library/servlet/Image?id=<%=l3.get(g).getBookID()%>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                       <%} %>  
                               
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>本月排行榜</div> 
                
                  <% BookDao bookDao=new ImplBookDao();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
                  Calendar   cal_1=Calendar.getInstance();//获取当前日期 
              cal_1.add(Calendar.MONTH+1, -1);
             cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
             Date firstDay =cal_1.getTime();
             
             Calendar ca = Calendar.getInstance();    
ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
      Date  lastDay = ca.getTime();
            List<NewBook> l=  bookDao.findMonthBytime(firstDay, lastDay);
            for(int k=0;k< l.size();k++)
            {
                 %>
                <ul class="list">
                <li><a href="/library/servlet/BorrowBooksServlet?type=<%=l.get(k).getBookID()%>"><%=l.get(k).getBookMC() %></a></li>                                          
                </ul>
                <% }%>
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>排行榜</div> 
               <%  BookDao bookDao2=new ImplBookDao();
               List<NewBook> l2= bookDao2.findAll();
               for(int g=0;g<l2.size()-1;g++)
               {
                %>
                <ul class="list">
                <li><a href="/library/servlet/BorrowBooksServlet?type=<%=l2.get(g).getBookID()%>"><%=l2.get(g).getBookMC() %></a></li>                          
                </ul>      
             <% } %>  
             </div>         
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
        </div>
       </div>
</div>
 <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
var Phonecode="";
function registerclick(){
var account=document.getElementById("account").value;
var password=document.getElementById("password").value;
var mail=document.getElementById("E-mail").value;
var phone=document.getElementById("phone").value;
var UserName=document.getElementById("UserName").value;
var Sex = $("#exampleInputAmount4 option:selected").val();
 $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/InsertUser",
        dataType:"json",  
        data:{account:account,password:password,mail:mail,phone:phone,UserName:UserName,Sex:Sex},
        success:function(data){
               alert(data.data);
                 } });
}
window.onload=function(){

var send=document.getElementById('send'),

times=60,

timer=null;
send.onclick=function(){
// 计时开始

var phone=document.getElementById("phone").value;
 $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SendsmsServlet",
        dataType:"json",  
        data:{phone:phone},
        success:function(data){
               Phonecode=data.data;
                 } });
var that = this;
this.disabled=true;
timer = setInterval(function(){

times --;

that.value = times + "秒后重试";

if(times <= 0){

that.disabled =false;

that.value = "发送验证码";

clearInterval(timer);

times = 60;

}
//console.log(times);

},1000);
}
}
function sendmail(){
var mail=document.getElementById("E-mail").value;
 $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SendMail",
        dataType:"json",  
        data:{mail:mail},
        success:function(data){
               //Phonecode=data.data;
                 } });
}
</script>
</body>
</html>
