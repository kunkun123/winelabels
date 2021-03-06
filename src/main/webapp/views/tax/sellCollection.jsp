<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>
<head>
	<meta charset="UTF-8">
    <title>system-Account</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
.input-group-btn-vertical > .btn:first-child {  
  border-top-right-radius: 4px;  
}  
.input-group-btn-vertical > .btn:last-child {  
  margin-top: -2px;  
  border-bottom-right-radius: 4px;  
}  
</style>		
<title></title>
</head>
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
<h3>销售采集</h3>
<br>
<form role="form" id="queryForm">
	<table class="" border="0">
	 <tbody class="form-inline">  
		<tr class="">
			<td class="" style="width:34%">
				<label class=" blue control-label"  for="form-field-1">销售下游企业：</label>
				<select id="belowent1" class="selectpicker" data-size="6" data-live-search="true"></select>
			</td>
			
			<td class="" style="width:34%">
				<button class="btn btn-primary" type="button" onclick="javascript:saleCollection();">开始采集</button>
			</td>
		</tr>
	 </tbody>
	</table>
</form>
<div style="float:right">
	<button class="btn btn-mini btn-primary" style="border-top-right-radius:4px;border-bottom-right-radius:4px;border-bottom-left-radius:4px;
	border-top-left-radius:4px;" onclick="view1();">搜素销售采集历史信息</button>
</div>
	<table id="collectionTaskList"></table>
</div>
<!-- 添加生产任务Modal -->
<div class="modal fade role-modal" id="hisTask" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">搜索销售采集历史信息</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
				<form role="form" method="post" class="form-inline">
						<div class="form-group">
								<label for="name" class="control-label">酒标编码</label>
								<input type="text" name="winelabelCode" class="form-control" id="winelabelCode">
							 </div>
							 <div class="form-group">
							    <label for="name" class=" control-label">&nbsp;&nbsp;&nbsp;&nbsp;对应商品</label>
								<input type="text" name="productname" class="form-control" id="productname">
							 </div>
							 <div class="form-group">
								<label for="name" class=" control-label">&nbsp;&nbsp;&nbsp;&nbsp;酒标类型</label>
								<select class="" name="producttype" id="winelabeltype">
							     	<option value="SPIRIT">白酒</option>
							     	<option value="BEER">啤酒</option>
							     	<option value="YELLOWWINE">黄酒</option>
							     	<option value="OTHER">其他酒</option>
							     </select>
							 </div>
							 <div class="form-group">
								<label for="name" class=" control-label">&nbsp;&nbsp;&nbsp;&nbsp;商品种类</label>
								<select class="" name="producttype" id="producttype">
							     	<option value="SPIRIT">白酒</option>
							     	<option value="BEER">啤酒</option>
							     	<option value="YELLOWWINE">黄酒</option>
							     	<option value="OTHER">其他酒</option>
							     </select>
							 </div>
							 <div class="form-group">
								<label class=" control-label"  for="name">下游企业</label>
								<select class="selectpicker" id="belowent" data-size="6" data-live-search="true"></select>
							 </div>
							 <div class="form-group">
								<label class=" control-label"  for="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;采集时间&nbsp;&nbsp;&nbsp;&nbsp;从</label>
								<input type="text" name="productname" class="form-control datepicker" id="startDate">
							 </div>
							  <div class="form-group">
								<label class=" control-label"  for="name">&nbsp;&nbsp;&nbsp;&nbsp;到</label>
								<input type="text" name="productname" class="form-control datepicker" id="endDate">
							  </div>
							  <div align="center" style="margin-left:90%;margin-top:-7%;">
								<button type="button" onclick="query();" class="btn btn-default">提交</button>
							  </div>
						</form>
						<br>
						<table id="collectionHistoryList"></table>
				</div>
			<!--modal-footer部分-->
			<!-- <div class="modal-footer" style="text-align:center;">
			    <button type="button" class="btn btn-primary save" data-dismiss="modal">关闭</button>
			</div> -->
		</div>
	</div>
