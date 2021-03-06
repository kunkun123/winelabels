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
		
</head>
<style>
    .row-margin-top{
        margin-top: 10px;
    }
    body {
	        background-color:white;
	    }
    .fixed-table-body {
    overflow-x: auto;
    overflow-y: auto;
    height: auto;
}
</style>
<body class="no-skin">

            <div class="page-content">
                    <h3>
                        酒标申领
                    </h3>
               
                          
                <form role="form" id="queryForm" action="">
                <button type="button" class="btn btn-sm btn-primary" onclick="queryApplyList()">查询</button>
<!--                 <button type="button" class="btn btn-sm btn-light" onclick="clearInput()">重置</button>
 -->               
                <button  type ="button" class="btn btn-sm btn-primary " data-toggle="modal" data-target="#applyModal">申领</button>
                
                    <table class="">
                    <tr style="height:10px"></tr>
                        <tr class="">
                            <td align="center" class=" " style="width:7%">
                                <label class="bolder blue control-label data-picker"  for="startDateSearch">申领时间：</label>
                             </td><td align="center" class=" " style="width:10%">
                                <input name="search"  id="startDateSearch" type="text" date-date-format="dd-mm-yyyy" class="form-control"/>
                            </td>
                            <td align="center" class=" " style="width:2%">
                                <label class="" for="endDateSearch">--</label>
                             </td><td align="center" class=" " style="width:10%">       
                                <input name="search" id="endDateSearch" type="text" class="form-control"/>
                            </td>
                            <td   style="vertical-align: middle" class="" style="width:25%">
                                <label  class="bolder control-label  blue">&nbsp;&nbsp;&nbsp;&nbsp;审核状态：</label>
                                <select name="search" id="auditStatusSearch">
                                    <option value="">&nbsp;不限</option>
                                    <option value="NE">&nbsp;待审核</option>
                                    <option value="ON">&nbsp;通过</option>
                                    <option value="UN">&nbsp;未通过</option>
                                </select>
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
                <form class="form-horizontal" role="form" method="post" action="/ent/entapplication/save" >
                    <div class="form-group">
                        <label class="control-label  blue">&emsp;&nbsp;&nbsp;商品种类：</label>
                        <div class="col-xs-2">

                        </div>
                        &emsp;
                        <select  name="producttype" id="producttype">
                            <option value="SPIRIT">白酒</option>
                            <option value="BEER">啤酒</option>
                            <option value="YELLOWWINE">黄酒</option>
                            <option value="OTHERS">其他酒</option>
                        </select>
                    </div>
                    <div  class="form-group">
                        <label for="productnumber" class="col-sm-4 control-label  blue">申领数量(个):</label>
                        <div class="col-xs-6">
                        <input type="text" name="productnumber"class="form-control input-sm" id="productnumber" placeholder="请输入申领个数" >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-10">
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
                <form class="form-horizontal" role="form" action="">
                    <div class="form-group">
                        <label class=" col-xs-7 control-label  label-lg red2">您确定要取消申领吗？</label>
                        <div class="col-xs-2">
                        </div>
                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div  class="form-group col-sm-5">
                        <label class=" control-label  blue">申领时间:
                            &emsp;&nbsp;<span class="infobox-black" id="applyProductname"></span></label>
                    </div>
                    <div  class="form-group col-sm-5 ">
                        <label class="control-label  blue">申领数量:
                        &nbsp;&nbsp;<span class="infobox-black" id="appluNum"></span></label>
                        <input id="applicationId" type="hidden"/>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-10">
                            <button type="button"  class="btn btn-primary" onclick="deleteApply()">取消申领</button>
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
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">申领时间：<span class="infobox-black" id="VPApplyDate"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核结果：<span class="infobox-black" id="VPAuditStatus"></span></div>
                </div>
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">商品种类：<span class="infobox-black" id="VPProductType"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核时间：<span class="infobox-black" id="VPAuditDate"></span></div>
                </div>
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">申领数量：<span class="infobox-black" id="VPApplyNum"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核人：<span class="infobox-black" id="VPAuditor"></span></div>
                </div>
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">原因：<span class="infobox-black" id="VPReason"></span></div>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="viewUnpassModal" tabindex="-1" role="dialog" aria-labelledby="viewUnpass" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="viewUnpass">
                    查看申领
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">申领时间：<span class="infobox-black" id="VUPApplyDate"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核结果：<span class="infobox-black" id="VUPAuditStatus"></span></div>
                </div>
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">商品种类：<span class="infobox-black" id="VUPProductType"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核时间：<span class="infobox-black" id="VUPAuditDate"></span></div>
                </div>
                <div class="row">
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">申领数量：<span class="infobox-black" id="VUPApplyNum"></span></div>
                    <div class="col-sm-6 row-margin-top blue" style="font-size: larger">审核人：<span class="infobox-black" id="VUPAuditor"></span></div>
                </div>
                <div class="row">
                  
                    <div class="col-sm-6 row-margin-top ">
                        <img  width="10%" src="/static/labelApply/caizhengbuCode.png" onmousemove="bigImg(this)" onmouseleave="normalImg(this)">
                        <img width="10%" src="/static/labelApply/caizhengbu.png">
                        查询网址:http://www.casic.com
                    </div>
                </div>
               
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
    if(!ace.vars['old_ie']) $("input[id$='DateSearch']").datepicker({
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
    clickToSelect:true,
   // method : "POST",
    //contentType : "application/x-www-form-urlencoded",
    sidePagination: 'client',
    pageNumber: 1,
    pageSize: 5,
    pageList: [5, 10, 20],
    queryParams:queryParams,

    <%--url: "<c:url value='/SellServlet?act=ajaxGetSellRecord'/>", //获取数据的Servlet地址--%>
    url:"/ent/entapplication/applyList",

    columns: [{
        field:'id',
        title:'ID',
        visible:false
    },
        {
        field: 'applicandate',align: 'center', 
        title: '申领时间',
        sortable:true
    }, {
        field: 'temp1',align: 'center', 
        title: '商品种类'
    }, {
        field: 'productnumber',align: 'center', 
        title: '申领数量'
    }, {
        field: 'temp2',
        title: '审核状态',align: 'center', 
    }, {
        field: 'reason',align: 'center', 
        title: '审核意见'
    },{
        field: 'auditdate',align: 'center', 
        title: '审核时间'
    },{
        field: 'operate',align: 'center', 
        title: '操作',
        //events: operateEvents,
        formatter:operateFormatter
    },]
});

