<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.gx.po.NewBook"%>
<%@page import="com.gx.servlet.myRecord.Page"%>
<%@page import="com.gx.po.Users"%>
<%@page import="com.gx.dao.impl.ImplBookDao"%>
<%@page import="com.gx.dao.BookDao"%>
<%@page import="com.gx.po.BorrowBook"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyRecord.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style2.css" type="text/css"></link>
	<script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
<style type="text/css">
/* * {<br />
padding:0;margin:0;
list-style:none; float:left;
}

.star li {

float: left;

height: 20px;

width: 20px;

background-color: #CCC;

margin-right: 4px;

} */
.star_bg {
    width: 120px; height: 20px;
    background: url(/library/images/star.png) repeat-x;
    position: relative;
    overflow: hidden;
}
.star {
    height: 100%; width: 24px;
    line-height: 6em;
    position: absolute;
    z-index: 3;
}
.star:hover {    
    background: url(/library/images/star.png) repeat-x 0 -20px!important;
    left: 0; z-index: 2;
}
.star_1 { left: 0; }
.star_2 { left: 24px; }
.star_3 { left: 48px; }
.star_4 { left: 72px; }
.star_5 { left: 96px; }
.star_1:hover { width: 24px; }
.star_2:hover { width: 48px; }
.star_3:hover { width: 72px; }
.star_4:hover { width: 96px; }
.star_5:hover { width: 120px; }

label { 
    display: block; _display:inline;
    height: 100%; width: 100%;
    cursor: pointer;
}

/* 幕后的英雄，单选按钮 */
.score { position: absolute; clip: rect(0 0 0 0); }
.score:checked + .star {    
    background: url(/library/images/star.png) repeat-x 0 -20px;
    left: 0; z-index: 1;
}
.score_1:checked ~ .star_1 { width: 24px; }
.score_2:checked ~ .star_2 { width: 48px; }
.score_3:checked ~ .star_3 { width: 72px; }
.score_4:checked ~ .star_4 { width: 96px; }
.score_5:checked ~ .star_5 { width: 120px; }

.star_bg:hover .star {  background-image: none; }

/* for IE6-IE8 JS 交互 */
.star_checked {    
    background: url(/library/images/star.png) repeat-x 0 -20px;
    left: 0; z-index: 1;
}
</style>
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
            <li class="selected"><a href="/library/servlet/MyRecord">我的记录</a></li>
            <li><a href="/library/servlet/Recommend">猜你喜欢</a></li>
            <li><a href="/library/JSP/Register.jsp">注册</a></li>
            </ul>
        </div>        
       </div> 
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>我的借书历史</div>
         <%  
   List<BorrowBook> list =(List<BorrowBook>) request.getAttribute("List");
    int i=0;
   if(list==null)
   {
   out.println("没有数据");
   }
   else{
   for(int j=0;j<list.size();j++)
   {
  
  %>
        	<div class="feat_prod_box">
            
            	<div class="prod_img"><a href="details.html"><img src="images/prod1.gif" alt="" title="" border="0" /></a></div>
                  <a hidden="true" onclick="hiddenA(<%=list.get(j).getBorrowBooksID()%>)"  id="hidden<%=j%>">></a>
                <div class="prod_det_box">
                	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title"><strong>书本名称：<span class="red"><%=list.get(j).getBookMC() %></span></strong></div>
                    <div class="price"><strong>产生费用:￥</strong> <span class="red"><%=list.get(j).getCost() %></span></div>
                    <div class="price"><strong>评价:<span class="red"><%=list.get(j).getEvaluate() %></span> 星</strong> 
                    <% if(list.get(j).getEvaluate()==0) {%>
                   <div id="starBg" class="star_bg">                    	
    <input type="radio" id="starScore1" class="score score_1" value="1" name="score">
    <a href="#starScore1" onclick="F1(<%=j %>)" class="star star_1" title="差"><label for="starScore1">差</label></a>
    <input type="radio" id="starScore2" class="score score_2" value="2" name="score">
    <a href="#starScore2" onclick="F2(<%=j %>)" class="star star_2" title="较差"><label for="starScore2">较差</label></a>
    <input type="radio" id="starScore3" class="score score_3" value="3" name="score">
    <a href="#starScore3" onclick="F3(<%=j %>)" class="star star_3" title="普通"><label for="starScore3">普通</label></a>
    <input type="radio" id="starScore4" class="score score_4" value="4" name="score">
    <a href="#starScore4"  onclick="F4(<%=j %>)" class="star star_4" title="较好"><label for="starScore4">较好</label></a>
    <input type="radio" id="starScore5" class="score score_5" value="5" name="score">
    <a href="#5" onclick="F5(<%=j %>)" class="star star_5" title="好"><label for="starScore5">好</label></a>
</div>   <%} %>
</div>
                     <a href="details.html" class="more">- 更多细节 -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
                 <%}} %>  
                      <div class="pagination">
            <span class=""><a onclick="Last()" href="<%=request.getContextPath()%>/servlet/MyRecord?page=Last"><<</a></span><span class="current"><%=Page.DimpageRow %></span>
            <a  onclick="Next()" href="<%=request.getContextPath()%>/servlet/MyRecord?page=Next">>></a>
          
            </div>   
                     
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        	
                
                
             

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
<script type="text/javascript">
  $(function(){  
//document.getElementById("hiddenA").click();
   })
  var Evaluatenumber=0;
   function F5(j){
   if (window.confirm('是否评价为5星？'))
   {
   Evaluatenumber=5;
   var id="hidden"+j;
   document.getElementById(id).click();
   }
   else{
   }
   }
   function F4(j){
   if (window.confirm('是否评价为4星？'))
   {
   Evaluatenumber=4;
   var id="hidden"+j;
   document.getElementById(id).click();
   }
   else{
   }
   }
     function F3(j){
   if (window.confirm('是否评价为3星？'))
   {
   Evaluatenumber=3;
   var id="hidden"+j;
   document.getElementById(id).click();
   }
   else{
   }
   }
     function F2(j){
   if (window.confirm('是否评价为2星？'))
   {
   Evaluatenumber=2;
   var id="hidden"+j;
   document.getElementById(id).click();
   }
   else{
   }
   }
     function F1(j){
   if (window.confirm('是否评价为1星？'))
   {
   Evaluatenumber=1;
   var id="hidden"+j;
   document.getElementById(id).click();
   }
   else{
   }
   }
   function hiddenA(t){
   
   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/Evaluate",
        dataType:"json",  
        data:{Evaluatenumber:Evaluatenumber,borrowBooksID:t,page:"123"},
        success:function(data)
        {
               window.location.reload();
           }
                  });
   }
</script>
</body>

</html>
