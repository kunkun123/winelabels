<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>
<head>
	<meta charset="UTF-8">
    <title>system-Account</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="/static/styles/css/ace-fonts.css"/>
    <link rel="stylesheet" type="text/css" href="/static/styles/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="/static/styles/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/styles/css/bootstrap-table.css"/>
    <link rel="stylesheet" href="/static/scripts/gecko-modules/bootstrap/bootstrap-editable.css">
    <link rel="stylesheet" type="text/css" href="/static/styles/css/ace.css"/>
     <link rel="stylesheet" href="/static/styles/css/bootstrap-select.min.css" />
    <link rel="stylesheet" href="/static/styles/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/static/styles/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="/static/styles/css/jquery-ui.custom.min.css" />
	<link rel="stylesheet" href="/static/styles/css/chosen.min.css" />
	
	<!-- ace styles -->
		<link rel="stylesheet" href="/static/static/css/system/ace/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="/static/static/css/system/ace/ace-skins.min.css" />
		<link rel="stylesheet" href="/static/static/css/system/ace/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
	<script type="text/javascript" src="/static/scripts/gecko-modules/jquery/jquery-2.2.1.min.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="/static/scripts/gecko-modules/bootstrap/bootstrap-table.js"></script>
	<!-- ace scripts -->
	<script src="/static/scripts/gecko-modules/ace/ace-elements.min.js"></script>
	<script src="/static/scripts/gecko-modules/ace/ace.min.js"></script>
	<script type="text/javascript" src="/static/scripts/gecko-modules/bootstrap/bootstrap-table-zh-CN.js"></script>
	
	<script src="/static/scripts/gecko-modules/bootstrap/bootstrap-datepicker.js"></script>
   	<script src="/static/scripts/gecko-modules/bootstrap/bootstrap-select.min.js"></script>
		
<style>
.fixed-table-body {
    overflow-x: auto;
    overflow-y: auto;
    height: auto;
}
	body {
        background-color:white;
    }
.spinner {  
  width: 100px;  
}  
.spinner input {  
  text-align: right;  
}  
.input-group-btn-vertical {  
  position: relative;  
  white-space: nowrap;  
  width: 1%;  
  vertical-align: middle;  
  display: table-cell;  
}  
.input-group-btn-vertical > .btn {  
  display: block;  
  float: none;  
  width: 100%;  
  max-width: 100%;  
  padding: 4px;  
  margin-left: -1px;  
  position: relative;  
  border-radius: 0;  
}  
.input-group-btn-vertical > .btn:first-child {  
  border-top-right-radius: 4px;  
}  
.input-group-btn-vertical > .btn:last-child {  
  margin-top: -2px;  
  border-bottom-right-radius: 4px;  
}  
.input-group-btn-vertical i{  
  position: absolute;  
  top: 0;  
  left: 4px;  
}  
.fa-caret-up{
	margin-left: -2px;
}
.fa-caret-down{
	margin-left: -2px;
	margin-top: -3px;
}

</style>		
<title></title>
</head>
<body class="no-skin">
<!--顶部按钮-->
<div class="page-content">
<h3>生产采集</h3>

	
<form role="form" id="queryForm" action="/complaint/cpcomplaintsreport/complaintsList">
<button type="button" class="btn btn-sm btn-primary"  onclick="startCollection()">开始采集</button>
 <button type="button" class="btn btn-sm btn-light" onclick="clearInput()">重置</button>
               
<table class="" border="0">
 <tbody class="form-inline">  
 	<tr style="height:10px"></tr>
	<tr class="">
		<td class="" style="width:23%">
			<label class="bolder blue control-label"  for="form-field-1">当前采集商品：</label>
			<span id="currentProduct"></span>
		</td>
	</tr>
	<tr>
		<td class=" " style="width:23%">
			<label class="control-label bolder blue" for="form-field-1">商品包装规格：</label>
			<span id="currentProductSpec"></span>
		</td>
		<td class=" " style="width:18%">
        <label class="control-label bolder blue">批次号：</label>
      	 <input name="search" id="batchNum" style="width:60%" type="text" class="form-control"/>
		</td>
		<td class=" " style="width:18%">
        <label class="control-label bolder blue">流水号：</label>
      	 <input name="search" id="transaction" style="width:60%" type="text" class="form-control"/>
		</td>
		<td class=" " style="width:18%">
        <label class="control-label bolder blue">班次号：</label>
      	 <input name="search" id="class" style="width:60%" type="text" class="form-control"/>
		</td>
		<td class=" " style="width:18%">
        <label class="control-label bolder blue">车间号：</label>
      	 <input name="search" id="room" style="width:60%" type="text" class="form-control"/>
		</td>
	</tr>
	</tbody>
	</table>
