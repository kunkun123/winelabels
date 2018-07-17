<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html lang="zh-CN">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/static/styles/css/tree.css">
        <link rel="stylesheet" type="text/css" href="/static/styles/css/ace-fonts.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/css/font-awesome.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/css/organization.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/css/ace.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/css/bootstrap-table.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/styles/gecko.css" />

        <script type="text/javascript" src="/static/scripts/gecko-modules/jquery/jquery.js"></script>

        <script type="text/javascript" src="/static/scripts/gecko-modules/jquery/jquery-ui.js"></script>

        <script type="text/javascript" src="/static/scripts/gecko-modules/bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript" src="/static/scripts/app/system/perdetails/index.js"></script>
    </head>
    <body>

    <div class="row breadcrumbs" style="margin: 0px !important">
        <div class="lt">
            <div class="lt" style="margin-top:5px">
                <button class="btn btn-sm btn-primary" id="edit_btn">
                    <i class="ace-icon fa fa-file-image-o  bigger-110 icon-on-right"></i>
                   修改
                </button>
            </div>
        </div>
    </div>
    <div class="form-inline no-border per_detail">
        <ul class="list-group no-border" style="border:none;">
            <li class="list-group-item overflow" style="padding-left:40px">个人信息</li>
            <li class="list-group-item overflow">
                <div class="lt overflow" style="width:50%;">
                    <dl>
                        <dd class="lt">真实姓名 &nbsp;:</dd>
                        <dt class="lt">${account.realName}</dt>
                    </dl>
                </div>
                <div class="lt overflow" style="width:50%;">
                    <dl>
                        <dd class="lt">账号 &nbsp;:</dd>
                        <dt class="lt">>${account.principal}</dt>
                    </dl>
                </div>
            </li>
            <li class="list-group-item overflow" >
                <div class="lt overflow" style="width:50%;">
                    <dl>
                        <dd class="lt">性别 &nbsp;:</dd>
                        <dt class="lt">
                        <c:if test="${account.gender =='1'}">男</c:if>
                        <c:if test="${account.gender =='2'}">女</c:if></dt>
                    </dl>
                </div>
                <div class="lt overflow" style="width:50%;">
                    <dl>
                        <dd class="lt">移动电话 &nbsp;:</dd>
                        <dt class="lt">${account.mobilePhone}</dt>
                    </dl>
                </div>
            </li>
            <li class="list-group-item overflow">
                <div class="lt" style="width:50%;overflow: hidden">
                    <dl>
                        <dd class="lt">固定电话 &nbsp;:</dd>
                        <dt class="lt">${account.telPhone}</dt>
                    </dl>
                </div>
                <div class="lt" style="width:50%;overflow: hidden">
                    <dl>
                        <dd class="lt">qq &nbsp;:</dd>
                        <dt class="lt">${account.qq}</dt>
                    </dl>
                </div>
            </li>
            <li class="list-group-item overflow">
                <div class="lt" style="width:50%;overflow: hidden">
                    <dl>
                        <dd class="lt">email &nbsp;:</dd>
                        <dt class="lt">${account.email}</dt>
                    </dl>
                </div>
                <!-- <div class="lt" style="width:50%;overflow: hidden">
                    <dl>
                        <dd class="lt">create_time &nbsp;:</dd>
                        <dt class="lt">12345</dt>
                    </dl>
                </div> -->
            </li>
        </ul>
    </div>
  
    <!-- Moda窗口 -->
    <div class="modal fade in" id="per_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <i class="normal-icon ace-icon fa fa-user red bigger-130 user-icon"></i> <span class="modal-title"
                                                                                                   id="myModalLabel" style="color: #DD5A43">修改信息</span>
                </div>
                <!--modal-body部分-->
                <div class="modal-body">
                    <form id="userinfo" class="form-inline" action="/system/account/infoSave" method="post" >
                        <input type="hidden" id="id" name="id" value="${account.id}" />
                        <input type="hidden" id="locked" name="locked" value="false" />
                        <input type="hidden" id="salt" name="salt" value="" />
                        <div class="form-group">
                            <label for="principal">真实姓名</label>
                            <input type="text" class="form-control" id="realName" name="realName" value="${account.realName}" placeholder="真实姓名">
                        </div>
                        <div class="form-group">
                            <label for="realName">用户名</label>
                            <input type="text" class="form-control" id="principal" name="principal" value="${account.principal}" placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="gender">性别</label>
                            <select class="form-control" id="gender" name="gender" style="width:180px;border-radius:0px ">
                           <c:if test="${account.gender=='1'}">
				                <option selected="selected" value="1">男</option>
				                <option value="2">女</option>
				            </c:if>
				            <c:if test="${account.gender=='2'}">
				                <option  value="1">男</option>
				                <option  selected="selected" value="2">女</option>
				            </c:if>
                        </select>
                        </div>
                        <div class="form-group">
                            <label for="mobilePhone">移动电话</label>
                            <input type="text" class="form-control" id="mobilePhone" name="mobilePhone" value="${account.mobilePhone}" placeholder="移动电话">
                        </div>
                        <div class="form-group">
                            <label for="telPhone">固定电话</label>
                            <input type="text" class="form-control" id="telPhone" name="telPhone" value="${account.telPhone}" placeholder="固定电话">
                        </div>
                        <div class="form-group">
                            <label for="email">qq</label>
                            <input type="text" class="form-control" id="qq" name="qq" value="${account.qq}" placeholder="QQ号">
                        </div>
                        <div class="form-group">
                            <label for="qq">email</label>
                            <input type="text" class="form-control" id="email" name="email" value="${account.email}" placeholder="电子邮箱">
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" id="credential" value="" name="credential" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="password">确认密码</label>
                            <input type="password" class="form-control" id="reCredential" value="" name="reCredential" placeholder="确认密码">
                        </div>
                    </form>
                </div>
                <!--modal-footer部分-->
                <div class="modal-footer">
                    <button type="button" id="saveAccount" class="btn btn-primary save">保存</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>