
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
		</style>


<script type="text/javascript">
var option = "";
function startCollection(){
			$("#startDiv").hide();
			$("#endDiv").show();
	$("#serial").focus();
	var ent =  $("#belowent1").find("option:selected").text();
	option = $("#belowent1").html();
	$("#switch").html(' <input style="border:none" id="belowent1" type="text" value="'+ent+'" class="form-control" readonly/>');
}
function stopCollection(){
			$("#startDiv").show();
			$("#endDiv").hide();
	$("#switch").html('<select id="belowent1" style="btn-success" class="selectpicker" data-size="6" data-live-search="true">'
	+option+'</select>');

	
	$(".selectpicker").selectpicker({  
            noneSelectedText : '请选择'//默认显示内容  
    });  
    $('.selectpicker').selectpicker('setStyle', 'btn-primary');
}
function stop(){
		window.location.href="/tax/alcirculation/sellCollectionResultView";
}
$(function () {
		/**
		*查询销售企业
		**/
		$.ajax({
			url : "/ent/ententbasic/businessEntList",
			type : "POST", //盟市编号
			success : function(data) {
				$.each(data, function(i, item) {
				
					$("#belowent1").append("<option value='" + item.id + "'>" + item.entname + "</option>");
				});
			}
		});
	});
	 $('.selectpicker').selectpicker('setStyle', 'btn-primary');
</script>
            
            <div class="modal-body" style="height:35%;width:70%;overflow-x:visible ">
            	<form role="form" class="form-horizontal" style="width:120%;height:80%" id="enttypeFormDetail">
            				<div class="form-group">
						    <%-- <label for="firstname" class="col-sm-2 control-label">销售企业:</label>
						    <div class="col-sm-3">
						      <input type="text" value="${alProduct.productname}" class="form-control" name="creditcode1" readonly/>
						       <input id="productId" type="hidden" value="${alProduct.id}" class="form-control" name="creditcode1" readonly/>
						    	 <input id="spec" type="hidden" value="${alProduct.spec}" class="form-control" name="creditcode1" readonly/>
						    
						    </div>
						    <div class="col-sm-1">
						      	<button class="btn-xs btn-info" type="button" onclick="javascrit:window.location.href='/tax/alproduct/stopCollection'"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">选择</button>
						    </div> --%>
						     <div class="form-group">
						   
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						    <label class=" col-sm-2 control-label"  for="form-field-1">销售企业：</label>
						     <div class="col-sm-3" id="switch">
								<select id="belowent1" class="selectpicker" data-size="6" data-live-search="true"></select>
							</div>
						  	</div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">扫描编码：</label>
						    <div class="col-sm-3">
						      <input type="text" class="form-control" id="serial" name="serial"/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label"></label>
						    <div class="col-sm-3">
						      <input type="hidden" readonly/>
						    </div>
						  </div>
						  
						   		<div id="startDiv" style="float:left;margin-left:14%">
								<button class="btn btn-primary" type="button" onclick="javascrit:startCollection();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">开始采集</button>
						     	</div>	
						     	<div id="endDiv" style="display:none;float:left;margin-left:14%">
								<button class="btn btn-primary" type="button" onclick="javascrit:stopCollection();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">暂停采集</button>
						    	</div>
						   		 <div style="float:left;margin-left:5%">
								<button id="stopButton" class="btn btn-primary" type="button" onclick="stop();"  style="border-bottom-right-radius:8px;border-bottom-left-radius:8px;border-top-right-radius:8px;border-top-left-radius:8px;">停止采集</button>
						        </div>
						    
						    
						  <%-- <hr style="margin-left:0%;width: 50%">
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">当前采集酒标</label>
						    <div class="col-sm-3">
						      <input type="text" value="${entBasic.tel}" class="form-control" name="tel" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">识读总数：</label>
						    <div class="col-sm-3">
						      <input type="text" value="${entBasic.bank}" class="form-control" name="bank" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">识读成功数：</label>
						    <div class="col-sm-3">
						      <input type="text" value="${entBasic.acct}" class="form-control" name="acct" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">识读失败数：</label>
						    <div class="col-sm-3">
						      <input type="text" value="${entBasic.acct}" class="form-control" name="acct" readonly/>
						    </div>
						   </div>
						   </br></br></br>
						    <div align="center">
								   </div> --%>
						     </form>
						  </div>
	              
	                <div style="margin-left:45%;margin-top:-16%;width:50%;height:58%" id="licenseattachDiv">
	                	<iframe src="/views/tax/sellCollectingShow.jsp" width="100%" height="103%"/>
					</div>
				
				</div>
           
   				

</body>
</html>








