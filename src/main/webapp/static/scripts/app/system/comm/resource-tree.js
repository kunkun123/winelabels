/**
 * 资源树
 *
 * @author by ZhuXuGang
 * @date 20170601
 * @param treeId: doc element id, 不带#号，
 * @callback  zTree callback function
 * @return zTreeObject
 */
var resourceTree = function (treeId, callback) {
    var settings = {
        async: {
            url: "/system/resource/list",
            contentType: "application/json; charset=UTF-8",
            dataFilter: function (treeId, parentNode, response) {
                if (response.statusCode === 500) {
                    return {id: "-1", pId: -1, roleName: response.message};//root
                }
                var data = response.data.rows;
                data.push({id: "-1", pId: -1, sourceName: "菜单"});//root
                data.forEach(function (d) {
                    if (!d.parentId || d.parentId === '-1') {
                        d["open"] = true;
                        d.parentId = "-1";
                    }
                });
                return data;
            },
            enable: true,
            type: "post"//,
            //dataType: "json"
        },
        check: {
            enable: false
        },
        view: {
            dblClickExpand: true,
            showLine: true,
            selectedMulti: true,
            showIcon: true
        },
        data: {
            key: {
                name: "sourceName"
            },
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: "-1"
            }
        }
    };
    settings.callback = callback;
    return $.fn.zTree.init($("#" + treeId), settings);
};
