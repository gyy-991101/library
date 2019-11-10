<%@page import="com.gx.servlet.returnBook.Paging"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ReturnBook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" href="css/main.css" type="text/css"></link>
  <link rel="stylesheet" href="css/normalize.css" type="text/css"></link>
 <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>

  </head>
  <body>
  
         <div  id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">输入借书证号</h4>
      </div>      
       <div class="modal-body">
             <div class="input-group">
                            <span class="input-group-addon" id="Dispersion102">借书证</span>
                             <div class="field">
                            <input id="BookID" type="text" class="form-control" placeholder="借书证" aria-describedby="Dispersion102">
                        </div>
                        </div>
      </div> 
      
                    <div class="modal-footer">
                       <input type="button" class="btn btn-primary" data-dismiss="modal" value="确定"  onclick="Save4()" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    <button id="BtnUpdate6" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModa4" style="display:none">
        送货
    </button>
         <div class="modal fade" style="z-index:1051" id="myModa4"  role="dialog" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">借书详情</h4>
      </div>
                    </div>
                    <div class="modal-body">
                       <div class="input-group">
                            <span class="input-group-addon" id="borrowBookDate2">借书日期</span>
                            <input id="borrowBookDate" type="text" class="form-control" placeholder="借书日期" aria-describedby="borrowBookDate2">
                        </div>
                         <br>
                        <div class="input-group">
                            <span class="input-group-addon" id="returnBookDate2">免费日期</span>
                            <input id="returnBookDate" type="text" class="form-control" placeholder="免费日期" aria-describedby="returnBookDate2">
                        </div>
                        <br>
                         <div class="input-group">
                            <span class="input-group-addon" id="cost2">产生费用</span>
                            <input id="cost" type="text" class="form-control" placeholder="产生费用" aria-describedby="cost2">
                        </div>
                        
      </div>
                    
                    <div class="modal-footer">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="遗失" onclick="Lose()" />
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="续期"  onclick="Continue()" />
                       <input type="button" class="btn btn-primary" data-dismiss="modal" value="还书"  onclick="returnBook()" />
                       
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    <button id="BtnUpdate5" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal5" style="display:none">
        送货
    </button>
    <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document"style="width: 100%">
            <div class="modal-content" style="width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">查询书本</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-hover" id="Tab1">
                        <tr>
                            <td class="info">序号</td>
                            <td width="" class="info">书籍名称</td><!-- active -->
                            <td class="info">作者姓名</td><!-- info -->
                            <td class="info">出版社名称</td><!-- success -->
                            <td class="info">出版日期</td><!-- warning -->
                            <td class="info">登记日期</td>
                            <td class="info">状态</td>
                            <td class="info">物理位置</td>
                            <td class="info">价格</td>
                             <td class="info">借书日期</td>
                          <td class="info">还书日期</td>
                        </tr>
                    </table>
                    <%-- <a href='<%=request.getContextPath()%>/servlet/MainServlt?type=homepage'>首页</a> --%>
                    <a onclick="HomePage()" href="<%=request.getContextPath()%>/servlet/SelectBookByBookCard">首页</a>
                    <a  onclick="LastPage()" >上一页</a>
                
                    <a  id="NextPage" >下一页</a>
                 
                  
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" value="确定" data-dismiss="modal" onclick="QueDing()" />
                </div>
            </div>
        </div>
    </div>
     
            <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="JS/bootstrap.js"></script>
    <script type="text/javascript" src="JS/modal.js"></script>
        <script type="text/javascript" src="JS/jquery.autocompleter.js"></script>
    <script type="text/javascript">
    $(function () {
  $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookCard",
        dataType:"json",  
        success:function(data)
        {
     $("#BookID").autocompleter({
        highlightMatches: true,
        source: data.data,
        hint: true,
        empty: false,
        limit: 5,
    });
                 } })
 }
)
    function Save4()
    {
     var BookCardID =document.getElementById("BookID").value;
 
   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookByBookCard?BookCardID="+BookCardID,
        dataType:"json", 
       /*  data: {type:"First"} , */
        success:function(data)
        {
           var row=data.row;
         $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
                 var table;
                 var D=",";
                 for (i = 0; i < data.data.length ; i++) 
                 {
                 row++;
               var state= data.data[i].state==0?"可借":data.data[i].state==1?"正在借":data.data[i].state==2?"遗失":"出错";
                     table += "<tr onclick='XiangXi(" + data.data[i].borrowBooksID + ""+D+""+(i+1)+") '><td class=' ' >" + (row) + "</td><td class=' ' >" +  data.data[i].bookMC + "</td><td class=' '>" +data.data[i].authorName + "</td><td  class=' '>" + data.data[i].pressName + "</td><td class=' '>" +  data.data[i].publicationDate + "</td><td class=' '>" + data.data[i].recordDate + "</td><td class=' '>" +state+ "</td><td class=' ' >" +  data.data[i].location + "</td><td class=' '>" +data.data[i].price + "</td><td class=' ' >" + (data.data[i].date) + "</td><td class=' ' >" + (data.data[i].freeDate) + "</td><td hidden='true'  class=' '>" + data.data[i].bookID + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        document.getElementById("BtnUpdate5").click();
        }
     })
    }
    function LastPage()
    {
      var BookCardID =document.getElementById("BookID").value;
   // event.preventDefault();//使a自带的方法失效，即无法调整到href中的URL(http://www.baidu.com)
   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookByBookCard?BookCardID="+BookCardID,
        dataType:"json", 
        data:{type:"LastPage"},
        success:function(data)
        {
        if(data.count==0)
        {
        alert(data.data);
        }
        else
        {
         var row=data.row;
              $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
                 var table;
                 var D=",";
                 for (i = 0; i < data.data.length ; i++) 
                 {
                 row++;
               var state= data.data[i].state==0?"可借":data.data[i].state==1?"正在借":data.data[i].state==2?"遗失":"出错";
                     table += "<tr onclick='XiangXi(" + data.data[i].borrowBooksID + ""+D+""+(i+1)+") '><td class=' ' >" + (row) + "</td><td class=' ' >" +  data.data[i].bookMC + "</td><td class=' '>" +data.data[i].authorName + "</td><td  class=' '>" + data.data[i].pressName + "</td><td class=' '>" +  data.data[i].publicationDate + "</td><td class=' '>" + data.data[i].recordDate + "</td><td class=' '>" +state+ "</td><td class=' ' >" +  data.data[i].location + "</td><td class=' '>" +data.data[i].price + "</td><td class=' ' >" + (data.data[i].date) + "</td><td class=' ' >" + (data.data[i].freeDate) + "</td><td hidden='true'  class=' '>" + data.data[i].bookID + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        }
        }
     })
    }
   
    $("#NextPage").on("click",function(event){
     var BookCardID =document.getElementById("BookID").value;
    $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookByBookCard?BookCardID="+BookCardID,
        dataType:"json", 
        data:{type:"NextPage"},
        success:function(data)
        {
         if(data.count==0)
        {
        alert(data.data);
        }
        else
        {
        var row=data.row;
              $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
                 var table;
                 var D=",";
                 for (i = 0; i < data.data.length ; i++) 
                 {
                 row++;
               var state= data.data[i].state==0?"可借":data.data[i].state==1?"正在借":data.data[i].state==2?"遗失":"出错";
                     table += "<tr onclick='XiangXi(" + data.data[i].borrowBooksID + ""+D+""+(i+1)+") '><td class=' ' >" + (row) + "</td><td class=' ' >" +  data.data[i].bookMC + "</td><td class=' '>" +data.data[i].authorName + "</td><td  class=' '>" + data.data[i].pressName + "</td><td class=' '>" +  data.data[i].publicationDate + "</td><td class=' '>" + data.data[i].recordDate + "</td><td class=' '>" +state+ "</td><td class=' ' >" +  data.data[i].location + "</td><td class=' '>" +data.data[i].price + "</td><td class=' ' >" + (data.data[i].date) + "</td><td class=' ' >" + (data.data[i].freeDate) + "</td><td hidden='true'  class=' '>" + data.data[i].bookID + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        }
     
        }
     })
});
 var BooKID=0;//书本ID
  var IcostF=0;//费用
  var NewBooKID=0;
  var BookCost=0;//书本价格
    function XiangXi(t,y)
    {
   BooKID=t;
    var ID=t;
     var Row=y;
     IcostF=0;
      var table = document.getElementById("Tab1");
            for (var i = 1; i < table.firstElementChild.children.length; i++) {
                if (table.firstElementChild.children[i].localName == "tr") {
                    if (i == y) 
                    {
                   NewBooKID=table.firstElementChild.children[i].cells[11].innerHTML;
                  // alert(NewBooKID);
                  BookCost=table.firstElementChild.children[i].cells[8].innerHTML;
                    document.getElementById("borrowBookDate").value=table.firstElementChild.children[i].cells[9].innerHTML;
                    document.getElementById("returnBookDate").value=table.firstElementChild.children[i].cells[10].innerHTML;
                   var date = new Date();
                   var day= getDays(dijizhou(date),document.getElementById("borrowBookDate").value,date);
                  var day2= getDays(document.getElementById("returnBookDate").value,document.getElementById("borrowBookDate").value,date)
                   if(day>day2)
                   {
                   alert("超出免费日期");
                   var difference=day-day2;
                   var Icost= (difference*1)/10;
                  document.getElementById("cost").value=Icost;
                  IcostF=Icost;
                  BookCost=Number(BookCost)+Number(IcostF);
                   }
                   else{
                   document.getElementById("cost").value=0;
                   }
                    document.getElementById("BtnUpdate6").click();
                    }
                }
            }
    }
    function Continue()
    {
     $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/ContinueBook",
        dataType:"json", 
        data:{BooKID:BooKID,IcostF:IcostF,type:"123"},
        success:function(data)
        {
       alert(data.data);
       Save4();
        }
     })
    }
    function getDays(strDateStart, strDateEnd) {
            var strSeparator = "-"; //日期分隔符
            var oDate1;
            var oDate2;
            var iDays;
            oDate1 = strDateStart.split(strSeparator);
            oDate2 = strDateEnd.split(strSeparator);
            var strDateS = new Date(oDate1[0], oDate1[1] - 1, oDate1[2]);
            var strDateE = new Date(oDate2[0], oDate2[1] - 1, oDate2[2]);
            iDays = parseInt((strDateS - strDateE) / 1000 / 60 / 60 / 24)//把相差的毫秒数转换为天数
            return iDays;
        }
         function dijizhou(date)
        {  
    var Y = parseInt(date.getFullYear()) ;
    var M = parseInt(date.getMonth())+1;
    var D = parseInt(date.getDate());
    // alert(Y+" "+M+"  "+D);
    var k1 = "";
    k1 = (Y) + "-" + (M ) + "-" + (D );
    return k1;
            }   
     function returnBook()
     {
  $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/ReturnBook",
        dataType:"json", 
        data:{BooKID:BooKID,IcostF:IcostF,NewBooKID:NewBooKID,type:"123"},
        success:function(data)
        {
       alert(data.data);
       Save4();
        }
     })
     }
     
     var UpdateID=0;
     function Lose(){
     alert("需要提交费用："+BookCost);
     $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/LoseBook",
        dataType:"json",  
        data:{UpdateID:NewBooKID,BookCost:BookCost,BorrowBooksID:BooKID,type:"123"},
        success:function(data)
        {
               alert(data.data);
               Save4();
               //StateOn();
                 } });
     }
    </script>
  </body>
</html>
