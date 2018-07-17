/**
 * 权限树
 *
 * @author by ZhuXugang
 * @date 20170527
 * @param treeId: doc element id, 不带#号，
 * @param beforeRender: zTree dataFilter function
 * @return zTreeObject
 */
var authorityTree = function (treeId, callback) {
    var settings = {
        async: {
            url: "/system/authority/all",
            contentType: "application/json; charset=UTF-8",
            dataFilter: function (treeId, parentNode, response) {
                if (response.statusCode === 500) {
                    return {id: "-1", pId: 0, roleName: response.message};
                }
                return response.data;
            },
            enable: true,
            type: "post",
            dataType: "json"
        },
        check: {
            enable: true
        },
        view: {
            dblClickExpand: true,
            showLine: true,
            selectedMulti: true,
            showIcon: true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "resource",
                rootPId: null
            },
            key: {
                name: "authorityName"
            }
        }
    };
    if (!!callback)
        settings.callback = callback;
    var ztree = $.fn.zTree.init($("#" + treeId), settings);
    ztree.expandAll(true);
    return ztree;
};
