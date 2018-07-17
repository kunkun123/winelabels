$(function () {
    roleTree("roleTree");
    orgTree("org-tree", null, callback);
    authorityTree("authTree");
});

var callback = {
    onClick: function (event, treeId, treeNode, clickFlag) {
        $("#account_table").bootstrapTable("refresh", {url: "/system/account/listByOrgId/" + treeNode.id});
    }
};
var roleAccountRespHandler = function(resp){
    return {
        data : res.data.result
    };
};
var addAccount2Role = function () {
    var rowSelected = $("#account_table").bootstrapTable("getAllSelections");
    var data = [];
    var selectedNode = $.fn.zTree.getZTreeObj("roleTree").getSelectedNodes();
    if (selectedNode.length > 0) {
        rowSelected.forEach(function (r) {
            data.push({accountId: r.id, roleId: selectedNode[0].id, id: null});
        });
        if (data.length > 0)
            $.ajax({
                url: "/system/role/batchSaveAccountRole",
                data: JSON.stringify(data),
                type: "PUT",
                contentType: "application/json",
                success: function () {
                    $("#account-modal").hide();
                    $(".modal-backdrop").remove();
                    $("body").removeClass('modal-open');
                    info("addAccount0", "保存成功！");
                    //alert(data[0].roleId);
                    resynchUserList(data[0].roleId);
                },
                error: function () {
                    info("addAccount", "保存失败！");
                }
            });
        else
            info("addAccount", "没有选择用户需要添加！")
    } else {
        info("addAccount", "没有选定角色！");
    }
};
var prepareToDelete = function () {
    var msg = $("#account-role-msg");
    var selectNode = $.fn.zTree.getZTreeObj("roleTree").getSelectedNodes();
    if (selectNode.length > 0) {
        var names = [];
        $("#user-table").bootstrapTable("getAllSelections").forEach(function (r) {
            names.push(r.realName)
        });
        if (names.length > 0) {
            msg.html("将从角色: " + selectNode[0].roleName + " 下移除账号 (" + names + ") , 请检查确认！");
        } else {
            msg.html("没有账号需要移除!");
            return false;
        }
    } else {
        msg.html("没有账号需要移除!");
    }
};
var deleteAccountRole = function () {
    var msg = $("#account-role-msg");
    var selectNode = $.fn.zTree.getZTreeObj("roleTree").getSelectedNodes();
    if (selectNode.length > 0) {
        var data = [];
        $("#user-table").bootstrapTable("getAllSelections").forEach(function (r) {
            data.push({accountId: r.id, roleId: selectNode[0].id, id: null});
        });
        var names = [];
        $("#user-table").bootstrapTable("getAllSelections").forEach(function (r) {
            names.push(r.realName)
        });
        if (names.length > 0) {
            $.ajax({
                url: "/system/role/batchDeleteAccount2Role",
                type: "PUT",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function () {
                    info("delAccount0", "移除成功!");
                    $('#delete-modal').modal("hide");
                    resynchUserList(data[0].roleId);
                },
                error: function () {
                    info("delAccount0", "移除失败!");
                }
            });
        }
    }
};
var roleTree = function (treeId) {
    var settings = {
        async: {
            url: "/system/role/tree",
            dataFilter: function (treeId, parentNode, response) {
                if (response.code !== undefined && response.code === 500) {
                    return [{id: "-1", pId: 0, roleName: response.message}];
                }
                return response.data;
            },
            contentType: "application/json",
            enable: true,
            type: "post",
            dataType: "json"
        },
        check: {
            enable: false
        },
        view: {
            dblClickExpand: true,
            showLine: true,
            selectedMulti: false
        },
        data: {
            key: {
                name: "roleName"
            },
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode, clickFlag) {
                var roleId = treeNode.id;
                recheckAuthorityTree(roleId);
                resynchUserList(roleId);
            }
        }
    };
    var tree = $.fn.zTree.init($("#" + treeId), settings);
    $('#add-role').click(function () {
        $('#create-role-modal').modal('show');
    });

    $('#edit-role').click(function () {
        var zTreeObj = $.fn.zTree.getZTreeObj("roleTree");
        var selectNode = zTreeObj.getSelectedNodes();
        if (selectNode && selectNode.length > 0) {
            $("#edit-role-id").val(selectNode[0].id);
            $("#edit-role-name").val(selectNode[0].roleName);
            $('#edit-role-modal').modal('show');
        } else {
            return false;
        }
    });

    $('#remove-role').click(function () {
        $('#remove-role-modal').modal('show');
    });
    return tree;
};

var recheckAuthorityTree = function (roleId) {
    $.ajax({
        url: "/system/authority/roleAuth",
        data: "roleId=" + roleId,
        dataType: "json",
        contentType: "application/json;charset=utf8",
        type: "GET",
        success: function (response) {
            var authTree = $.fn.zTree.getZTreeObj("authTree");
            if (response.data.length > 0) {
                var raMap = {};
                response.data.forEach(function (ra) {
                    raMap[ra.AUTHORITYID] = ra.ROLEID;
                });
                authTree.getNodes().forEach(function (node) {
                	console.log(raMap);
                    if (raMap[node.id]) {
                        if (!node.nochecked)
                            authTree.checkNode(node, true, true);
                    } else {
                        if (!node.nochecked)
                            authTree.checkNode(node, false, true);
                    }
                });
            } else {
                authTree.checkAllNodes(false);
            }
        }
    });
};

