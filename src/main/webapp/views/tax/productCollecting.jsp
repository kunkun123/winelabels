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
		
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-datepicker.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-datepicker-zhCN.js"></script>

<html>
<head>
</head>
<body>

		<style>
			body {
				background-color:white; 
			}
			.fixed-table-body {
    overflow-x: auto;
    overflow-y: auto;
    height: auto;
}
	body {
        background-color:white;
    }
		</style>



            <!--modal-body部分-->
            <div class="modal-body" style="height:35%;width:70%;overflow-x:visible ">
            	<form role="form" class="form-horizontal" style="width:120%;height:80%" id="enttypeFormDetail">
            				<div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">当前采集商品：</label>
						    <div class="col-sm-3">
						      <input style="border:none"  type="text"  class="form-control" id="productName" readonly/>
						       <input id="productId" type="hidden"  class="form-control" id="productId" readonly/>
						    	 <input  type="hidden"  class="form-control" id="productSpec" readonly/>
						    	 <input  type="hidden"  class="form-control" id="flagStatus" readonly/>
						    </div>
						    <div>
						    	
								<button onclick="selectTask();" class="btn btn-sm btn-primary"  type="button">选择任务</button>
						    </div>
						  	</div>
						 <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">商品种类：</label>
						    <div class="col-sm-3">
						      <input style="border:none"  type="text" value="${alProduct.productname}" class="form-control" id="productType" readonly/>
						    </div>
						  	</div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">商品包装规格：</label>
						    <div class="col-sm-3">
							    
							    	 <input style="border:none" type="text" value="" class="form-control" id="productNum" readonly/>
							    
						     </div>
						  </div>
						  <hr style="margin-left:0%;width: 50%">
						   <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">批次号：</label>
						    <div class="col-sm-3">
						      <input  type="text" value="${batchNum}" class="form-control" id="batchNum" />
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">生产线流水号：</label>
						    <div class="col-sm-3">
						      <input  type="text" value="${transaction}" class="form-control" id="transaction" />
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">班次号：</label>
						    <div class="col-sm-3">
						      <input  type="text" value="${class1}" class="form-control" id="class1" />
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">车间号：</label>
						    <div class="col-sm-3">
						      <input  type="text" value="${room}" class="form-control" id="room" />
						    </div>
						   </div>
						   </br></br></br>
						    <div id="startDiv" align="center" style="float:left;margin-left:40%">
								<button id="startButton" class="btn btn-primary" type="button" onclick="javascrit:swith();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">开始采集</button>
						     </div>
						     <div align="center" id="pauseDiv" style="display:none;float:left;margin-left:40%">
								<button id="pauseButton" class="btn btn-primary" type="button" onclick="javascrit:swith();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">暂停采集</button>
						     </div>
						     <div align="center" style="float:left;margin-left:5%">
								<button id="stopButton" class="btn btn-primary" type="button" onclick="stop();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">停止采集</button>
						     </div>
						     </form>
						  </div>
	              
	                <div style="margin-left:45%;margin-top:-16%;width:50%;height:58%" id="infoDiv">
	                	<!-- 
					  --></div>
				
				</div>
	           
   				
   				
<!-- 选择生产任务Modal -->
<div class="modal fade role-modal" id="selectTask" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">选择生产采集任务</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
				<table id="collectionTaskList"></table>	
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
var status = "stop";
$(function () {
	$("#infoDiv").html('<iframe src="/views/tax/productCollectingWebsocketShow.jsp" width="100%" height="103%"/>');
		
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
                clickToSelect:true,
                onCheck:function(row){
                	
			    	$("#selectTask").modal("hide");
			    	$("#productName").val(row.productname);
			    	$("#productType").val(row.temp1);
			    	$("#productNum").val("每箱"+row.spec+"瓶（箱标×1，瓶标×"+row.spec+"）");
			    	$("#productSpec").val(row.spec);
			    	$("#productId").val(row.id);
				},
                columns: [  
               	[{
                    field: "id",
                    visible: false
                },{
                    checkbox: true
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
                }]]
            });
     	
});
	
	function selectTask(){
		$("#selectTask").modal("show");
	}
	function swith(){
	
		if("stop"==status){
			$("#startDiv").hide();
			$("#pauseDiv").show();
			$("#flagStatus").val("start");
			status="start";
			document.getElementById("batchNum").setAttribute("readOnly",'true');
			document.getElementById("transaction").setAttribute("readOnly",'true');
			document.getElementById("class1").setAttribute("readOnly",'true');
			document.getElementById("room").setAttribute("readOnly",'true');
			
			
		}else if("start"==status){
			$("#startDiv").show();
			$("#pauseDiv").hide();
			$("#flagStatus").val("stop");
			status="stop";
			document.getElementById("batchNum").removeAttribute("readOnly");
			document.getElementById("transaction").removeAttribute("readOnly");
			document.getElementById("class1").removeAttribute("readOnly");
			document.getElementById("room").removeAttribute("readOnly");
			
		}
	}
	function stop(){
		window.location.href="/tax/alproduct/stopCollection";
	}
</script>