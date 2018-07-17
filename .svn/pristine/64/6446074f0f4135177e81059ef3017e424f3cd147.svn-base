<%@page import="java.util.Date"%>
<%@ page import="org.gecko.common.utils.GeckoProperties"%>
<%@ page import="org.gecko.framework.system.entity.Account"%>
<%@ page import="org.gecko.framework.system.entity.Resource"%>
<%@ page import="org.gecko.framework.system.entity.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%
   
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="/"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>内蒙古自治区食品药品监督管理局投诉举报系统</title>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="/static/styles/gecko.css"/>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/static/styles/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/styles/css/font-awesome.css"/>
    <!-- page specific plugin styles -->
    <!-- text fonts -->
    <link rel="stylesheet" href="/static/styles/css/ace-fonts.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="/static/styles/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <script type="text/javascript" src="/static/scripts/gecko-modules/jquery/jquery.js"></script>
    <script type="text/javascript" src="/static/scripts/gecko-modules/bootstrap/bootstrap.min.js"></script>
    <script src="/static/scripts/gecko-modules/ace/ace.js"></script>
    <script src="/static/scripts/gecko-modules/ace/ace-extra.js"></script>
    <script type="text/javascript" src="/static/scripts/app/index.js"></script>
    
</head>
  <style>
  .box1,.box2,.box3,.box4{margin:0 auto; border:1px solid #666} 
	.box1{position:absolute; width:348px; height:120px; left:108px; top:108px; background-color:#5a95f9
	;word-break:break-all;word-wrap:break-word;border:1px solid transparent;border-radius: 5px;} 
	.box2{cursor:pointer;position:absolute; width:390px; height:120px; left:470px; top:108px;border-radius: 5px;background-color:#5eb7fc;border:1px solid transparent} 
	.box3{cursor:pointer;position:absolute; width:348px; height:248px; left:108px; top:245px;border-radius: 5px;background-color:#5eb7fc;border:1px solid transparent} 
	.box4{cursor:pointer;position:absolute; width:390px; height:120px; left:470px; top:245px;border-radius: 5px;background-color:#8cca61;border:1px solid transparent} 
	.box5{cursor:pointer;position:absolute; width:190px; height:118px; left:470px; top:375px;border-radius: 5px;background-color:#5a95f9;border:1px solid transparent} 
	.box6{cursor:pointer;position:absolute; width:190px; height:118px; left:670px; top:375px;border-radius: 5px;background-color:#caa885;border:1px solid transparent}
	.box7{position:absolute; width:390px; height:35px; left:900px; top:108px;border-radius: 5px;background-color:#5a95f9;border:1px solid transparent} 
	.box8{cursor:pointer;position:absolute; width:390px; height:180px; left:900px; top:142px;border-radius: 5px;background-color:white;border:1px solid transparent}
	.box9{position:absolute; width:390px; height:35px; left:900px; top:335px;border-radius: 5px;background-color:#5a95f9;border:1px solid transparent} 
	.box10{cursor:pointer;position:absolute; width:390px; height:180px; left:900px; top:370px;border-radius: 5px;background-color:white;border:1px solid transparent} 
  </style>
   <body background="/static/images/mainpage/background.png" style="background-size:100%">
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
    <!--头部左侧部分-->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a  class="navbar-brand">
                <a  class="navbar-brand" style="position: relative;">
                    <small>
                        <i class="logo-pic"></i>
                        <span class="logo-text">内蒙古自治区食品药品监督管理局投诉举报系统</span>
                    </small>
                </a>
            </a>
        </div>
   		<!--头部右侧部分-->
   		<div style="float:left" class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue"">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="../static/images/user/user.jpg" alt="Jason's Photo"/>
                        <span class="user-info"><small>欢迎, </small>${account.realName}</span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close" >
                        <li onclick="window.open('/index?index=background&&src=accountInfo','_self')">
                            <a>
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
    </div>
	<div class="box1" id="box1">
		<div style="float:left">
		 <img alt="" src="/static/images/mainpage/user.png" style="margin: 15px 40px 35px 40px;">
		</div>
		<div style="float:left;padding-top:15px" >
			 <span><font size="3" color="white"><c:if test="${am_pm==1}">下午好,</c:if>
			 <c:if test="${am_pm==0}">上午好,</c:if>
			 ${account.realName}!<br/>
			 ${dateNowStr}
			 </font>
			 </span>
		 </div>
		 <div style="position:absolute; width:120px; height:30px; left:150px; top:70px;background-color:#ddb512;border:1px solid transparent">
		 	
			 <div style="cursor:pointer;width:30px; height:30px;float:left">
			 	<img alt="" src="/static/images/mainpage/u12.png" style="margin: 5px 40px 35px 10px;">
			 </div>
		 	
		 	<div tabindex="0" style="cursor:pointer;padding-left:3px;padding-top:1px;float:left" id="memoryShow">
				<font size="3" color="white">添加备忘录</font>
		 	</div>
		 </div>
		 <c:if test="${fn:length(mgMemos)>2}">
			 <div style="position:absolute; width:12px; height:12px; left:148px; top:65px;">
			 	<img alt="" src="/static/images/mainpage/u31.png" style="margin: 0px 10px 15px 115px;">
			 </div>
		 </c:if>
	</div> 
		
	
 	<div class="box2" id="box2" onclick="window.open('/index?index=task','_self')">
 		<div>
		 <img alt="" src="/static/images/mainpage/task.png" style="margin: 15px 100px 15px 170px;">
		</div>
		
		<div style="padding-left:154px">
			<font size="3" color="white">业务办理</font>
		</div>
 	</div> 
 	<div style="position:absolute; width:40px; height:40px; left:720px; top:90px;">
 	<c:if test="${taskNum>0}">
 		<div>
			<img alt="" src="/static/images/mainpage/tim.png" style="margin: 0px 10px 15px 115px;">
			<span style="position:absolute; width:40px; height:40px; left:126px; top:4px;">
				<font size="4" color="white">${taskNum}</font>
			</span>
		</div>
	</c:if>	
	</div>
 	<div class="box3" id="box3" onclick="window.open('/index?index=background','_self')">
 		<div>
		 <img alt="" src="/static/images/mainpage/system.png" style="margin: 80px 80px 15px 140px;">
		</div>
		<div style="padding-left:138px">
			<font size="3" color="white">系统管理</font>
		</div>
 	</div> 
 	<div class="box4" id="box4" onclick="window.open('/index?index=data','_self')">
 		<div>
		 <img alt="" src="/static/images/mainpage/data.png" style="margin: 15px 100px 15px 170px;">
		</div>
		<div style="padding-left:154px">
			<font size="3" color="white">数据管理</font>
		</div>
 	</div> 
	<div class="box5" id="box5" onclick="window.open('/index?index=notice','_self')">
		<div>
		 <img alt="" src="/static/images/mainpage/notice.png" style="margin: 25px 40px 15px 70px;">
		</div>
		<div style="padding-left:63px">
			<font size="3" color="white">公告管理</font>
		</div>
	</div> 
	<div class="box6" id="box6" onclick="window.open('/index?index=memory','_self')">
		<div>
		 <img alt="" src="/static/images/mainpage/memory.png" style="margin: 25px 40px 15px 70px;">
		</div>
		<div style="padding-left:66px">
			<font size="3" color="white">备忘录</font>
		</div>
	</div>
	<div class="box7" id="box7">
		<div style="float:left;width:40px;height:35px">
		 <img alt="" src="/static/images/mainpage/task2.png" style="margin: 10px 40px 15px 15px;">
		</div>
		<div style="padding-top:6px;padding-left:6px;float:left">
			<font size="3" color="white">待办事项</font>
		</div>
		<div>
			<div style="cursor:pointer;padding-top:4px;padding-left:6px;float:right;;width:40px;height:35px">
				<img alt="" src="/static/images/mainpage/more.png" style="margin: 10px 40px 15px 15px;">
			</div>
			<div style="cursor:pointer;padding-top:10px;padding-left:6px;float:right"  onclick="window.open('/index?index=task','_self')">
				<font size="2" color="white">更多</font>
			</div>
		</div>
	</div>
	<div class="box8" id="box8">
		<span id="taskDetails"></span>
	</div> 
	<div class="box9" id="box9">
		<div style="float:left;width:40px;height:35px">
		 <img alt="" src="/static/images/mainpage/notice2.png" style="margin: 6px 40px 15px 15px;">
		</div>
		<div style="padding-top:6px;padding-left:6px;float:left">
			<font size="3" color="white">通知公告</font>
		</div>
		<div>
			<div style="cursor:pointer;padding-top:4px;padding-left:6px;float:right;;width:40px;height:35px">
				<img alt="" src="/static/images/mainpage/more.png" style="margin: 10px 40px 15px 15px;">
			</div>
			<div style="cursor:pointer;padding-top:10px;padding-left:6px;float:right" onclick="window.open('/index?index=notice','_self')">
				<font size="2" color="white">更多</font>
			</div>
		</div>
	</div>
	<div class="box10" id="noticeDetails">
		
	</div> 
	<div id="memoryList" style="display:none;">
		<span style="position:absolute; width:180px; height:25px; left:259px; top:210px;background-color:#ddb512;"><font size="3" color="black">备忘事项</font></span>	
		<span style="position:absolute; width:180px; height:200px; left:259px; top:235px;background-color:white;" id="memoryDetails">
		</span>
	</div>
<div class="modal fade role-modal" id="myModalNotice" tabindex="-1" role="dialog" aria-labelledby="myModalAuthLabel">
    <div class="modal-dialog" role="document" style="width:898px;height:492px;">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <span class="modal-title" id="myModalNoticeLabel" style="color:#DD5A43">通知公告详情</span>
            </div>
            <!--modal-body部分-->
            <div class="modal-body" id="notice">
                
            </div>
            <!--modal-footer部分-->
            <div class="modal-footer" style="text-align:center;">
                <button type="button" class="btn btn-primary save" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
  </body>
</html>
<script>
$(document).ready(function(){
	if("${fn:length(mgMemos)>2}"){
		$("#memoryShow").mouseover(function(){
  			$("#memoryList").show();
		});
		$("#memoryShow").mouseout(function(){
  			$("#memoryList").hide();
		});
		$.each(${mgMemos},function(i,ele){
			$("#memoryDetails").append("<font size='3' style='position:absolute; width:180px; height:200px;' color='red'>"+ele.content+"</font><br><br/>");
		});
	}
	if("${fn:length(cpComplaintsreports)}>0"){
		$.each(${cpComplaintsreports},function(i,ele){
			if(ele.status==0){
				$("#taskDetails").append("<div onclick=window.open('/index?index=task','_self')><font size='3'>"+(i+1)+".您有一个案件未签收</font></div>");
			}else if(ele.status==1){
				$("#taskDetails").append("<div onclick=window.open('/index?index=task&&src=register&&cpComplaintsreportId="+ele.id+"','_self')><font size='3'>"+(i+1)+".您有一个案件未登记</font><br/></div>");
			}else if(ele.status>1){
				$("#taskDetails").append("<div onclick=window.open('/index?index=task&&src=autio&&cpComplaintsreportId="+ele.id+"&&taskId="+ele.currentflow+"','_self')><font size='3'>"+(i+1)+".您有一个案件未办理</font><br/></div>");
			}
		});
	}
	if("${fn:length(mgNotices)}>2"){
		$.each(${mgNotices},function(i,ele){
			$("#noticeDetails").append("<div style='float:left;width:330px;' onclick='fillNotice("+JSON.stringify(ele)+")'><font size='3'>"
				+(i+1)+"."+ele.title+"</font></div>"
				+"<div style='position:absolute;left:340px;float:left'><font size='3'>"
				+(ele.publicdate.month+1)+"-"+ele.publicdate.day+"</div><br/>");
		});
	}
})
/**
	给公告的modal框赋值
**/
function fillNotice(notice){
	$("#myModalNotice").modal("show");
	var html = "<div style='background-color:#94979c;width:843px;height:35px;line-height:30px; height:30px;'><p style='width:839px;height:17px;'><span style='width:166.2px;height:15px'>公告编号："
		+notice.serialno+"</span></p></div><div style='width:843px;height:35px;text-align:center;'><p style='font-family:黑体;width:839px;height:17px'><span style=' text-align:center;'><font size='4'>"
		+notice.title+"</span></p></div><div style='width:843px;height:35px;text-align:center;'><p style='width:839px;height:17px'><span style=' text-align:center;'><font size='2'>发布时间："
		+notice.publicdate.year+"年"+(notice.publicdate.month+1)+"月"+notice.publicdate.day+"日"+"</span></p></div>"
		+"<div style='width:843px;height:35px;'><p style='width:839px;height:17px'><span style=' text-align:center;'><font size='3'>"
		+notice.content+"</span></p></div>"
	$("#notice").html(html);
}
function logout(){
		if(confirm("您确定要退出吗？")){
			window.location.href="/logout";
		}
}
</script>