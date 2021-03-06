<%@ page import="org.gecko.common.utils.GeckoProperties"%>
<%@ page import="org.gecko.framework.system.entity.Account"%>
<%@ page import="org.gecko.framework.system.entity.Resource"%>
<%@ page import="org.gecko.framework.system.entity.Role"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%
    Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
    List<Role> roleList = (List<Role>) request.getAttribute("roleList");
    String accountName = "", accountId = "";
    StringBuilder roleName = new StringBuilder();
    if (acct != null) {
        accountName = acct.getRealName();
        accountId = acct.getId();
        if (roleList != null)
            for (Role r : roleList) {
                roleName.append(r.getRoleName()).append(", ");
            }
        roleName = new StringBuilder("未指定角色");
    } else {
        response.sendRedirect("/views/system/login.jsp");
        return;
    }
    List<Resource> menuList = (List<Resource>) request.getAttribute("menuList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="/"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>酒类产品税收信息化管理系统</title>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="../static/styles/gecko.css"/>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../static/styles/css/bootstrap.css"/>
    <link rel="stylesheet" href="../static/styles/css/font-awesome.css"/>
    <!-- page specific plugin styles -->
    <!-- text fonts -->
    <link rel="stylesheet" href="../static/styles/css/ace-fonts.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="../static/styles/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <script type="text/javascript" src="../static/scripts/gecko-modules/jquery/jquery.js"></script>
    <script type="text/javascript" src="../static/scripts/gecko-modules/bootstrap/bootstrap.min.js"></script>
    <script src="../static/scripts/gecko-modules/ace/ace.js"></script>
    <script src="../static/scripts/gecko-modules/ace/ace-extra.js"></script>
    <script type="text/javascript" src="../static/scripts/app/index.js"></script>
</head>
<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="navbar-container" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- /section:basics/sidebar.mobile.toggle -->
        <!--头部左侧部分-->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a  class="navbar-brand">
                <a  class="navbar-brand" style="position: relative;">
                    <small>
                        <i class="logo-pic"></i>
                        <span class="logo-text">酒类产品税收信息化管理系统</span>
                    </small>
                </a>
            </a>
        </div>
        <!--头部右侧部分-->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="../static/images/user/user.jpg" alt="Jason's Photo"/>
                        <span class="user-info"><small>欢迎, </small><%=accountName%></span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="javascript:clickMenu('pre-detail')" data-id="<%=accountId%>">
                                <i class="ace-icon fa fa-user"></i> 个人信息
                            </a>
                        </li>
                        <li class="divider"></li>

                        <li id="logout" onclick="logout();">
                           <a>
                                <i class="ace-icon fa fa-power-off"></i> 退出系统
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>
        <!-- /section:basics/navbar.dropdown -->
    </div>
    <!-- /.navbar-container -->
</div>

<!--main-container开始部分-->
<div class="main-container" id="main-container">
	<div id="sidebar" class="sidebar responsive">
        <!-- /.sidebar-shortcuts -->
        <ul class="nav nav-list submenu " id="submenu">
            <li class="active">
                <a href="/mainpage/list">
                    <i class="menu-icon fa fa-desktop"></i>
                    <span class="menu-text">我的工作台</span>
                </a>
                <b class="arrow"></b>
            </li>
            <c:if test="${entbasic.enttype.key==1}">
            <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-book"></i>
                        <span class="menu-text">酒标管理</span>
                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>
                    <!--系统管理的二级菜单-->
                    <ul class="submenu">
					
						<li class=""><a
							href="javascript:clickMenu('labelApply')"> <i
								class="menu-icon fa fa-caret-right"></i> 酒标申领
						</a> <b class="arrow"></b></li>
						<li class=""><a
							href="javascript:clickMenu('labelManager')"> <i
								class="menu-icon fa fa-caret-right"></i> 酒标管理
						</a> <b class="arrow"></b></li>
				</ul></li>
				</c:if>
					<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-book"></i> <span class="menu-text"> 应税管理</span>
						<b class="arrow fa fa-angle-down"></b>
						</a> <b class="arrow"></b><!--系统管理的二级菜单-->
					<ul class="submenu">
					 <c:if test="${entbasic.enttype.key==1}">
					 	<li class="" ><a
							href="javascript:clickMenu('productionTask')"> <i
								class="menu-icon fa fa-caret-right"></i> 采集任务管理
						</a> <b class="arrow"></b></li>
						<li class="" ><a
							href="javascript:clickMenu('productionCollection')"> <i
								class="menu-icon fa fa-caret-right"></i> 生产采集
						</a> <b class="arrow"></b></li>
						<li class="" ><a
							href="javascript:clickMenu('productionCollectionResult')"> <i
								class="menu-icon fa fa-caret-right"></i> 生产采集结果
						</a> <b class="arrow"></b></li>
						</c:if>
						<li class=""><a
							href="javascript:clickMenu('sellCollection')"> <i
								class="menu-icon fa fa-caret-right"></i> 销售采集
						</a> <b class="arrow"></b></li>
						<li class=""><a
							href="javascript:clickMenu('sellCollectionResult')"> <i
								class="menu-icon fa fa-caret-right"></i> 销售采集结果
						</a> <b class="arrow"></b></li>
						<c:if test="${entbasic.enttype.key==2}">
						<li class=""><a href="javascript:clickMenu('taxConfirm')">
								<i class="menu-icon fa fa-caret-right"></i> 应税确认
						</a> <b class="arrow"></b></li>
						
						<li class=""><a href="javascript:clickMenu('taxDeclare')">
								<i class="menu-icon fa fa-caret-right"></i> 纳税申报
						</a> <b class="arrow"></b></li>
						</c:if>
					</ul></li>
					<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-book"></i> <span class="menu-text"> 系统管理</span>
						<b class="arrow fa fa-angle-down"></b>
						</a> <b class="arrow"></b><!--系统管理的二级菜单-->
					<ul class="submenu">
						<li class="" ><a
							href="javascript:clickMenu('entBasicInfo')"> <i
								class="menu-icon fa fa-caret-right"></i> 企业信息
						</a> <b class="arrow"></b></li>
					</ul></li>
				</ul>
        <!--底部点击按钮滑块-->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
               data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'collapsed')
            } catch (e) {
            }
        </script>
    </div>
    <!--主要内容开始部分-->
    <div class="main-content">
        <div class="main-content-inner">
            <!--主菜单的网页-->
            <div class="menu-content">
                <div id="change-menu">
                    <iframe id="menu-text" width="100%" height="100%" frameborder="0" src="/views/mainpage/mainpageEnt.jsp"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 主要内容结束部分 -->
