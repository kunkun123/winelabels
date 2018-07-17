/**
 * 工具
 */
/**
 * 提示信息
 */
var basePath = "";

var info = function(eId, msg){
    var options = {
        delay:{ "show": 500, "hide": 100 },
        content:msg,
        container:"body",
        placement:"auto"
    };
    $("#"+eId).popover(options);
    $("#"+eId).popover("show");
    setTimeout(function(){$("#"+eId).popover('destroy')}, 2000);
}
