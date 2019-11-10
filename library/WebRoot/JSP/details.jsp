<%@page import="com.gx.po.BorrowBook"%>
<%@page import="com.gx.po.Users"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.gx.dao.impl.ImplBookDao"%>
<%@page import="com.gx.dao.BookDao"%>
<%@page import="com.gx.po.NewBook"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'details.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
	<link rel="stylesheet" href="css/style2.css" type="text/css"></link>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen"></link>


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
       
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="/library/JSP/Main.jsp">首页</a> &gt;&gt; 详细
            </div>
             <% 
             String bookName="";
   List<NewBook> list =(List<NewBook>) request.getAttribute("list"); 
    int i=0;
   if(list==null)
   {
   out.println("没有数据");
   }
   else{
   for(NewBook book:list)
 {
 bookName=book.getBookMC();
  %>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span><%=book.getBookMC() %></div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="details.html"><img style="width:98px;height:150px" src="/library/servlet/Image?id=<%=book.getBookID()%>" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="/library/servlet/Image?id=<%=book.getBookID()%>" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">细节</div>
                    <p class="details">《<%=book.getBookMC() %>》是中国当代知名作家余华继《兄弟》之后，时隔七年后最新长篇小说。用荒诞的笔触和意象讲述了一个普通人死后的七日见闻：讲述了现实的真实与荒诞；讲述了生命的幸福和苦难；讲述了眼泪的丰富和宽广；讲述了比恨更绝望比死更冷酷的存在。 
“浓雾弥漫之时，我走出了出租屋，在空虚混沌的城市里孑孓而行。我要去的地方名叫殡仪馆，这是它现在的名字，它过去的名字叫火葬场。我得到一个通知，让我早晨九点之前赶到殡仪馆，我的火化时间预约在九点半。</p>
                    <div class="price"><strong>价格:￥</strong> <span class="red"><%=book.getPrice() %></span></div>
                    <div class="price"><strong>借出次数:</strong><input type="text" value="<%=book.getBrcount() %>" id="BorrowCount"> </div>
                    <div class="price"><strong>颜色:</strong> 
                    <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>                    
                    </div>
                   <!--  <a href="details.html" class="more"></a> -->
                    <button id="BtnSongHuo2" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModa3" >借书</button>
                    <div class="clear"></div>
                    </div>
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            <% request.getSession().setAttribute("BorrowCount", book.getBrcount());   %>
              
            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">更多细节</a></li>
                <li><a class="" href="#tab2">相似的书</a></li>
                </ul>
            <div class="tabs-container">
                    <div style="display: block;" class="tab" id="tab1">
                    <p class="more_details">书名：<%=book.getBookMC() %>
作者：<%=book.getAuthorName() %>
<br>
出版社：<%=book.getPressName()%>
<br>
出版年：<%=book.getPublicationDate()%>
<br>
内容梗概：
<%=book.getBookMC() %>写了什么？
已经死去的杨飞，接到来自殡仪馆的电话，催促他去火化——他知道自己死了，可不知道是怎么死的。待他到殡仪馆排队拿号，由于没买墓地，只得放弃火化，成了“死无葬身之地”的孤魂野鬼。——他是在餐厅失火时被砸死的，那一刻他正震惊于电视中已成高官情妇的前妻自杀的新闻。
在阴间，杨飞开始寻找养父。他是铁路工人杨金彪捡的养子。父子情深，杨金彪老来有病，怕拖累他无声离去。这一路，杨飞见到各路亡灵，这些人间过客，许多都是各类新闻事件的主人公——拆迁、瞒报死亡人数、死婴丢弃、“鼠族”生活、杀警案、地下卖肾……这些时代的疼痛，被《第七天》聚在了一起。在余华笔下的“死无葬身之地”，人与人友爱互助，食品是安全的……“那里没有贫贱也没有富贵，没有悲伤也没有疼痛，没有仇也没有恨……那里人人死而平等”。
<br>
浓雾弥漫之时，我走出了出租屋，在空虚混沌的城市里孑孓而行。我要去的地方名叫殡仪馆，这是它现在的名字，它过去的名字叫火葬场。我得到一个通知，让我早晨九点之前赶到殡仪馆，我的火化时间预约在九点半。
                                     </p>                                    
                    </div>	
                    <%}} %>
                      <div style="display: none;" class="tab" id="tab2">
                <%
                 List<NewBook> list2 =(List<NewBook>) request.getAttribute("List2"); 
                 for(int o=0;o<list2.size();o++)
                 {
                 %>
                      
                    <div class="new_prod_box">
                        <a href="details.html"><%=list2.get(o).getBookMC() %></a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="/library/servlet/Image?id=<%=list2.get(o).getBookID()%>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                 
                            <%} %>
                               <div class="clear"></div>
                            </div>	
            
            </div>
			</div>
                       
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
                	<div class="languages_box">
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
             	<div class="title"><span class="title_icon"><img src="/library/images/bullet5.gif" alt="" title="" /></span>本周排行榜</div> 
                
                <% 
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
                  Calendar   cal_1=Calendar.getInstance();//获取当前日期 
              cal_1.add(Calendar.MONTH+1, -1);
             cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
             Date firstDay =cal_1.getTime();
             
             Calendar ca = Calendar.getInstance();    
ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
      Date  lastDay = ca.getTime();
            List<NewBook> l=  bookDao3.findMonthBytime(firstDay, lastDay);
            for(int k=0;k< l.size();k++)
            {
                 %>
                <ul class="list">
                <li><a href="/library/servlet/BorrowBooksServlet?type=<%=l.get(k).getBookID()%>"><%=l.get(k).getBookMC() %></a></li>                                          
                </ul>
                <% }%>
                
             	<div class="title"><span class="title_icon"><img src="/library/images/bullet6.gif" alt="" title="" /></span>排行榜</div> 
                
                <% 
                 BookDao bookDao2=new ImplBookDao();
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
 
                 <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">输入借书证号</h4>
      </div>
                    </div>
                    <div class="modal-body">
      <div class="input-group">
                            <span class="input-group-addon" id="Dispersion102">借书证</span>
                            <input id="BookID" type="text" class="form-control" placeholder="借书证" aria-describedby="Dispersion102">
                        </div>
      </div>
                    
                    <div class="modal-footer">
                       <input type="button" class="btn btn-primary" data-dismiss="modal" value="确定"  onclick="Save4()" />
                       
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <a hidden="true" id="hidden" href='<%=request.getContextPath()%>/servlet/BookCardVerification' ></a>
</div>
</body>
<script type="text/javascript" src="JS/prototype.js"></script>

  <script type="text/javascript" src="JS/scriptaculous.js?load=effects"></script>
  <script type="text/javascript" src="JS/lightbox.js"></script>
  <script type="text/javascript" src="JS/java.js"></script>
    <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="JS/bootstrap.js"></script>
  <script type="text/javascript" src="JS/modal.js"></script>
  
<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

function Save4()
{
  //document.getElementById("hidden").click();
 var BookCardID =document.getElementById("BookID").value;
 var BorrowCount =document.getElementById("BorrowCount").value;
   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/BookCardVerification?BookCardID="+BookCardID,
        dataType:"json",  
        success:function(data){
        alert(data.data);
        self.location="/library/servlet/PageServlet"; 
      //window.navigate("/library/servlet/PageServlet"); 
                 } })
 }

</script>
</html>