</div>
<!-- /.main-container结束 -->
</body>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.index}"=="task"){
		document.getElementById("menu-text").src="/complaint/cpcomplaintsreport/taskListView";
	}else if("${param.index}"=="background"){
		document.getElementById("menu-text").src="/views/mgr/views/system/organization/org.html";   
	}else if("${param.index}"=="data"){
		document.getElementById("menu-text").src="/views/complaintRecState/EntPermitStatisticsTable.jsp";   
	}else if("${param.index}"=="notice"){
		document.getElementById("menu-text").src="/notice/mgnotice/noticeListView";   
	}else if("${param.index}"=="memory"){
		document.getElementById("menu-text").src="/memo/mgmemo/memoListView";   
	}
	if("${param.src}"=="register"){
		document.getElementById("menu-text").src="/complaint/cpcomplaintsreport/registerView?cpComplaintsreportId=${param.cpComplaintsreportId}";
	}else if("${param.src}"=="autio"){
		document.getElementById("menu-text").src="/workflow/complaint/autio?taskId=${param.taskId}&&cpComplaintsreportId=${param.cpComplaintsreportId}";
	}else if("${param.src}"=="accountInfo"){
		document.getElementById("menu-text").src="/system/account/personalInfo";
	}
	
})
function logout(){
		if(confirm("您确定要退出吗？")){
			window.location.href="/logout";
		}
}
</script>
<script type="text/javascript" src="../static/scripts/gecko-modules/ace/ace.js"></script>
<script type="text/javascript" src="../static/scripts/gecko-modules/ace/ace.sidebar.js"></script>
<script type="text/javascript" src="../static/scripts/gecko-modules/ace/ace.widget-box.js"></script>
<script type="text/javascript" src="../static/scripts/gecko-modules/gecko/menu.js"></script>
</html>
