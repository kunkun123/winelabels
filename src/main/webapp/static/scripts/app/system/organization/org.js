$(function () {
	orgTree("tree", orgDataFilter, callback);
    $(window).on('resize.chosen', function () {
        var chosen = $('.chosen-select');
        var w = chosen.parent().width();
        chosen.siblings('.chosen-container').css({
            'width': w
        });
    }).triggerHandler('resize.chosen');
});

var callback = {
    onRename: function (event, tree, node) {
    },
    onClick: function (event, treeId, treeNode, clickFlag) {
        updateOrgFormData(treeNode);
    }
};
var orgDataFilter = function (treeId, parentNode, response) {
    var data = response === undefined ? [] : response.data;
    var dataKV = [];
    data.forEach(function(d){
        if(!d.parentOrg){
            d["open"]=true;
        } 
        dataKV.push({
            id: d.id,
            name: d.orgName
        });
    });
    
    var select_OrgParent = $("#org_parent");
    for (var i = 0; i < dataKV.length; i++) {
        select_OrgParent.append("<option value='" + dataKV[i].id + "'>" + dataKV[i].name + "</option>");
    }
    if (!ace.vars['touch']) {
        select_OrgParent.chosen();
        $("#org_category").chosen();
    }
    return data;
}

var updateOrgFormData = function (treeNode) {
    var select = $("#org_parent");
    var category = $("#org_category");
    if (treeNode.parentOrg) {
        select.val(treeNode.parentOrg.id);
    } else {
        select.val(treeNode.id);
    }
    category.val(treeNode.orgCategory);

    select.trigger("chosen:updated");
    category.trigger("chosen:updated");

    $("#org_id").val(treeNode.id);
    $("#org_name").val(treeNode.orgName);
    $("#org_code").val(treeNode.orgCode);
    $("#org_btn_save").addClass("disabled");
};

var updateOrgnization = function (data) {
    $.ajax({
        url: "/system/orgnization/save",
        data: {},
        method: "POST",
        success: function (response) {
        	/* $("#org_btn_save").addClass("disabled");
             // $.fn.zTree.getZTreeObj("tree").getSelectedNodes()[0].name = org.orgName;
              refreshNode("tree",true);
              //$.fn.zTree.getZTreeObj("tree").expandAll(true);
              //$.fn.zTree.getZTreeObj("tree").expandAll(true);
*/              $("#org_msg").html("保存成功！");        }
    });
};
var orgNew = function () {
    var treeObj = $.fn.zTree.getZTreeObj("tree");
    var selected = treeObj.getSelectedNodes()[0];
    treeObj.cancelSelectedNode(selected);

    $("#org_id").val(null);
    $("#org_parent").val(-1);
    $("#org_code").val("");
    $("#org_category").val(-1);
    $("#org_name").val("");
    $(".chosen-select").trigger("chosen:updated");
    $("#org_btn_save").removeClass("disabled");
};
var orgEdit = function () {
    $("#org_btn_save").removeClass("disabled");
};
var orgSave = function () {
    var org = {};
    org.id = $("#org_id").val();
    org.orgName = $("#org_name").val();
    org.orgCategory = $("#org_category").val();
    org.parentOrg = $("#org_parent").val();
    org.orgCode = $("#org_code").val();
    if(org.orgName==null ||  org.orgCategory==null || org.orgCode==null){
    	$("#org_msg").html("请正确填写必要信息！");
    	return;
    }
    $.ajax({
        url: "/system/organization/save",
        data: JSON.stringify(org),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
            $("#org_btn_save").addClass("disabled");
           // $.fn.zTree.getZTreeObj("tree").getSelectedNodes()[0].name = org.orgName;
            refreshNode("tree",true);
            $.fn.zTree.getZTreeObj("tree").expandAll(true);
            //$.fn.zTree.getZTreeObj("tree").expandAll(true);
            $("#org_msg").html("保存成功！");
        },
        error: function (response) {
        	 console.log(response);
        	 $("#org_msg").html("保存失败！");
        }
    });
};
var orgDelete = function () {
    var treeObj = $.fn.zTree.getZTreeObj("tree");
    var selected = treeObj.getSelectedNodes()[0];
    if (selected === undefined) {
        $("#org_msg").html("无选中节点需要删除!");
        return;
    }
    if (selected.isParent) {
        $("#org_msg").html("这个节点不能删除!");
        return;
    }

    var id = $("#org_id").val();
    if (id === null || id === undefined || id === "") {// 删除新建
        updateOrgFormData(selected);
    } else {
        var r = confirm("确认删除这个机构吗？");
        if (r) {
            $.ajax({
                url: "/system/organization/deleteOrg?id=" + id,
                type: "DELETE",
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    treeObj.removeNode(selected, false);
                    $("#org_msg").html("删除成功！");
                }
            });
        }
    }
};

