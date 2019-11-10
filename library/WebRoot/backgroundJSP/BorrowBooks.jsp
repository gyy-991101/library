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

  <link rel="stylesheet" href="css/main.css" type="text/css"></link>
  <link rel="stylesheet" href="css/normalize.css" type="text/css"></link>
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>


  </head>
  
  <body>
     <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">借书</h4>
                    <br />
                    <div class="input-group">
                    
                        <span class="input-group-addon" id="Dispersion">书本名称</span>
                        <div class="field">
                        <input  type="text" id="SelectBookName"  class="form-control" placeholder="书本名称" aria-describedby="Dispersion">
                    </div>
            </div>
                    <br />
                    <div class="modal-footer">
                        <input type="button" class="btn btn-primary" data-dismiss="modal" value="查询" onclick="SelectBook()"/>
                    </div>
                </div>
            </div>
        </div>

    <button id="BtnUpdate5" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal5" style="display:none">
        送货
    </button>
    <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div style="margin-top:3%" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">查询书本</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered " id="Tab1">
                        <tr>
                            <td class="info">书籍名称</td><!-- active -->
                            <td  class="info">作者姓名</td><!-- info -->
                            <td  class="info">出版社名称</td><!-- success -->
                            <td  class="info">出版日期</td><!-- warning -->
                            <td  class="info">登记日期</td>
                            <td  class="info">状态</td>
                            <td  class="info">物理位置</td>
                            <td class="info">价格</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" value="确定" data-dismiss="modal" onclick="QueDing()" />
                </div>
            </div>
        </div>
    </div>
      <button id="BtnUpdate6" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModa3" style="display:none">
        送货
    </button>
         <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog"  role="document">
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
    <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="JS/bootstrap.js"></script>
    <script type="text/javascript" src="JS/modal.js"></script>
    <script type="text/javascript" src="JS/jquery.autocompleter.js"></script>
    <script type="text/javascript">
   
$(function () {
  $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookName",
        dataType:"json",  
        success:function(data)
        {
     $("#SelectBookName").autocompleter({
        highlightMatches: true,
        source: data.data,
        hint: true,
        empty: false,
        limit: 5,
    });
                 } })
 }
)
    function SelectBook()
    {
      var BookName= document.getElementById("SelectBookName").value;
       $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookByName?BookName="+BookName,
        dataType:"json",  
        success:function(data)
        {
          $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
                 var table;
                 var D=",";
                 for (i = 0; i < data.data.length ; i++) 
                 {
                 
               var state= data.data[i].state==0?"可借":data.data[i].state==1?"不可借":data.data[i].state==2?"遗失":"出错";
                     table += "<tr onclick='XiangXi(" + data.data[i].bookID + ""+D+""+(i+1)+") '><td   >" +  data.data[i].bookMC + "</td><td  >" +data.data[i].authorName + "</td><td   >" + data.data[i].pressName + "</td><td  >" +  data.data[i].publicationDate + "</td><td  >" + data.data[i].recordDate + "</td><td  >" +state+ "</td><td   >" +  data.data[i].location + "</td><td  >" +data.data[i].price + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        document.getElementById("BtnUpdate5").click();
                 } })
    }
    var BooKID=0;//书本ID
    function XiangXi(t,y)
    {
   BooKID=t;
    var ID=t;
     var Row=y;
      var table = document.getElementById("Tab1");
            for (var i = 1; i < table.firstElementChild.children.length; i++) {
                if (table.firstElementChild.children[i].localName == "tr") {
                    if (i == y) {
                    if(table.firstElementChild.children[i].cells[5].innerHTML=="不可借")
                    {
                    alert( table.firstElementChild.children[i].cells[5].innerHTML);
                    }
                    else{
                    document.getElementById("BtnUpdate6").click();
                    
                    } 
                     
                       }
                }
            }
    }
    function Save4()
{
  //document.getElementById("hidden").click();
 var BookCardID =document.getElementById("BookID").value;

   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/BookCardVerification?BookCardID="+BookCardID+"&typeID="+BooKID,
        dataType:"json",  
        success:function(data){
        alert(data.data);
         window.location.reload();
                 } })
 }
    </script>
  </body>
  
</html>
