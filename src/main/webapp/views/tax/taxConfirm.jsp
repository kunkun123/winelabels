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
		
<title></title>
</head>
<style>
.fixed-table-body {
    overflow-x: auto;
    overflow-y: auto;
    height: auto;
}
body {
        background-color:white;
    }
</style>
 <script type="text/javascript">  
        $(window).on('load', function () {  
  			$('.selectpicker').selectpicker({  
                width:'300px'
            });
            $('.selectpicker').selectpicker('setStyle', 'btn-white');
            if(!ace.vars['old_ie']) $(".datepicker").datepicker({
				 //format: 'YYYY/MM/DD h:mm:ss A',//use this option to display seconds
				 	format: 'yyyy-MM-dd',  
		        	language: 'cn',  
		        	pickDate: true,  
		        	pickTime: true,  
		       		hourStep: 1,  
		       		todayBtn : true,
		        	minuteStep: 1,  
		        	secondStep: 30,  
		        	inputMask: true  
				});
  		});  
</script>  
<body class="no-skin">
<!--顶部按钮-->
<div class="page-content">
<h3>应税确认</h3>

<br>

				<form role="form" method="post" id="queryForm" class="form-inline">
				<button type="button" onclick="query();" class="btn btn-sm btn-primary">查询</button>
				 <!-- <button type="button" class="btn btn-sm btn-light" onclick="clearInput()">重置</button>
                -->
						<table class="">
                    		<tr style="height:10px"></tr>
                        <tr class="">
                            <td align="center" class=" " style="width:19%">
								<label for="name" class="bolder control-label blue">酒标编码:</label>
								<input style="width:70%" type="text" name="winelabelCode" class="form-control" id="winelabelCode">
                           </td><td align="center" class=" " style="width:19%">
							    <label for="name" class=" bolder control-label blue">&nbsp;&nbsp;商品名称:</label>
								<input style="width:70%" type="text" name="productname" class="form-control" id="productname">
							</td><td align="center" class=" " style="width:11%">
								<label for="name" class="bolder blue control-label">&nbsp;&nbsp;酒标类型:</label>
								<select class="" name="producttype" id="winelabeltype">
									<option value="">不限</option>
							     	<option value="BOX">箱标</option>
							     	<option value="BOTTLE">瓶标</option>
							     </select>
							  </td><td align="center" class="" style="width:11%">
								<label for="name" class="bolder blue control-label">&nbsp;&nbsp;商品种类:</label>
								<select class="" name="producttype" id="producttype">
							     	<option value="">不限</option>
							     	<option value="SPIRIT">白酒</option>
							     	<option value="BEER">啤酒</option>
							     	<option value="YELLOE">黄酒</option>
							     	<option value="OTHERS">其他</option>
							     </select>
							   </td><td align="center" class=" " style="width:25%">
								<label class="blue control-label bolder"  for="name">
								采集时间:</label>
								<input style="width:35%" type="text" name="productname" class="form-control datepicker" id="startDate">
							
								<label class="control-label"  for="name">--</label>
								<input type="text" style="width:35%" name="productname" class="form-control datepicker" id="endDate">
							   </td>
							</tr>
							<tr style="height:10px"></tr>
							</table>
						
						
						<table id="collectionHistoryList"></table>
						
