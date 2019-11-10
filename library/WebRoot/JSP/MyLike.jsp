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
    
    <title>My JSP 'MyLike.jsp' starting page</title>
    
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
            <li class="selected"><a href="/library/servlet/Recommend">猜你喜欢</a></li>
            <li><a href="/library/JSP/Register.jsp">注册</a></li>
            </ul>
        </div>        
       </div> 
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>猜你喜欢</div>
         <%  
   List<NewBook> list =(List<NewBook>) request.getAttribute("List");
    int i=0;
   if(list==null)
   {
   out.println("没有数据");
   }
   else{
   int op=0;
   if(list.size()>4)
   {
   op=4;
   }
   else{
   op=list.size();
   }
   for(int j=0;j<op;j++)
   {
  %>
        	<div class="feat_prod_box">
            	<div class="prod_img"><a href="details.html"><img src="images/prod1.gif" alt="" title="" border="0" /></a></div>
                  <a hidden="true" onclick="hiddenA(<%=list.get(j).getBookID()%>)"  id="hidden<%=j%>">></a>
                <div class="prod_det_box">
                	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title"><strong>书本名称：<span class="red"><%=list.get(j).getBookMC() %></span></strong></div>
                    <%-- <div class="price"><strong>产生费用:￥</strong> <span class="red"><%=list.get(j).getCost() %></span></div> --%>
                     <div class="price"><strong>相似度:<span class="red"><%=list.get(j).getSimilarity() %></span></strong>           
</div>
                     <a href="details.html" class="more">-更多细节-</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
                 <%}} %>  
                      <div class="pagination">
          <%--   <span class=""><a onclick="Last()" href="<%=request.getContextPath()%>/servlet/MyRecord?page=Last"><<</a></span><span class="current"><%=Page.DimpageRow %></span>
            <a  onclick="Next()" href="<%=request.getContextPath()%>/servlet/MyRecord?page=Next">>></a>
           --%>
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
 
</script>
</body>
</html>
