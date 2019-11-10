<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'InsertBook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
   <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
  </head>
  
  <body>
  <form action="/library/servlet/InsertBook" method="post">
 <table class="table table-bordered table-hover" id="tab">
                        <tr>
                            <td  >书籍名称</td>
                            <td  >作者姓名</td>
                            <td  >出版社名称</td>
                            <td  >出版日期</td>
                            <td  >登记日期</td>
                            <td  >物理位置</td>
                            <td  >价格</td>
                            <td  >类型</td>
                            <td  >图片</td>
                        </tr>
                    </table>
                    <input type="button" class="btn btn-default" value="添加一行" onclick="AddRows()" />
                    <input type="button" class="btn btn-default" value="保存" onclick="SaveSu()"  />
                    
                    </form>
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
                        
                         <div class="input-group">
                            <span class="input-group-addon" id="Dispersion11">图片</span>
                           
                             <input type="file" id="picture" value="上传图片"  onchange="getImgURL(this)">
                         </div>
                         <img  src="" class="img" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <input type="button" class="btn btn-primary" data-dismiss="modal" value="保存" onclick="Save3()" />
                    </div>
                </div>
            </div>
        </div>
       <button id="BtnSongHuo2" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModa3" style="display:none ">
            送货
        </button>
                 <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                     <div class="input-group">
                      <span class="input-group-addon" id="Dispersion01">图书类型</span>
                        <select id="selectGYS22"  class="btn btn-primary btn-block"></select>
                       </div>
                       
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion22">书籍名称</span>
                            <input id="BookMC2" type="text" class="form-control" placeholder="书籍名称" aria-describedby="Dispersion22">
                        </div>

                      
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion42">作者姓名</span>
                            <input id="authorName2" type="text" class="form-control" placeholder="作者姓名" aria-describedby="Dispersion42">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion52">出版社名</span>
                            <input id="PressName2" type="text" class="form-control" placeholder="出版社名称" aria-describedby="Dispersion52">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion62">出版日期</span>
                            <input id="publicationDate2" type="text" class="form-control" placeholder="出版日期" aria-describedby="Dispersion62">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion72">登记日期</span>
                            <input id="recordDate2" type="text" class="form-control" placeholder="登记日期" aria-describedby="Dispersion72">
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon" id="Dispersion82">物理位置</span>
                            <input id="location2" type="text" class="form-control" placeholder="物理位置" aria-describedby="Dispersion82">
                        </div>
                         
                        <div class="input-group">
                            <span class="input-group-addon" id="Dispersion102">价格</span>
                            <input id="price2" type="text" class="form-control" placeholder="价格" aria-describedby="Dispersion102">
                        </div>
                        
                         <div class="input-group">
                            <span class="input-group-addon" id="Dispersion112">图片</span>
                             <input type="file" id="picture2">
                         </div>
                          <img id="updatesrc" src=""  class="img" />
                    </div>
                    <div class="modal-footer">
                       <input type="button" class="btn btn-primary" value="修改" data-dismiss="modal" onclick="Save4()" />
                        <input type="button" class="btn btn-primary" value="移除" data-dismiss="modal" onclick="delect()" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
 

  <script type="text/javascript" src="JS/bootstrap.js"></script>
  <script type="text/javascript" src="JS/modal.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript">
;!function(){
laydate({
   elem: '#recordDate'
}),
laydate({
   elem: '#publicationDate2'
}),
laydate({
   elem: '#recordDate2'
})
}();
</script>
  <script type="text/javascript">
  var url="";
