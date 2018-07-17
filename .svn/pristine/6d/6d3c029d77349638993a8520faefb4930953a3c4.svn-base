<%@ page import="org.gecko.framework.wineLabels.entity.base.AbstractAlProduct" %><%--
  Created by IntelliJ IDEA.
  User: jixiang
  Date: 2018/1/5
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>complaint-CpComplaintsreport</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/static/styles/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/styles/css/font-awesome.css"/>
    <!-- page specific plugin styles -->
    <!-- text fonts -->
    <link rel="stylesheet" href="/static/styles/css/ace-fonts.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="/static/styles/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <script src="/static/scripts/gecko-modules/ace/ace-extra.min.js"></script>
    <script src="/static/scripts/gecko-modules/jquery/jquery.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-table.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-table-zh-CN.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-datepicker.js"></script>
    <script src="/static/scripts/gecko-modules/bootstrap/bootstrap-datepicker-zhCN.js"></script>
</head>
<style>
    .form-control{
        width: 50%;
    }
</style>
<body class="no-skin">
<div class="main-container ace-save-state" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        酒标申领
                    </h1>
                </div><!-- /.page-header -->
                <form role="form" id="queryForm" action="">
                    <table class="table table-hover">
                        <tr class="table-bordered">
                            <td class=" table-bordered" style="width:28%">
                                <label class="bolder blue control-label data-picker"  for="startDate">开始日期：</label>
                                <input name="search"  id="startDate" type="text" date-date-format="dd-mm-yyyy" class="form-control"/>
                            </td>
                            <td class=" table-bordered" style="width:28%">
                                <label class="control-label bolder blue" for="endDate">结束日期：</label>
                                <input name="search" id="endDate" type="text" class="form-control"/>
                            </td>
                            <td  align="center" style="vertical-align: middle" class="table-bordered" style="width:25%">
                                <label  class="control-label bolder blue">&nbsp;&nbsp;&nbsp;&nbsp;审核状态：</label>
                                <select name="search" id="source">
                                    <option value="0">&nbsp;不限</option>
                                    <option value="1">&nbsp;未审核</option>
                                    <option value="2">&nbsp;通过</option>
                                    <option value="3">&nbsp;不通过</option>
                                </select>
                            </td>
                            <td align="center" class=" table-bordered" style="width:10%">
                                <button type="submit" class="btn btn-primary" onclick="queryApplyList()">查询</button>
                            </td>
                            <td align="center" class=" table-bordered" style="width:10%">
                                <button  type ="button" class="btn btn-primary " data-toggle="modal" data-target="#applyModal">申领</button>
                            </td>
                        </tr>
                    </table>
                </form>

                    <table id="labelApplyList">
                    </table>

                </div>
            </div><!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
<!-- /.main-container -->

<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    申领
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label bolder blue">&emsp;&nbsp;&nbsp;商品种类：</label>
                        <div class="col-xs-2">

                        </div>
                        &emsp;
                        <select  name="search" >
                            <option value="1">&nbsp;白酒</option>
                            <option value="2">&nbsp;黄酒</option>
                            <option value="3">&nbsp;啤酒</option>
                            <option value="4">&nbsp;其他酒</option>
                        </select>
                    </div>
                    <div  class="form-group">
                        <label for="applyNum" class="col-sm-4 control-label bolder blue">申领数量(个):</label>
                        <div class="col-xs-6">
                        <input type="text" class="form-control input-sm" id="applyNum" placeholder="请输入申领个数" >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-6 col-sm-10">
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="cancelApplyModal" tabindex="-1" role="dialog" aria-labelledby="cancelApply" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="cancelApply">
                    取消申领
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class=" col-xs-7 control-label bolder label-lg red2">您确定要取消申领吗？</label>
                        <div class="col-xs-2">
                        </div>
                    </div>
                    <div  class="form-group">
                        <tr>
                            <td>
                        <label for="applyNum" class="col-sm-4 control-label bolder blue">申领时间:
                            &emsp;<span class="infobox-black" id="applyProductname"></span></label>
                            </td>
                        <div class="col-xs-6">
                        </div>

                        </tr>
                    </div>
                    <div  class="form-group">
                        <label for="applyNum" class="col-sm-4 control-label bolder blue">申领数量:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control input-sm" >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-10">
                            <button type="submit" class="btn btn-primary">取消申领</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="viewPassModal" tabindex="-1" role="dialog" aria-labelledby="viewPass" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="viewPass">
                    查看申领
                </h4>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
    if(!ace.vars['old_ie']) $("input[id$='Date']").datepicker({
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
$('#labelApplyList').bootstrapTable({
    //toolbar: "#toolbar",
    idField: "id",
    pagination: true,
    sidePagination: 'client',
    pageNumber: 1,
    pageSize: 5,
    pageList: [5, 10, 20],

    <%--url: "<c:url value='/SellServlet?act=ajaxGetSellRecord'/>", //获取数据的Servlet地址--%>
    url:"/wineLabels/alproduct/list",

    columns: [{
        checkbox: true
    }, {
        field: 'applyDate',
        title: '申领时间',
        sortable:true
    }, {
        field: 'productname',
        title: '商品种类'
    }, {
        field: 'applyNumber',
        title: '申领数量'
    }, {
        field: 'collectiontype',
        title: '审核状态'
    },{
        field: 'auditView',
        title: '审核意见'
    },{
        field: 'auditDate',
        title: '审核时间'
    },{
        field: 'operate',
        title: '操作',
        //events: operateEvents,
        formatter:operateFormatter
    },]


});
/*申请列表查询*/
function queryApplyList(){
    $('#labelApplyList').bootstrapTable('refresh');
}
/*取消酒标申领窗口*/
function cancelApply(productname) {
    $('#cancelApplyModal').modal('show');

    $('#applyProductname').html(productname);

}
/*审核通过情况查看*/
function viewPass() {
    $('#viewPassModal').modal('show');
}

function viewUnpass() {
    $('#myModal').modal('show');
}
/*根据审核状态进行相应的操作*/
function operateFormatter(value,row,index) {
    if (row.collectiontype == '未审核'){
        return [
        '<a class="like" href="javascript:void(0)"  onclick="cancelApply('+ row.productname+')" title="取消申领">' +
            '取消申领' +
            '</a> '].join('');
    }
    else if(row.collectiontype == '通过'){
        return[
    '<a class="remove" href="javascript:void(0)" onclick="viewPass()" title="查看">' +
      '&emsp;查看' +
    '</a>'
        ].join('')
    }
    else{
        return[
            '<a class="remove" href="javascript:void(0)" onclick="viewUnpass()" title="查看">' +
            '&emsp;查看' +
            '</a>'
        ].join('')
    };
}
</script>


</body>
</html>
