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
			<span class="title">提交信息</span>
		</li>

		<li data-step="2" class="active">
			<span class="step">2</span>
			<span class="title">审核中</span>
		</li>

		<li data-step="3" class="">
			<span class="step">3</span>
			<span class="title">完成审核</span>
		</li>
	</ul>
</div>
<div style="text-align:center">
	<div style="text-align:center" id="info">
		
	</div>
</div>
<script>
$(function(){ 
	var status = "${status}";

	//审核通过
	if(status==2){
		$("li[data-step='3']").attr("class","active");
		$("#info").html("<h3>当前状态:完成审核<br><br><br><br><br><br></h3><span>企业的注册信息已经完成审核。</span>")
	}else{
		$("#info").html("<h3>当前状态：审核中<br><br><br><br><br><br></h3><span>企业的注册信息正在审核中，请耐心等待...</span>")
	}
}); 
</script>