</div>
<!-- 查看酒标信息 -->
<div class="modal fade role-modal" id="winelabelDetails" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">查看酒标详细信息</span>
			</div>
			<!--modal-body部分-->
				<div class="modal-body" id="notice">
					<form role="form" method="post" class="form-horizontal">
						<div class="form-group" style="margin-bottom:6%">
							<label for="name" class="control-label col-sm-2">酒标编码</label> 
							<div class="col-sm-4">
								<span name="winelabelCode" class="form-control" id="detailsSerial"></span>
							</div>
							<label for="name" class="control-label col-sm-2">对应商品</label> 
							<div class="col-sm-4">
								<span name="winelabelCode" class="form-control" id="detailsProduct"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="control-label col-sm-2">酒标类型</label> 
							<div class="col-sm-4">
								<span name="winelabelCode" class="form-control" id="detailsWineLabelsType"></span>
							</div>
							<label for="name" class="control-label col-sm-2">商品种类</label> 
							<div class="col-sm-4">
								<span name="winelabelCode" class="form-control" id="detailsProductType"></span>
							</div>
						</div>
						<div class="form-group"  style="margin-top:12%">
							<label class="col-sm-2 control-label" for="name">状态</label> 
							<div class="col-sm-4">
								<span name="winelabelCode" class="form-control" id="detailsStatus"></span>
							</div>
						</div>
					</form>
					
					<div class="form-group" style="margin-top:16.5%">
					
						<span name="winelabelCode" class="" id="info"></span>
					</div>
					<table id="winelabelsDetail"></table>
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
$(function () {
     $("#collectionHistoryList").bootstrapTable({
                idField: "id",
                pagination: true,
			    sidePagination: 'client',
			    pageNumber: 1,
			    pageSize: 5,
                url: "/tax/alcirculation/taxConfirmList",
                queryParams:queryparam1,
			    pageList: [5, 10, 20],
			    onCheck:function(row){
			    	//酒标类型
			    	var type = row.temp2;
			    	//假设是箱标，日后再改
			    	if(type=="箱子"){
			    		for(var i=Number(row.temp1)+1;i<Number(row.temp1)+5;i++){
			    			$("tr:contains("+i+")").hide();
			    		}
			    	}
				},
				 onUncheck:function(row){
		         	//酒标类型
			    	var type = row.temp2;
			    	//假设是箱标，日后再改
			    	if(type=="箱子"){
			    		for(var i=Number(row.temp1)+1;i<Number(row.temp1)+5;i++){
			    			$("tr:contains("+i+")").show();
			    		}
			    	}
		        },
                columns: [  
               	[{
                    checkbox: true
                },{
                    field: "id",
                    visible: false
                },{  
			        field: 'Number',  
			        title: '序号',  align: 'center',
			        formatter: function (value, row, index) {  
			        return index+1;  
			        }  
			    },{
                    field: "temp1",
                    title: "酒标编码",
                    type: "text",
                    search: "true",align: 'center',
                    sortable: true,
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp2",
                    title: "酒标类型",
                    type: "text",align: 'center',
                    search: "true",
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp3",
                    title: "对应商品",align: 'center',
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "temp4",
                    title: "商品种类",align: 'center',
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "starttime",
                    title: "销售采集时间",
                    type: "text",align: 'center',
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: 'operate',
                	title: '操作',align: 'center',
                	align: 'center',
                	formatter: operateFormatter
                }]]
            });  
});
	function operateFormatter(value, row, index) {
	 	var obj = JSON.stringify(row);
	 	if("箱标"==row.temp2){
	 		return ["<button type='button' class='btn btn-link' onclick='javascript:view("+obj+");' style='margin-right:15px;'>查看酒标信息</button>"
			+"<button type='button' class='btn btn-link' onclick='javascript:confirm("+obj+");' style='margin-right:15px;'>整箱确认</button>"
			+"<button type='button' class='btn btn-link' onclick='javascript:cancel("+obj+");' style='margin-right:15px;'>整箱退回</button>"].join('');
	 	}else if("瓶标"==row.temp2){
	 		return ["<button type='button' class='btn btn-link' onclick='javascript:view("+obj+");' style='margin-right:15px;'>查看酒标信息</button>"
			+"<button type='button' class='btn btn-link' onclick='javascript:confirm("+obj+");' style='margin-right:15px;'>确认</button>"
			+"<button type='button' class='btn btn-link' onclick='javascript:cancel("+obj+");' style='margin-right:15px;'>退回</button>"].join('');
	 	}
	};
	function queryparam1(params){
		var param = {
			taxConfirm : "true",
			winelabelCode : $("#winelabelCode").val(),
			productname : $("#productname").val(),
			winelabeltype : $("#winelabeltype").val(),
			producttype : $("#producttype").val(),
			belowent : $("#belowent").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val()
		}
		return param;
	};
	function query(){
		$("#collectionHistoryList").bootstrapTable('refresh');  
	};
	function view(obj){
		$("#winelabelsDetail").bootstrapTable('destroy'); 
	    var id = obj.temp1;
		$("#winelabelsDetail").bootstrapTable({
                idField: "id",
                pagination: true,
			    sidePagination: 'client',
			    pageNumber: 1,
			    pageSize: 5,
			    queryParams:{winelabelId:id},
                url: "/wineLabels/alalcohollable/wineLabelsDetail",
			    pageList: [5, 10, 20],
                columns: [  
               	[{
                    field: "id",
                    visible: false
                },{  
			        field: 'Number',  align: 'center',
			        title: '序号',  
			        formatter: function (value, row, index) {  
			        return index+1;  
			        }  
			    },{
                    field: "serial",
                    title: "酒标编码",align: 'center',
                    type: "text",
                    search: "true",
                    sortable: true,
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp2",align: 'center',
                    title: "状态",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                }]]
            });  
        if("箱标"==obj.temp2){
        	$("#info").html("包含的瓶标如下：");
        }else if("瓶标"==obj.temp2){
        	$("#info").html("所属的箱标如下：");
        }
        $("#detailsSerial").html(obj.temp1);
        $("#detailsProduct").html(obj.temp3);
        $("#detailsWineLabelsType").html(obj.temp2);
        $("#detailsProductType").html(obj.temp4); 
        $("#detailsStatus").html(obj.productnum);
		$("#winelabelDetails").modal("show");
	}
	function confirm(obj){
		alert("应税确认成功！");
		window.location.href="/tax/alcirculation/taxConfirm?winelabelId="+obj.temp1+"&&type=confirm";
	}
	function cancel(obj){
		window.location.href="/tax/alcirculation/taxConfirm?winelabelId="+obj.temp1+"&&type=cancel";
	}
	function clearInput(){
	document.getElementById("queryForm").reset();	
}
</script>