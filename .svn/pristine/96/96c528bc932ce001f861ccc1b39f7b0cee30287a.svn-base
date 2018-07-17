/**
 * 机构树共用初始化
 *
 * @author by ZhuXugang
 * @date 20170527
 * @param treeId, doc element id, 不带#号，
 * @param beforeRender,zTree dataFilter function
 * @param callback zTree callback 对象
 * @return zTreeObject
 */
var orgTree = function (treeId, beforeRender, callback) {
	
    if (!beforeRender)
        beforeRender = function (treeId, parentNode, response) {
            if (response.code === 500) {
                return {id: "-1", pId: 0, roleName: response.message};
            }
            var data = response.data;
            data.forEach(function (d) {
                if (!d.parentOrg) {
                    d["open"] = true;
                }
            });
            return data;
        };
    var settings = {
        async: {
            url: "/system/organization/tree",
            contentType: "application/json; charset=UTF-8",
            dataFilter: beforeRender,
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
                name: "orgName"
            },
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parentOrg",
                rootPId: null
            }
        }
    };

    if (!!callback)
        settings.callback = callback;
    var ztreeOrg = $.fn.zTree.init($("#" + treeId), settings, []);
    ztreeOrg.expandAll(true);
    return ztreeOrg;
};
var refreshNode = function(treeId,silentType) {  
    /*根据 treeId 获取 zTree 对象*/  
    var zTree = $.fn.zTree.getZTreeObj(treeId),  
    type = "refresh",  
    silent = silentType,  
    /*获取 zTree 当前被选中的节点数据集合*/  
    nodes = zTree.getSelectedNodes();  
    /*强行异步加载父节点的子节点。[setting.async.enable = true 时有效]*/  
    zTree.reAsyncChildNodes(null,type,false);  
    zTree.expandAll(true);
}  