</form>
<div style="float:left">
	</div>
	<div align="left">
	</div>
	<table id="collectionTaskList"></table>
	</div>
<!-- 添加生产任务Modal -->
<div class="modal fade role-modal" id="addTask" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">添加生产采集任务</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
					<form role="form" method="post" class="form-horizontal" action="/tax/alproduct/addTask">
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-4">
						      <input type="text" name="productname" class="form-control" id="firstname">
						    </div> 
						</div>
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">商品种类</label>
							<div class="col-sm-4">
						     <select class="col-sm-16" name="producttype">
						     	<option value="SPIRIT">白酒</option>
						     	<option value="BEER">啤酒</option>
						     	<option value="YELLOWWINE">黄酒</option>
						     	<option value="OTHER">其他酒</option>
						     </select>
						    </div> 
						</div>
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">采集方式</label>
							<label class="radio-inline">
					        <input type="radio" name="collectiontype" id="collectiontype" value="BOX" checked> 采集整箱
						    </label>
						    <label class="radio-inline ">
						        <input type="radio" name="collectiontype" id="collectiontype"  value="BOTTLE"> 采集单瓶
						    </label>
						</div>
						<div class="form-group container">
						<label for="name" class="col-sm-2 control-label">商品包装规格</label>
						<label for="name" class="col-sm-1 control-label">每箱</label>
							<div class="input-group spinner col-sm-4">  
							    <input type="text" class="form-control" id="spec" name="spec" value="1" READONLY>  
							    <div class="input-group-btn-vertical">  
							      <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>  
							      <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>  
							    </div>  
							    <label for="name" class="col-sm-1 control-label">瓶</label>
							</div>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</form>
				</div>
			<!--modal-footer部分-->
			<!-- <div class="modal-footer" style="text-align:center;">
			    <button type="button" class="btn btn-primary save" data-dismiss="modal">关闭</button>
			</div> -->
		</div>
	</div>
</div>
<!-- 修改生产任务Modal -->
<div class="modal fade role-modal" id="editTask" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">修改生产采集任务</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
					<form role="form" method="post" class="form-horizontal" action="/tax/alproduct/editTask">
					 <input type="hidden" name="id" class="form-control" id=productIdEdit>
						
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-4">
						      <input type="text" name="productname" class="form-control" id="productnameEdit">
						    </div> 
						</div>
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">商品种类</label>
							<div class="col-sm-4">
						     <select class="col-sm-16" name="producttype" id="producttypeEdit">
						     	<option value="SPIRIT">白酒</option>
						     	<option value="BEER">啤酒</option>
						     	<option value="YELLOWWINE">黄酒</option>
						     	<option value="OTHER">其他酒</option>
						     </select>
						    </div> 
						</div>
						<div class="form-group container">
							<label for="name" class="col-sm-2 control-label">采集方式</label>
							<label class="radio-inline">
					        <input type="radio" name="collectiontype" id="collectiontype" value="BOX" checked> 采集整箱
						    </label>
						    <label class="radio-inline ">
						        <input type="radio" name="collectiontype" id="collectiontype"  value="BOTTLE"> 采集单瓶
						    </label>
						</div>
						<div class="form-group container">
						<label for="name" class="col-sm-2 control-label">商品包装规格</label>
						<label for="name" class="col-sm-1 control-label">每箱</label>
							<div class="input-group spinner col-sm-4">  
							    <input type="text" class="form-control" id="spec" name="spec" value="1" READONLY>  
							    <div class="input-group-btn-vertical">  
							      <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>  
							      <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>  
							    </div> 
							    <label for="name" class="col-sm-1 control-label">瓶</label> 
							</div>
						
						</div>
						<div align="center">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</form>
				</div>
			<!--modal-footer部分-->
			<!-- <div class="modal-footer" style="text-align:center;">
			    <button type="button" class="btn btn-primary save" data-dismiss="modal">关闭</button>
			</div> -->
		</div>
	</div>