var resynchUserList = function (roleId) {
    $('#user-table').bootstrapTable("refresh", {
        url: "/system/account/accountsByRoleId/" + roleId
    });
};

var batchSave = function () {
    var checkedAuthorities = $.fn.zTree.getZTreeObj("authTree").getCheckedNodes(true);
    var selectedNodes = $.fn.zTree.getZTreeObj("roleTree").getSelectedNodes();
    var selectedRoleId = selectedNodes.length > 0 ? selectedNodes[0].id : undefined;
    if (!selectedRoleId) {
        info("roleAuthSaveBtn", "没有选择角色");
        return;
    }

    var ras = [];
    checkedAuthorities.forEach(function (node) {
        var ra = {};
        ra['roleId'] = selectedRoleId;
        ra['authorityId'] = node.id;
        ras.push(ra);
    });

    $.ajax({
        url: "/system/authority/saveRoleAuth/"+selectedRoleId,
        data: JSON.stringify(ras),
        dataType: "json",
        contentType: "application/json;charset=utf8",
        type: "PUT",
        success: function (resp) {
            if (resp.code === 0)
                info("roleAuthSaveBtn", "保存成功");
            else
                info("roleAuthSaveBtn", resp.msg === undefined ? "" : resp.msg);
        },
        error: function (resp) {
            info("roleAuthSaveBtn", "保存失败" + resp.msg === undefined ? "" : resp.msg);
        }
    });
}

var checkAll = function () {
    var authTree = $.fn.zTree.getZTreeObj("authTree");
    authTree.checkAllNodes(true);
}

var reverseCheck = function () {
    var authTree = $.fn.zTree.getZTreeObj("authTree");
    authTree.getNodes().forEach(function (node) {
        if (!node.nochecked) {
            authTree.checkNode(node, !node.checked, true);
        }
    });
}

var save = function () {
    var name = $("#new-role-name").val();
    $.ajax({
        url: "/system/role/save",
        data: JSON.stringify({
            "id": null,
            "roleName": $("#new-role-name").val(),
            "description": null,
            "roleType": null
        }),
        type: "PUT",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
            $('#create-role-modal').modal('hide');
            refreshNode("roleTree");
        },
        error: function (response) {
            $('#create-role-modal').modal('hide');
        }
    });
}

var update = function () {
    var name = $("#edit-role-name").val();
    $.ajax({
        url: "/system/role/save",
        data: JSON.stringify({
            "id": $("#edit-role-id").val(),
            "roleName": name,
            "description": null,
            "roleType": null
        }),
        type: "PUT",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
            $('#edit-role-modal').modal('hide');
            refreshNode("roleTree");
        },
        error: function (response) {
            $('#edit-role-modal').modal('hide');
        }
    });
}

var delRole = function (id) {
    var zTreeObj = $.fn.zTree.getZTreeObj("roleTree");
    var selectNode = zTreeObj.getSelectedNodes();
    if (selectNode && selectNode.length > 0) {
        $.ajax({
            url: "/system/role/deleteRole/" + selectNode[0].id,
            type: "DELETE",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function (response) {
                $('#remove-role-modal').modal('hide');
                refreshNode("roleTree");
            },
            error: function (response) {
                $('#remove-role-modal').modal('hide');
            }
        });
    }
}

var impower = function (event) {
}
var operateFormatter = function () {
    return "<button style='border:none;outline:none;border-radius:0px;height:20px;line-height:8px;margin-bottom:4px;' class='btn btn-default  btn-sm'>删除</button>";
}
var refreshNode = function(treeId) {  
    /*根据 treeId 获取 zTree 对象*/  
    var zTree = $.fn.zTree.getZTreeObj(treeId),  
    type = "refresh",  
    silent = true,  
    /*获取 zTree 当前被选中的节点数据集合*/  
    nodes = zTree.getSelectedNodes();  
    console.log(nodes[0]);
    /*强行异步加载父节点的子节点。[setting.async.enable = true 时有效]*/  
    zTree.reAsyncChildNodes(nodes[0], type, silent);  
}  

/** 
 * 刷新当前选择节点的父节点 
 */  
var refreshParentNode = function(treeId) {  
    var zTree = $.fn.zTree.getZTreeObj(treeId),  
    type = "refresh",  
    silent = false,  
    nodes = zTree.getSelectedNodes();  
    /*根据 zTree 的唯一标识 tId 快速获取节点 JSON 数据对象*/  
    var parentNode = zTree.getNodeByTId(nodes[0].parentTId);  
    /*选中指定节点*/  
    zTree.selectNode(parentNode);  
    zTree.reAsyncChildNodes(parentNode, type, silent);  
}  
