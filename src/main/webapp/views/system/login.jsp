<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
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

    <script type="text/javascript">
        $(function () {
            // 背景及登录框自适应
            if (window !== top) {
                top.location.href = location.href;
            }
            var loginBgWidth = 631;
            var loginBgHeight = 434;
            window.onresize = window.onload = function () {
                var w, h;
                if (!!(window.attachEvent && !window.opera)) {
                    h = document.documentElement.clientHeight;
                    w = document.documentElement.clientWidth;
                } else {
                    h = window.innerHeight;
                    w = window.innerWidth;
                }
                var bgImg = $('#bg');
                bgImg.width(w);
                bgImg.height(h);

                var offsetTop = (h - loginBgHeight) / 2;
                var offsetLeft = (w - loginBgWidth) / 2;

                if (offsetTop < 0) {
                    offsetTop = 0;
                }
                if (offsetLeft < 0) {
                    offsetLeft = 0;
                }
                $('#loginForm').offset({
                    top: offsetTop + 100,
                    left: offsetLeft + 335
                });
                $('#loginBg').offset({
                    top: offsetTop - 20,
                    left: offsetLeft - 50
                });

                $('body').show();
            };
            $('#principal').focus();
        });
    </script>
    <style type="text/css">
        html, body {
            background: transparent;
        }
    </style>
</head>
<body style="display: none; overflow: hidden;">
<div style="top: 0px; left: 0px; position: absolute; z-index: -2;">
    <img id="bg" src="../../static/static/login/u0.jpeg">
</div>


<div id="loginForm" class="login-tap">
    <div class="tabbable">
		<div class="tab-content account-form">
            <div id="home" class="tab-pane fade in active menu-control ">
                <form action="/login" method="post">
                    <label class="block clearfix input">
							<span class="block input-icon input-icon-right">
								<input name="principal" class="form-control" placeholder="请输入账户">
								<i class="ace-icon fa fa-user"></i>
							</span>
                    </label>
                   <!--  <label class="block clearfix input" style="display:none;"/>
							<span class="block input-icon input-icon-right"> -->
								<input type="hidden" name="credential" value="123456" class="form-control" placeholder="请输入密码">
							<!-- 	<i class="ace-icon fa fa-lock"></i>
							</span>
                    </label> -->
                    <%-- <span><font color="red">${msg}</font></span> --%>
                    <button id="btnLogin" class="btn-login input">证书登录</button> 
                </form>
                 <div style="float:right">
             		<a style="cursor:pointer;" data-toggle="modal" data-target="#myModalRegister">企业注册</a>
           		 </div>
           		 <br>
           		 <br>
	            <div>
	                <span>
	                		如果您已注册，请插入申领的证书Key，然后使用"证书登录"。<br>
							如果您未注册，请先注册企业，并申领证书Key。
	                </span>
	            </div>
	            <br>
	            <br>
	             <div style="float:left;">
             		<a style="cursor:pointer;">防伪查验</a>
           		 </div>
           		 <div style="float:right">
             		<a style="cursor:pointer;">使用帮助</a>
           		 </div>
           		  <div style="float:right">
             		<a style="cursor:pointer;">软件下载 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		 </div>
           		  
            </div>
            
            <div id="messages" class="tab-pane fade code">
                <img src="../../static/static/login/timg1.png"/>
			</div>
        </div>
    </div>
</div>
<!-- 企业注册Modal -->
<div class="modal fade role-modal" id="myModalRegister" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
	<div class="modal-dialog" role="document" style="width:898px;height:492px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                        aria-hidden="true">&times;</span></button>
			    <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">企业注册</span>
			</div>
			<!--modal-body部分-->
			<div class="modal-body" id="notice">
			    <iframe frameborder="0" height="460px" width="880px" src="/views/system/register/register1.jsp"></iframe>            
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