/**
 *
 * 角色树型结构
 *
 * @author by ZhuXugang
 * @date 20170527
 * @param treeId: doc element id, 不带#号，
 * @param beforeRender: zTree dataFilter function
 * @return zTreeObject
 */
var roleTree = function (treeId, callback) {
    var settings = {
        async: {
            url: "/system/role/tree",
            contentType: "application/json; charset=UTF-8",
            dataFilter: function (treeId, parentNode, response) {
                if (response.statusCode === 500) {
                    return {id: "-1", pId: 0, roleName: response.message};
                }
                var data = response === undefined ? [] : response.rows;
                for (var i = 0; i < data.length; i++) {
                    data[i].name = data[i].authorityName;
                    if (data[i].resource === data[i].id) {
                        data[i].resource = null;
                    }
                }
                return data;
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
        key: {
            name: "role_name"
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: null
            }
        },
        callback: callback
    };
    return $.fn.zTree.init($("#" + treeId), settings, null);
};