function queryParams(params) {
    /*var params = {
        startDate : $('#startDate').val(),
        endDate : $('#endDate').val(),
        auditStatus : $('#auditStatus').val()
    }*/
    params.startDateSearch = $('#startDateSearch').val();
    params.endDateSearch = $('#endDateSearch').val();
    params.auditStatusSearch = $('#auditStatusSearch').val();
    console.log(params)
    return params;
}
/*申请列表查询*/
function queryApplyList(){
    $('#labelApplyList').bootstrapTable('refresh');
}
/*取消酒标申领窗口*/
function cancelApply(applicantId,applicandate,applyNum) {
    $('#cancelApplyModal').modal('show');
    var str = applicandate.toString(),res="";
    for(var i=0;i<str.length;i++){
        res+=str[i];
        if(i==3 | i==5){
            res+="-";
        }
    }
    $('#applicationId').val(applicantId);
    $('#applyProductname').html(res);
    $('#appluNum').html(applyNum);

}

/*取消酒标申领*/
function deleteApply(){
   
    //alert(JSON.stringify(rows))
    var ids = [];
    
    ids.push($('#applicationId').val())
   
    if(ids.length > 0){
        $.ajax({
            url : "/ent/entapplication/delete",
            type : "POST",
            anysc:false,
            data: JSON.stringify(ids),
            contentType:"application/json"
        });
    }

}
/*审核通过情况查看*/
function viewPass(row) {
    $('#viewPassModal').modal('show');
    $('#VPApplyDate').html(row.applicandate);
    $('#VPProductType').html(row.temp1);
    $('#VPApplyNum').html(row.productnumber);
    //原因
   // $('#VPApplyRes').html(row);
    $('#VPAuditDate').html(row.auditdate);
    $('#VPAuditor').html(row.auditor);
    $('#VPAuditStatus').html(row.temp2);
}
/*审核未通过情况查看*/
function viewUnpass(row) {
    $('#viewUnpassModal').modal('show');
    $('#VUPApplyDate').html(row.applicandate);
    $('#VUPProductType').html(row.temp1);
    $('#VUPApplyNum').html(row.productnumber);
    //原因
    // $('#VPApplyRes').html(row);
    $('#VUPAuditDate').html(row.auditdate);
    $('#VUPAuditor').html(row.auditor);
    $('#VUPAuditStatus').html(row.temp2);
}

function bigImg(x) {
    x.style.width = "100%";
}
function normalImg(x) {
        x.style.width = "10%";
    }
/*根据审核状态进行相应的操作*/
function operateFormatter(value,row,index) {
	var id = "'"+row.id+"'";
    if (row.temp2 == '待审核'){
        return [
        '<a class="like" onclick="cancelApply('+id+','+row.applicandate.replace(/-/g,"")+','+ row.productnumber+')" title="取消申领">' +
            '取消申领' +
            '</a> '].join('');
    }
    else if(row.temp2 == '未通过'){
        return[
    "<a class='remove' href='javascript:void(0)' onclick='viewPass("+JSON.stringify(row)+")' title='查看'>" +
      "查看" +
    "</a>"
        ].join('')
    }
    else{
        return[
            "<a class='remove' href='javascript:void(0)' onclick='viewUnpass("+JSON.stringify(row)+")' title='查看'>" +
            "查看" +
            "</a>"
        ].join('')
    };
}
function clearInput(){
	document.getElementById("queryForm").reset();	
}


   /* $(function testDel() {
        $('#delButton').click(function () {
            var ids = $.map( $('#labelApplyList').bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
            $('#labelApplyList').bootstrapTable('remove', {
                field: 'id',
                values: ids
            });
        });
    });*/

</script>


</body>
</html>
