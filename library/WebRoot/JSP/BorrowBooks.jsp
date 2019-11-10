<%@page import="com.gx.servlet.BorrowBooks.PageByBorrow"%>
<%@page import="com.gx.servlet.myRecord.Page"%>
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
    
    <title>My JSP 'BorrowBooks.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
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
            <li class="selected"><a href="/library/servlet/PageServlet">借书</a></li>
            <li><a href="specials.html">还书</a></li>
            <li><a href="/library/servlet/MyRecord">我的记录</a></li>
            <li><a href="/library/servlet/Recommend">猜你喜欢</a></li>
            <li><a href="/library/JSP/Register.jsp">注册</a></li>
            </ul>
        </div>     
            
       </div> 

      <div class="center_content" >
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="/library/JSP/Main.jsp">首页</a> &gt;&gt;书本
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>书本</div>
           
            <div class="new_products">
                        <% 
   List<NewBook> list =(List<NewBook>) request.getAttribute("List"); 
    int i=0;
   if(list==null)
   {
   out.println("没有数据");
   }
   else{
   for(int j=0;j<list.size();j++)
   {
  %>
                    <div class="new_prod_box">
                        <a href="/library/servlet/BorrowBooksServlet?type=<%=list.get(j).getBookID()%>"><%=list.get(j).getBookMC()%></a>
                        <div class="new_prod_bg">
                        <a href="/library/servlet/BorrowBooksServlet?type=<%=list.get(j).getBookID()%>"><img src="/library/servlet/Image?id=<%=list.get(j).getBookID()%>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                      
                    <%}} %>
                       <div class="pagination">
            <span class=""><a onclick="Last()" href="<%=request.getContextPath()%>/servlet/PageServlet?page=Last"><<</a></span><span class="current"><%=PageByBorrow.DimpageRow %></span>
            <a  onclick="Next()" href="<%=request.getContextPath()%>/servlet/PageServlet?page=Next">>></a>
            </div>   

            </div> 

          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content" style="margin-left: 20px;">

                
      <div class="cart">
      <form action="<%=request.getContextPath()%>/servlet/PageServlet" method="get">
     <div class="col-lg-16" style="position: relative;top: -25px;left:10px;">
    <div class="input-group">
      <input type="text" name="BookName" class="form-control" placeholder="查询...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit" >查询</button>
      </span>
    </div>
  </div>
  </form>
             </div>     
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们的图书馆</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
           我校图书室成立于2009年，是集现代化与信息化于一体的功能室，其中包括阅览室和藏书室两部分。
  </p>
             
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
       </div>
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
<%-- function Select()
{
  $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/PageServlet",
        dataType:"json",  
        success:function(data)
        {

        } 
})
} --%>
</script>
  </body>
</html>
