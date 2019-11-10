<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Maintain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
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
                  
                    <h4 class="modal-title" id="myModalLabel2">查询书本</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-hover" id="Tab1">
                        <tr>
                            <td class=" ">序号</td>
                            <td class=" ">书籍名称</td><!-- active -->
                            <td class=" ">作者姓名</td><!-- info -->
                            <td class=" ">出版社名称</td><!-- success -->
                            <td class=" ">出版日期</td><!-- warning -->
                            <td class=" ">登记日期</td>
                            <td class=" ">状态</td>
                            <td class=" ">物理位置</td>
                            <td class=" ">价格</td>
                            <td class=" ">类型</td>
                        </tr>
                    </table>
                    <%-- <a href='<%=request.getContextPath()%>/servlet/MainServlt?type=homepage'>首页</a> --%>
                   <nav>
  <ul class="pager">
    <li> <a style="cursor:pointer " onclick="HomePage()">首页</a></li>
    <li>  <a style="cursor:pointer "  onclick="LastPage()">上一页</a></li>
   <li> <a style="cursor:pointer " onclick="NextPage()">下一页</a></li>
  
  </ul>
</nav>
                 
                </div>
<button id="BtnSongHuo" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModa2" style="display:none ">
                送货
            </button>
              <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                     <div class="input-group">
                      <span class="input-group-addon" id="Dispersion01">图书类型</span>
                        <select id="selectGYS2"  class="btn btn-primary btn-block"></select>
                       </div>
                       
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion2">书籍名称</span>
                            <input id="BookMC" type="text" class="form-control" placeholder="书籍名称" aria-describedby="Dispersion2">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion4">作者姓名</span>
                            <input id="authorName" type="text" class="form-control" placeholder="作者姓名" aria-describedby="Dispersion4">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion5">出版社名</span>
                            <input id="PressName" type="text" class="form-control" placeholder="出版社名称" aria-describedby="Dispersion5">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion6">出版日期</span>
                            <input  onClick="laydate()" id="publicationDate" type="text" class="form-control" placeholder="出版日期" aria-describedby="Dispersion6">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion7">登记日期</span>
                            <input id="recordDate" type="text" class="form-control" placeholder="登记日期" aria-describedby="Dispersion7">
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon" id="Dispersion8">物理位置</span>
                            <input id="location" type="text" class="form-control" placeholder="物理位置" aria-describedby="Dispersion8">
                        </div>
                         
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion10">价格</span>
                            <input id="price" type="text" class="form-control" placeholder="价格" aria-describedby="Dispersion10">
                        </div>
   
                    </div>
                    <div class="modal-footer">
                       <input type="button" class="btn btn-primary" data-dismiss="modal" value="遗失" onclick="Lose()" />
                        <input type="button" class="btn btn-primary" data-dismiss="modal" value="修改" onclick="Save3()" />
                     <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
          
        </div>
    <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="JS/bootstrap.js"></script>
    <script type="text/javascript" src="JS/modal.js"></script>
    <script type="text/javascript">
    var type="";
    $(function(){   
    dimSelect();
      $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/DownBox",
        dataType:"json",  
        success:function(data){
                for (var i = 0; i < data.count ; i++) 
                {
              var ComboBox = document.getElementById("selectGYS2");
              var Option = document.createElement("option");
             Option.id = data.data[i].bookClassID;
             Option.text = data.data[i].bookClassMC;
             ComboBox.appendChild(Option);
          }
                 } });
}); 
      window.onload=function(){
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
      type="123";
      dimSelect();
     },
      otxt2.onpropertychange=function(){
      type="123";
      dimSelect();
     },
      otxt3.onpropertychange=function(){
      type="123";
      dimSelect();
     },
      otxt4.onpropertychange=function(){
      type="123";
    dimSelect();
     } 
  }
  else{
   type="123";
    otxt.oninput=function()
    {
    type="123";
    dimSelect();
    },
    otxt2.oninput=function()
    {
   type="123";
     dimSelect();
    },
     otxt3.oninput=function()
    {type="123";
   
     dimSelect();
    },
     otxt4.oninput=function()
    {
    type="123";
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
               table += "<tr onclick='XiangXi(" + data.data[i].bookID + ""+D+""+(i+1)+""+D+""+(row)+") '><td class=' ' >" + (row) + "</td><td class=' ' >" +  data.data[i].bookMC + "</td><td class=' '>" +data.data[i].authorName + "</td><td  class=' '>" + data.data[i].pressName + "</td><td class=' '>" +data.data[i].publicationDate+ "</td><td class=' '>" +data.data[i].recordDate + "</td><td class=' '>" +state+ "</td><td class=' ' >" +  data.data[i].location + "</td><td class=' '>" +data.data[i].price + "</td><td class=' '>" +data.data[i].bookClass + "</td></tr>"; 
                 }
                 $("#Tab1").append(table);
        }
        }
     })
}

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
type="123";
dimSelect();
}
var UpdateRow=0;
var UpdateID=0;
function XiangXi(t,y,r){
UpdateRow=r;
UpdateID=t;
 var table = document.getElementById("Tab1");
            for (var i = 1; i < table.firstElementChild.children.length; i++) {
                if (table.firstElementChild.children[i].localName == "tr") {
                    if (Number(table.firstElementChild.children[i].cells[0].innerHTML) == r)
                    {
                        var xiala = table.firstElementChild.children[i].cells[9].innerHTML;
                        //alert(xiala)
                        $("#selectGYS2").val(xiala);
                        document.getElementById("BookMC").value = table.firstElementChild.children[i].cells[1].innerHTML;
                        document.getElementById("authorName").value = table.firstElementChild.children[i].cells[2].innerHTML;
                        document.getElementById("PressName").value = table.firstElementChild.children[i].cells[3].innerHTML;
                        document.getElementById("publicationDate").value = table.firstElementChild.children[i].cells[4].innerHTML;
                        document.getElementById("recordDate").value = table.firstElementChild.children[i].cells[5].innerHTML;
                        document.getElementById("location").value = table.firstElementChild.children[i].cells[7].innerHTML;
                         document.getElementById("price").value = table.firstElementChild.children[i].cells[8].innerHTML;
                    }
                }
            }
document.getElementById("BtnSongHuo").click();
 
}
function Lose()
{
var BookCost=0;
 $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/LoseBook",
        dataType:"json",  
        data:{UpdateID:UpdateID,BookCost:BookCost},
        success:function(data){
               alert(data.data);
               StateOn();
                 } });
}
function Save3(){
                var sel = document.getElementById("selectGYS2");
                var updateClass = sel.options[sel.selectedIndex].id;
                //var updateClass=$("#selectGYS2 option:selected").val();
                var updateBookMC=document.getElementById("BookMC").value;
                var updateauthorName= document.getElementById("authorName").value;
                var updatePressName=document.getElementById("PressName").value;
                var updatepublicationDate=document.getElementById("publicationDate").value;
                var updaterecordDate=document.getElementById("recordDate").value;
                var updatelocation=document.getElementById("location").value;
                var updateprice=document.getElementById("price").value;
   $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/UpdateBook",
        dataType:"json",  
        data:{UpdateID:UpdateID,updateClass:updateClass,updateBookMC:updateBookMC,updateauthorName:updateauthorName,updatePressName:updatePressName,updatepublicationDate:updatepublicationDate,updaterecordDate:updaterecordDate,updatelocation:updatelocation,updateprice:updateprice},
        success:function(data){
               alert(data.data);
               StateOn();
                 } });
                       }
    </script>
  </body>
</html>