</div>
<!-- 模拟销售采集扫描条形码 -->
<div class="modal fade role-modal" id="saleCollection" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">模拟销售采集扫描条形码</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
				<form role="form" method="post" class="form-inline" action="/tax/alcirculation/saleCollection">
					<div class="form-group">
								<label class=" control-label"  for="name">请输入酒标号：</label>
								<input type="text" name="winelabels" class="form-control" id="winelabels">
							
								<label class=" blue control-label"  for="form-field-1">销售下游企业：</label>
								<select id="belowEntId2" name="belowEntId2" class="selectpicker" data-size="6" data-live-search="true"></select>
			
					</div>
							  <div align="center" style="margin-left:90%;margin-top:-7%;">
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
$(function () {
	$("#collectionTaskList").bootstrapTable({
                //toolbar: "#toolbar",
                idField: "id",
                pagination: true,
			    sidePagination: 'client',
			    pageNumber: 1,
			    pageSize: 5,
			    singleSelect:true,
			    pageList: [5, 10, 20],
                url: "/tax/alcirculation/saleLinkList",
                columns: [  
               	[{
                    field: "id",
                    visible: false
                }, {  
			        field: 'Number',  
			        title: '序号',  
			        formatter: function (value, row, index) {  
			        return index+1;  
			        }  
			    }  ,{
                    field: "belowentid",
                    title: "下游企业",
                    type: "text",
                    search: "true",
                     sortable: true,
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "productnum",
                    title: "采集数量",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "starttime",
                    title: "开始采集时间",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "endtime",
                    title: "结束采集时间",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: 'operate',
                	title: '操作',
                	align: 'center',
                	width : 100,
                	//events: operateEvents,
                	formatter: operateFormatter
                }]]
            });
            $("#collectionHistoryList").bootstrapTable({
                //toolbar: "#toolbar",
                idField: "id",
                pagination: true,
			    sidePagination: 'client',
			    pageNumber: 1,
			    pageSize: 5,
			    singleSelect:true,
			    pageList: [5, 10, 20],
                url: "/tax/alcirculation/hisCollectionList",
                queryParams:queryparam1,
                columns: [  
               	[{
                    field: "id",
                    visible: false
                },{  
			        field: 'Number',  
			        title: '序号',  
			        formatter: function (value, row, index) {  
			        return index+1;  
			        }  
			    },{
                    field: "temp1",
                    title: "酒标编码",
                    type: "text",
                    search: "true",
                     sortable: true,
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp2",
                    title: "酒标类型",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                }, {
                    field: "temp3",
                    title: "对应商品",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "temp4",
                    title: "商品种类",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "belowentid",
                    title: "下游企业",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: "starttime",
                    title: "销售采集时间",
                    type: "text",
                    search: "true",
                    editable: {
                        type: "text"
                    }
                },{
                    field: 'operate',
                	title: '操作',
                	align: 'center',
                	width : 100,
                	//events: operateEvents,
                	formatter: operateFormatter
                }]]
            });  
		/**
		*查询销售企业
		**/
		$.ajax({
			url : "/ent/ententbasic/businessEntList",
			type : "POST", //盟市编号
			success : function(data) {
				$.each(data, function(i, item) {
					$("#belowent").append("<option value='" + item.id + "'>" + item.entname + "</option>");
					$("#belowent1").append("<option value='" + item.id + "'>" + item.entname + "</option>");
					$("#belowEntId2").append("<option value='" + item.id + "'>" + item.entname + "</option>");
				});
			}
		});
	});
	function operateFormatter(value, row, index) {
	 	var obj = JSON.stringify(row);
		return ["<a onclick='javascript:view2("+obj+");' style='margin-right:15px;'>查看采集历史信息</a>"].join('');
	};
	function queryparam1(params){
		var param = {
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
	function view2(obj){
		$("#belowent").val(obj.temp1);
		$("#collectionHistoryList").bootstrapTable('refresh');  
		$("#hisTask").modal("show");	
	}
	function view1(){
		$("#belowent").val("");
		$("#collectionHistoryList").bootstrapTable('refresh');  
		$("#hisTask").modal("show");	
	}
	function saleCollection(){
		$("#saleCollection").modal("show");	
	}
</script>