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

		<li data-step="3" class="active">
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
			<h3>3.填写联系方式</h3>
			<span>填写联系方式，用于主管部门联系证书、设备领取等相关事宜：</span> 
		</div>
		<div style="margin-top:5%">
		<form action="/register/registerSubmit" style="margin-top:2%;" class="form-inline" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<label><span class="lbl">联系人：</span></label>
					</td>
					<td>
						<input name="contacts" class="ace" type="text"> 
					</td>
					<td>
						<label><span class="lbl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话：</span></label>
					</td>
					<td>
						<input name="contactphone" class="ace" type="text"> 
					</td>
					<td>
						<label><span class="lbl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮件地址：</span></label>
					</td>
					<td>
						<input name="email" class="ace" type="text"> 
					</td>
				</tr>
			</table>
		</form>
		</div>
											
											<div class="wizard-actions" style="margin-top:23%;">
											<hr/>
												<button onclick="history.back(-1)" class="btn btn-success btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													上一步
												</button>

												<button  onclick="submit();" class="btn btn-success btn-next" data-last="Finish">
													下一步
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
<script>
$(function(){
				
});
function submit(){
	$("form").submit();
}
</script>