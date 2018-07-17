<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <base href="<%=pageContext.getServletContext().getContextPath()%>/"/>
    <!--<link rel="shortcut icon" type="image/x-icon" href='./papilio/img/sys/papilio.ico' />-->
    <title>酒类产品税收信息化管理系统</title>
    <link rel="stylesheet" type="text/css" href="../../static/static/login/login.css">
    <link rel="stylesheet" type="text/css" href="../../static/styles/css/ace-fonts.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/styles/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/styles/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/styles/css/ace.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/styles/gecko.css"/>
    <script type="text/javascript" src="../../static/scripts/gecko-modules/jquery/jquery.js"></script>
    <script type="text/javascript" src="../../static/scripts/gecko-modules/jquery/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" src="../../static/scripts/gecko-modules/bootstrap/bootstrap.min.js"></script>
 	<!-- ace scripts -->
	<script src="../../static/scripts/gecko-modules/ace/ace-elements.min.js"></script>
	<script src="../../static/scripts/gecko-modules/ace/ace.min.js"></script>
</head>
<style>
 			.avatar {  
                display: block;  
                width: 300px;  
                margin: 0 auto;  
                overflow: hidden;  
            }  
             .avatar img {  
                display: block;  
                border: 0;  
                width: 100%;  
                transform: scale(1);  
                transition: all 1s ease 0s;  
                -webkit-transform: scale(1);  
                -webkit-transform: all 1s ease 0s;  
            }  
             .avatar:hover img {  
                transform: scale(1.3);  
                transition: all 1s ease 0s;  
                -webkit-transform: scale(1.3);  
                -webkit-transform: all 1s ease 0s;  
            } 
</style>
<div style="margin-left:5%;">
	<ul class="steps">
		<li data-step="1" class="active">
			<span class="step">1</span>
			<span class="title">上传营业执照</span>
		</li>

		<li data-step="2" class="active">
			<span class="step">2</span>
			<span class="title">选择企业类型</span>
		</li>

		<li data-step="3">
			<span class="step">3</span>
			<span class="title">填写联系方式</span>
		</li>

		<li data-step="4">
			<span class="step">4</span>
			<span class="title">注册完成</span>
		</li>
	</ul>
</div>
	<div style="float:left;margin-left:10%;width:90%;height:90%;">
		<div>
			<h3>2.选择企业类型</h3>
			<span>选择注册的企业类型，并上传相应资格的许可证：</span> 
		</div>
		<form action="/register/registerSubmit2" style="margin-top:2%;" class="form-inline" method="post" enctype="multipart/form-data">
		<div style="float:left" align="center" class="checkbox form-group col-xs-3">
		<label>
		<input name="producepermission" class="ace" type="checkbox"> <span class="lbl">生产加工企业</span>
		</label>
			<div style="width:180px;height:220px;display:none">
			<input multiple="" name="uploadFileProduce" id="uploadFileProduce" type="file">
			</div>
		</div>
		<div style="float:left" align="center" class="checkbox form-group col-xs-3">
			<label> <input name="importpermission" class="ace" type="checkbox"> <span  class="lbl">进口企业</span>
			</label>
			<div style="width:180px;height:220px;display:none">
			<input multiple="" name="uploadFileImport" id="uploadFileImport" type="file">
			</div>
		</div>
		<div style="float:left;" align="center" class="checkbox form-group col-xs-3">
			<label> <input name="businesspermission" class="ace" type="checkbox"> <span  class="lbl">经销企业</span>
			</label>
			<div style="width:180px;height:220px;display:none">
			<input multiple="" name="uploadFileBusiness" id="uploadFileBusiness" type="file">
			</div>
		</div>
		<div style="float:left;" align="center" class="checkbox form-group col-xs-3">
			<label> <input name="sellpermission" class="ace"
				type="checkbox"> <span  class="lbl">零售企业</span>
			</label>
			<div style="width:180px;height:220px;display:none">
			<input multiple="" name="uploadFileSell" id="uploadFileSell" type="file">
			</div>
		</div>
		</form>
											<hr />
											<div class="wizard-actions" style="margin-top:33%;">
												<button onclick="history.back(-1);" class="btn btn-success btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													上一步
												</button>
												<button  onclick="submit();" class="btn btn-success btn-next" data-last="Finish">
													下一步
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div><script>
$(function(){
				$(".ace").change(function(){
					if($(this).is(':checked')){
						$(this).parent().siblings().show();
					}else{
						$(this).parent().siblings().hide();
					}
				});
				$('#uploadFileProduce').ace_file_input({
					style: 'well',
					btn_choose: '生产加工许可证',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'large'//large | fit
					
					,
					preview_error : function(filename, error_code) {
						
					}
			
				}).on('change', function(){
					//$(".avatar").attr("href",$(""));
				});
				$('#uploadFileImport').ace_file_input({
					style: 'well',
					btn_choose: '进口企业许可证',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'large'//large | fit
					
					,
					preview_error : function(filename, error_code) {
						
					}
			
				}).on('change', function(){
					//$(".avatar").attr("href",$(""));
				});
				$('#uploadFileBusiness').ace_file_input({
					style: 'well',
					btn_choose: '经销企业许可证',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'large'//large | fit
					
					,
					preview_error : function(filename, error_code) {
						
					}
			
				}).on('change', function(){
					//$(".avatar").attr("href",$(""));
				});
				$('#uploadFileSell').ace_file_input({
					style: 'well',
					btn_choose: '零售企业许可证',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'large'//large | fit
					
					,
					preview_error : function(filename, error_code) {
						
					}
			
				}).on('change', function(){
					//$(".avatar").attr("href",$(""));
				});
});
function submit(){
	$("form").submit();
}
</script>