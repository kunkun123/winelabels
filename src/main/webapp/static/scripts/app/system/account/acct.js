$(function () {
    orgTree("accountOrgTree", null, callback);
    var authTree = authorityTree("authTree");
    var columns = [{
        checkbox: true
    }, {
        field: 'id',
        visible: false
    }, {
        field: 'realName',
        title: '姓名',
        align: 'left',
        searchable: true,
        editable: {
            type: "text"
        }
    }, {
        field: 'gender',
        title: '性别',
        align: 'left',
        editable: {
            type: "select",
            source: [{value: 1, text: "男"}, {value: 2, text: "女"}]
        }, 
        formatter : function (value, row, index) {
            if (row['gender'] == "1") {
                return '男';
            }
            if (row['gender'] == "2") {
                return '女';
            }
        }
    }, {
        field: 'principal',
        title: '账号',
        align: 'left',
        searchable: true,
        editable: {
            type: "text"
        }
    }, {
        field: 'mobilePhone',
        title: '手机号',
        align: 'left',
        searchable: true,
        editable: {
            type: "text"
        }
    }, {
        field: 'email',
        title: 'Email',
        align: 'left',
        searchable: true,
        editable: {
            type: "email"
        }
    }, {
        field: 'qq',
        title: 'QQ',
        align: 'left',
        searchable: true,
        editable: {
            type: "number"
        }
    }];

    $('#table').bootstrapTable({
        url: '/system/account/listByOrgId/0',
        toolbar: "#toolbar",
        idField: "id",
        pagination: true,
        limit: 15,
        showRefresh: true,
        sidePagination: "server",
        search: true,
        columns: columns,
        onEditableSave: function (field, row, oldValue, e) {
            var data = {name: field, pk: row.id, value: row[field]};
            $.ajax({
                type: "post",
                url: "/system/account/edit",
                data: data,
                dataType: 'JSON',
                content: "application/json;charset=UTF8",
                success: function (data, status) {
                    if (status === "success") {
                    	$("#acc_msg").html("修改成功!");
                        //info("authorityTable", '修改成功');
                    }
                },
                error: function () {
                    //info('authorityTable', '编辑失败');
                },
                complete: function () {

                }
            });
        }
    });
});
var remove = function () {
    var table = $("#table");
    var selected = table.bootstrapTable("getSelections");
    var ids = [];
    var realNames = []
    selected.forEach(function (t) {
        ids.push(t.id)
        realNames.push(t.realName);
    });

    if (ids.length >= 1 && confirm("请谨慎删除，确认删除以下数据据：" + realNames)) {
        $.ajax({
            url: "/system/account/delete", data: JSON.stringify(ids), type: "DELETE",
            contentType: "application/json;charset=utf8",
            success: function (resp) {
                if (resp.code === 0) {
                    //info(tableId, "删除成功");
                	$("#acc_msg").html("删除成功!");
                    table.bootstrapTable('remove', {field: 'id', values: ids});
                }
            }
        });
    }
};
var add = function () {
    var table = $("#table");
    var rowData = {//TODO change this init param my yourself
        id: "", name: "", organization_id: ""
    };
    $.ajax({
        url: "/system/account/save",
        data: JSON.stringify(rowData),
        type: "put",
        contentType: "application/json; charset=UTF-8",
        success: function (res) {
            if (res.code === 0) {
                rowData.id = res.data.id;
                table.bootstrapTable("insertRow", {index: 0, row: rowData});
            }
        }
    });
};
/*
 * 用户表单的js代码
 */
var impower = function (event) {
};
//var operateFormatter = function (value, row, index) {
//    var del = "<a id='id-btn-dialog2' class='tooltip-warning' data-rel='tooltip' title='删除'><i data-role='delete' style='cursor:pointer' class='ace-icon fa fa-trash-o red bigger-110' onclick=delUser('" + row.id + "');></i></a>";
//    var lock = "<a id='id-btn-lock' class='tooltip-warning' data-rel='tooltip' title='锁定'><i data-role='delete' style='cursor:pointer' class='ace-icon fa fa-lock bigger-110 icon-on-right' onclick=lockUser('" + row.id + "');></i></a>";
//    var auth = "<a id='id-btn-auth' class='tooltip-warning' data-rel='tooltip' title='权限' data-toggle=\"modal\" data-target=\"#myModalAuth\"><i data-role='delete' style='cursor:pointer' class='ace-icon fa fa-user  bigger-110 icon-on-right'></i></a>";
//    return auth;
//    //del 
//    //+ "&nbsp;&nbsp;" + lock 
//    //+ 
//    //"&nbsp;&nbsp;" + 
//   
//};
var callback = {
    onClick: function (event, treeId, treeNode, clickFlag) {
        reSyncAccount(treeNode.id);
    }
};

var reSyncAccount = function (orgId) {
    $('#table').bootstrapTable("refresh", {url: "/system/account/listByOrgId/" + orgId});
};

var save = function () {
    var sldNodes = $.fn.zTree.getZTreeObj("accountOrgTree").getSelectedNodes();
    var orgId = sldNodes.length > 0 ? sldNodes[0].id : "-1";
    var account = {};
    $("#userinfo").serializeArray().forEach(function (x) {
        account[x.name] = x.value;
    });
    $.ajax({
        url: "/system/account/saveorgacc/" + orgId,
        data: JSON.stringify(account),
        type: "POST",
        //dataType: "text",
        contentType: "application/json; charset=utf-8",
        success: function (response) {
        	//console.log(response);
            info("保存成功,刷新页面.");
            destroyUserForm();//清空表单
            reSyncAccount(orgId);
        },
        error: function (response) {
            info("保存失败")
        }
    });
    $('#myModal').modal('hide');
};

var destroyUserForm = function () {
    var userInfo_form = $("#userinfo");
    userInfo_form.find("#id").val("l");
    userInfo_form.find("#principal").val("l");
    userInfo_form.find("#realName").val("l");
    userInfo_form.find("#gender").val("l");
    userInfo_form.find("#mobilePhone").val("l");
    userInfo_form.find("#telPhone").val("l");
    userInfo_form.find("#email").val("l");
    userInfo_form.find("#qq").val("l");
    userInfo_form.find("#credential").val("l");
    userInfo_form.find("#repassword").val("l");
};
var delUser = function (id) {
    if (confirm('Are your sure delete the [' + id + '] user?')) {
        $.ajax({
            url: "/system/account/delete/" + id,
            type: "DELETE",
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                info("删除成功！刷新页面.");
            }
        });
    }
};
var info = function (msg) {
    var options = {
        delay: {"show": 500, "hide": 100},
        content: msg,
        container: "body",
        placement: "auto"
    };
    $("#user_msg").popover(options);
    $("#user_msg").popover("show");
    setTimeout(function () {
        $("#user_msg").popover('hide')
    }, 3000);
};
