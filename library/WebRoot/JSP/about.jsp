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
    
    <title>My JSP 'about.jsp' starting page</title>
    
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
            <li class="selected"><a href="/library/JSP/about.jsp">关于我们</a></li>
            <li><a href="/library/servlet/PageServlet">借书</a></li>
            <li><a href="specials.html">还书</a></li>
            <li><a href="/library/servlet/MyRecord">我的记录</a></li>
            <li><a href="/library/servlet/Recommend">猜你喜欢</a></li>
            <li><a href="/library/JSP/Register.jsp">注册</a></li>
            </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>关于我们</div>
        
        	<div class="feat_prod_box_details">
            <p class="details" style="font-size:14px">
            <img src="images/about.gif" alt="" title="" class="right" /> 
             我校图书室成立于2009年，是集现代化与信息化于一体的功能室，其中包括阅览室和藏书室两部分。<br /><br />其中藏书室共有藏书两万多册，配套有图书馆电子管理系统，另有图书架八个，四个为双面书架，四个为单面书架、电脑以及空调等现代化设备。
<br /><br />
                
                                     阅览室环境整洁、幽静，文化氛围浓郁，所有图书都贴有标签，并按标准分为22个基本类，其中第一大类占有1.2%，第二大有2.0%，第三大类占有2.3%，第四大类占有79.4%，第五大类占有15.1%，分配结构合理，摆放有序，和谐美观，保证质量。   
                                     
                                     <br /><br />   
 图书室墙上张贴着《藏书室借书制度》、《阅览室制度》便于领导、老师、学生监督使用。图书室内张贴标语、板报、字画用于图书宣传，介绍。                                     
             <br /><br />  
             我校每个班级有自己的小书架，二、三楼有全校的开放性书架方便学生课间阅读；每周有一节阅读课，有利于阅读教育；每天午读时间图书室、藏书室都对全校师生进行开放，方便师生借阅。
             
             
            </p>
            
            
            </div>	
            
              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">

         <!--      <div class="cart">

              </div> -->
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们图书馆</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
             我校图书室成立于2009年，是集现代化与信息化于一体的功能室，其中包括阅览室和藏书室两部分。  </p>
             
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
             	<div class="title"><span class="title_icon"><img src="/library/images/bullet6.gif" alt="" title="" /></span>排行榜</div> 
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

</body>
</html>