</div>
</body>
</html>
 
<script type="text/javascript">
var checkedIds = new Array();
$(function () {
	$('.spinner .btn:first-of-type').on('click', function() {  
		if(parseInt($('.spinner input').val(),10)<99){
			$('.spinner input').val(parseInt($('.spinner input').val(), 10) + 1);  
		}  
	});  
	$('.spinner .btn:last-of-type').on('click', function() {  
		if(parseInt($('.spinner input').val(),10)>1){
			$('.spinner input').val(parseInt($('.spinner input').val(), 10) - 1);  
		}  
	    //$('.spinner input').val(parseInt($('.spinner input').val(), 10) - 1);  
	});  
	$("#collectionTaskList").bootstrapTable({
                //toolbar: "#toolbar",
                idField: "id",
                pagination: true,
			    sidePagination: 'client',
			    pageNumber: 1,
			    pageSize: 5,
			    singleSelect:true,
			    pageList: [5, 10, 20],
                url: "/tax/alproduct/list",
                onCheck:function(row){
                 	$("#currentProduct").html(row.productname);
                 	$("#currentProductSpec").html(row.spec);
                 	//checkedIds.push(row.id);
				},
				onUncheck:function(row){
		         	//checkedIds.pop(row.id);
		        },
                columns: [  
               	[{
                    checkbox: true
                }, {
                    field: "id",
                    visible: false
                }, {  
			        field: 'Number',  
			        title: '序号',  
			        align: 'center',
			        formatter: function (value, row, index) {  
			        return index+1;  
			        }  
			    }  ,{
                    field: "productname",
                    title: "采集商品名称",
                    type: "text",
                    align: 'center',
                    search: "true",
                     sortable: true,
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp1",
                    title: "商品种类",
                    type: "text",
                    align: 'center',
                    search: "true",
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "spec",
                    title: "商品包装规格",
                    type: "text",
                    search: "true",
                    align: 'center',
                    editable: {
                        type: "text"
                    }
                },{
                    field: "createdate",
                    title: "创建时间",
                    type: "text",
                    search: "true",
                    align: 'center',
                    editable: {
                        type: "text"
                    }
                },{
                    field: "creator",
                    title: "创建用户",
                    type: "text",
                    search: "true",
                    align: 'center',
                    editable: {
                        type: "text"
                    }
                },{
                    field: 'operate',
                	title: '操作',
                	align: 'center',
                	width : 150,
                	//events: operateEvents,
                	formatter: operateFormatter
                }]]
            });
     	
});
	function operateFormatter(value, row, index) {
	 	var obj = JSON.stringify(row);
	 	var id = '"'+row.id+'"';
		return ["<button class='btn btn-link' onclick='edit("+obj+")' style='margin-right:10px;'>修改</button>"+
		"<button class='btn btn-link' onclick='del("+id+")' style='margin-right:10px;'>删除</button>"].join('');
	};
	function edit(obj){
		$("#productcodeEdit").val();
		$("#productnameEdit").val(obj.productname);
		//alert(obj.temp1);
		$("#producttypeEdit").val(obj.producttype);
		$("#input:radio[name=collectiontype][value='"+obj.collectiontype+"']")
		$("#productIdEdit").val(obj.id);
		$("#editTask").modal("show");	
	};
	function del(productId){
		var ids = new Array();
		ids[0] = productId;
		
		window.location.href="/tax/alproduct/delete?ids="+ids;
	};
	function clearInput(){
	document.getElementById("queryForm").reset();	
}
	function startCollection(){
			var row = $("#collectionTaskList").bootstrapTable('getSelections');
			var batchNum = $("#batchNum").val();
			var transaction = $("#transaction").val();
			var class1 = $("#class").val();
			var room = $("#room").val();
			window.location.href="/tax/alproduct/productCollection?row="
				+row[0].id+"&batchNum="+batchNum+"&transaction="+transaction+"&class1="+class1
				+"&room="+room;
			/* $.ajax({ 
			     url:'/tax/alproduct/productCollection', 
			     //data:JSON.stringify(checkedIds), 
			     contentType: "application/json;charset=utf-8",
			     type:'post', 
			     async:false,
			     success:function(res){ 
			      
			     } 
		     });  */
	}
</script>