$("input[type='file']").change(function(){   
 var file = this.files[0];
   if (window.FileReader) {    
            var reader = new FileReader();    
            reader.readAsDataURL(file);    
            //监听文件读取结束后事件    
          reader.onloadend = function (e) {
            $(".img").attr("src",e.target.result);    //e.target.result就是最后的路径地址
             url=e.target.result;
            
            };    
       } 
});
  function AddRows()
  {
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
            for (var i = 0; i < data.count ; i++) 
                {
              var ComboBox = document.getElementById("selectGYS22");
              var Option = document.createElement("option");
             Option.id = data.data[i].bookClassID;
             Option.text = data.data[i].bookClassMC;
              ComboBox.appendChild(Option);
          }
          document.getElementById("BookMC").value="";
            document.getElementById("authorName").value="";
           document.getElementById("PressName").value="";
            document.getElementById("publicationDate").value="";
             document.getElementById("recordDate").value="";
            document.getElementById("location").value="";
             document.getElementById("price").value="";
             document.getElementById("picture").attributes[1].ownerElement.value="";
            $(".img").attr("src","");
               document.getElementById("BtnSongHuo").click();
                 } });

  }
   var rowCount = 0;
   var delectRow = 0;
   var UpdateRow = 0;
  function Save3() {
            var peijianMC = $("#selectGYS2 option:selected").val();
            var BookMC = document.getElementById("BookMC").value;
            var authorName = document.getElementById("authorName").value;
            var PressName = document.getElementById("PressName").value;
            var publicationDate = document.getElementById("publicationDate").value;
            var recordDate = document.getElementById("recordDate").value;
            var location = document.getElementById("location").value;
            var price = document.getElementById("price").value;
            var picture = document.getElementById("picture").attributes[1].ownerElement.value;
            var table2 = document.getElementById("tab");
            var rowCount = table2.firstElementChild.childNodes.length;
            rowCount = rowCount-1;
             var scrname=document.getElementById("picture").files[0].name;//.value
            //$("#Tab1 tr:gt(0)").remove();//清空当前查询的数据
            var sel = document.getElementById("selectGYS2");
          var Classid = sel.options[sel.selectedIndex].id;
          
          
            var table;
            table += "<tr onclick='XiangXi(" + (rowCount+1) + ") '><td  class=  name='BookMC" + (rowCount) + "'>" + BookMC + "</td><td name='authorName" + (rowCount) + "' class=' '>" + authorName + "</td><td name='PressName" + (rowCount) + "' class=' '>" + PressName + "</td><td name='publicationDate" + (rowCount) + "' class=' '>" + publicationDate + "</td><td name='recordDate" + (rowCount) + "' class=' '>" + recordDate + "</td><td name='location" + (rowCount) + "' class=' '>" + location + "</td><td name='price" + (rowCount) + "' class=' '>" + price + "</td><td name='peijianMC" + (rowCount) + "' class=' '>" + peijianMC + "</td><td name='img" + (rowCount) + "' class= > <img src='"+url+"' alt='' class='img-rounded'></td><td hidden='true' name='scrname" + (rowCount) + "' class=' '>" + scrname + "</td><td hidden='true'  name='Classid" + (rowCount) + "' class=' '>" + Classid + "</td></tr>";
            $("#tab").append(table);
        }
    function XiangXi(t)
        {
            UpdateRow = t;
            delectRow = t-1;
            var table = document.getElementById("tab");
            for (var i = 1; i < table.firstElementChild.childNodes.length; i++) 
            {
                if (table.firstElementChild.childNodes[i].localName == "tr") 
                {
                    if (i == t)
                    {
                        var xiala = table.firstElementChild.childNodes[i].cells[7].innerHTML;
                        $("#selectGYS22").val(xiala);
                        document.getElementById("BookMC2").value = table.firstElementChild.childNodes[i].cells[0].innerHTML;
                        document.getElementById("authorName2").value = table.firstElementChild.childNodes[i].cells[1].innerHTML;
                        document.getElementById("PressName2").value = table.firstElementChild.childNodes[i].cells[2].innerHTML;
                        document.getElementById("publicationDate2").value = table.firstElementChild.childNodes[i].cells[3].innerHTML;
                        document.getElementById("recordDate2").value = table.firstElementChild.childNodes[i].cells[4].innerHTML;
                        document.getElementById("location2").value = table.firstElementChild.childNodes[i].cells[5].innerHTML;
                        document.getElementById("price2").value = table.firstElementChild.childNodes[i].cells[6].innerHTML;
                      var src1=  table.firstElementChild.childNodes[i].cells[8].children[0].src;
                     $("#updatesrc").attr("src",src1);
                    }
                }
            }
            document.getElementById("BtnSongHuo2").click();
        }
         function Save4()
        {
            var table = document.getElementById("tab");
            for (var i = 1; i < table.firstElementChild.childNodes.length; i++) {
                if (table.firstElementChild.childNodes[i].localName == "tr") {
                    if (i == UpdateRow)
                    {
                        table.firstElementChild.childNodes[i].cells[7].innerHTML=  $("#selectGYS22 option:selected").val();
                        table.firstElementChild.childNodes[i].cells[0].innerHTML= document.getElementById("BookMC2").value ;
                        table.firstElementChild.childNodes[i].cells[1].innerHTML=document.getElementById("authorName2").value ;
                        table.firstElementChild.childNodes[i].cells[2].innerHTML= document.getElementById("PressName2").value ;
                        table.firstElementChild.childNodes[i].cells[3].innerHTML=  document.getElementById("publicationDate2").value;
                        table.firstElementChild.childNodes[i].cells[4].innerHTML= document.getElementById("recordDate2").value;
                        table.firstElementChild.childNodes[i].cells[5].innerHTML= document.getElementById("location2").value;
                        table.firstElementChild.childNodes[i].cells[6].innerHTML= document.getElementById("price2").value;
                        
                        var scrname=document.getElementById("picture2").files[0].name;//.value
                        table.firstElementChild.childNodes[i].cells[9].innerHTML=scrname;
                      var sel = document.getElementById("selectGYS22");
                      var  Classid = sel.options[sel.selectedIndex].id;
                        table.firstElementChild.childNodes[i].cells[10].innerHTML=Classid;
                      table.firstElementChild.childNodes[i].cells[8].children[0].src=url;
                    }
                }
            }
        }
           function delect() {
            var table = document.getElementById("tab");
            table.deleteRow(delectRow);  //从table中删除  
        }
          var tableCell="";
        function SaveSu()
        {
       var tableObj = document.getElementById("tab");
            var length = tableObj.firstElementChild.childNodes.length;
          
            for (var i = 1; i < length; i++)
           {
             
                   if (tableObj.firstElementChild.childNodes[i].nodeName == "TR")
                {
                      for (var j = 0; j < tableObj.firstElementChild.childNodes[i].cells.length; j++)
                     {
                           if(tableObj.firstElementChild.childNodes[i].cells[j].innerText!="")
                           {
                             tableCell += tableObj.firstElementChild.childNodes[i].cells[j].innerHTML+","; 
                     
                           }
                           else
                           {
                          // tableCell+=  tableObj.firstElementChild.childNodes[i].cells[j].children[0].src+",";
                           }
                       }
                        tableCell += "/";
                } 
            }
      
       $.post("<%=request.getContextPath() %>/servlet/InsertBook", {aaa:tableCell}, function(data) {
		    	 window.location.reload();
		    });    
     }
       
  </script>
  </body>
 
  
</html>
