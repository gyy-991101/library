<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CheckBook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="css/main.css" type="text/css"></link>
  <link rel="stylesheet" href="css/normalize.css" type="text/css"></link>
 
	 <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<style type="text/css">
.autocompleter{
top:34px;
}
</style>
  </head>
  
  <body>
    <div class="row modal-header">
            <div class="col-md-3">
             <div class="input-group">
      <div class="input-group-addon">书名：</div>

      <input  type="text" class="form-control" id="exampleInputAmount1" placeholder="书本名称">
        
            </div>
            </div>
            <div class="col-md-3">
              <div class="input-group">
      <div class="input-group-addon">作者：</div>
      <input  type="text" class="form-control" id="exampleInputAmount2" placeholder="作者名字">
             </div>
            </div>
            
            <div class="col-md-3">
             <div class="input-group">
      <div class="input-group-addon">区域：</div>
      <input  type="text" class="form-control" id="exampleInputAmount3" placeholder="区域">
             </div>
                
            </div>
            <div class="col-md-3">
             <div class="input-group">
      <div class="input-group-addon">状态：</div>
    <!--   <select></select> -->
    <!--   <input  type="text" class="form-control" id="exampleInputAmount4" placeholder="状态">-->       
    <select id="exampleInputAmount4" onchange="StateOn()"  class="btn btn-primary btn-block">
    <option value=" ">全部</option>
    <option value="0">未借</option>
    <option value="1">已借</option>
    <option value="2">遗失</option>
    </select>
             </div>
            </div>
          <!--   <input  type="button" class="form-control"  value="查询" onclick="Select()"> -->
     
        </div>

                <div class="modal-header">
                  
                
                </div>
                <div class="modal-body">
                    <table class="table table-hover table-bordered" id="Tab1">
                        <tr>
                            <td class="info">序号</td>
                            <td class="info">书籍名称</td><!-- active -->
                            <td class="info">作者姓名</td><!-- info -->
                            <td class="info">出版社名称</td><!-- success -->
                            <td class="info">出版日期</td><!-- warning -->
                            <td class="info">登记日期</td>
                            <td class="info">状态</td>
                            <td class="info">物理位置</td>
                            <td class="info">价格</td>
                        </tr>
                    </table>
                    <%-- <a href='<%=request.getContextPath()%>/servlet/MainServlt?type=homepage'>首页</a> --%>
                   
                   
                    
                      <nav>
  <ul class="pager">
    <li>  <a style="cursor:pointer " onclick="HomePage()">首页</a></li>
    <li>  <a style="cursor:pointer "  onclick="LastPage()">上一页</a></li>
   <li><a style="cursor:pointer " onclick="NextPage()">下一页</a></li>
  
  </ul>
</nav>
                </div>

      <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="JS/bootstrap.js"></script>
    <script type="text/javascript" src="JS/modal.js"></script>
     <script type="text/javascript" src="JS/jquery.autocompleter.js"></script>
    <script type="text/javascript">
     $(function(){   
        $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/SelectBookName",
        dataType:"json",  
        success:function(data)
        {
     $("#exampleInputAmount1").autocompleter({
        highlightMatches: true,
        source: data.data,
       
        empty: false,
        limit: 5,
    });
                 } })
    dimSelect();
  
}); 
      window.onload=function(){
      type="";
  var otxt=document.getElementById("exampleInputAmount1");
  var otxt2=document.getElementById("exampleInputAmount2");
  var otxt3=document.getElementById("exampleInputAmount3");
  //var otxt4=document.getElementById("exampleInputAmount4");
   var sel = document.getElementById("exampleInputAmount4");
   var otxt4 = sel.options[sel.selectedIndex].value;
  var count=0;
  if(document.all)
  {
      otxt.onpropertychange=function(){
      dimSelect();
     },
      otxt2.onpropertychange=function(){
      dimSelect();
     },
      otxt3.onpropertychange=function(){
      dimSelect();
     },
      otxt4.onpropertychange=function(){
    dimSelect();
     } 
  }
  else{
    otxt.oninput=function()
    {dimSelect();
    },
    otxt2.oninput=function()
    {
     dimSelect();
    },
     otxt3.oninput=function()
    {
     dimSelect();
    },
     otxt4.oninput=function()
    {
     dimSelect();
    }
  }
}
function dimSelect(){
 Select();
}

function Select(){
/* var row=0; */
  var otxt=document.getElementById("exampleInputAmount1").value;
  var otxt2=document.getElementById("exampleInputAmount2").value;
  var otxt3=document.getElementById("exampleInputAmount3").value;
  //var otxt4=document.getElementById("exampleInputAmount4").value;
  var sel = document.getElementById("exampleInputAmount4");
  var otxt4 = sel.options[sel.selectedIndex].value;
 
        $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/DimServlet",
        dataType:"json", 
        data:{otxt:otxt,otxt2:otxt2,otxt3:otxt3,otxt4:otxt4,type:type},
        success:function(data)
        {
         var row=data.row;
        if(data.count==0)
        {
        if(data.data!=null)
        {
        alert(data.data)
        }
        else{
          $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
          alert("没数据");
        }
        }
        else{
          $("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
                 var table;
                 var D=",";
                 for (i = 0; i < data.data.length ; i++) 
                 {
               row++;
               var state= data.data[i].state==0?"可借":data.data[i].state==1?"正在借":data.data[i].state==2?"遗失":"出错";
               table += "<tr onclick='XiangXi(" + data.data[i].BookID + ""+D+""+(i+1)+") '><td   >" + (row) + "</td><td   >" +  data.data[i].bookMC + "</td><td  >" +data.data[i].authorName + "</td><td   >" + data.data[i].pressName + "</td><td  >" +data.data[i].publicationDate+ "</td><td  >" +data.data[i].recordDate + "</td><td  >" +state+ "</td><td   >" +  data.data[i].location + "</td><td  >" +data.data[i].price + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        }
  
        }
     })
}
var type="";
function NextPage()
{
type="NextPage";
Select();
}
function LastPage(){
type="LastPage";
Select();
}
function StateOn()
{
type="";
dimSelect();
}
    </script>
  </body>
</html>
