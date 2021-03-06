function clickMenu(menu) {
    var frame = document.getElementById("menu-text");
    // 任务中心
    if (menu == 'task-monitor') {
        frame.src = "views/task/task-monitor/index.html";
    }
    if (menu == 'task-mine') {
        frame.src = "views/task/task-mine/index.html";
    }
    if (menu == 'task-history') {
        frame.src = "views/task/task-history/index.html";
    }
    if (menu == 'task-report') {
        frame.src = "views/task/task-report/index.html";
    }

    // 商事登记
    if (menu == 'common-net') {
        frame.src = "views/business-mgr/common-net/index.html";
    }
    if (menu == 'integration-srv') {
        frame.src = "views/business-mgr/integration-srv/index.html";
    }
    //非标受理
    if (menu == 'common-improper') {
        frame.src = "views/business-mgr/common-net/index.html";
    }
    // 系统管理
    if (menu == 'org') {
        frame.src = "views/mgr/views/system/organization/org.html";
    }
    if (menu == 'account') {
        frame.src = "views/mgr/views/system/account/account.html";
    }
    if (menu == 'role') {
        frame.src = "views/mgr/views/system/role/role.html";
    }
    if (menu == 'source') {
        frame.src = "mgr/views/system/resource/resource.html";
    }
    if (menu == 'platform') {
        frame.src = "mgr/views/system/platform/index.html";
    }
    if (menu == 'log') {
        frame.src = "mgr/views/system/logquery/index.html";
    }
    if (menu == 'authority') {
        frame.src = "views/mgr/views/system/authority/authority.html";
    }

    if (menu == 'grid-query') {
        frame.src = "mgr/views/acceptance/gridquery/index.html";
    }

    if (menu == 'grid-complex') {
        frame.src = "mgr/views/acceptance/gridcomplex/index.html";
    }
    /*数据源监控*/
    if (menu == 'dataorgin') {
        frame.src = "mgr/views/system/dataorigin/index.html";
    }
    /*sql监控*/
    if (menu == 'sqlControl') {
        frame.src = "mgr/views/system/sqlcontrol/index.html";
    }
    /*sql防火墙*/
    if (menu == 'sqlfirewall') {
        frame.src = "mgr/views/system/sqlfirewall/index.html";
    }
    /*web应用*/
    if (menu == 'webuse') {
        frame.src = "mgr/views/system/webuse/index.html";
    }
    /*url监控*/
    if (menu == 'urlControl') {
        frame.src = "mgr/views/system/urlcontrol/index.html";
    }
    /*session监控*/
    if (menu == 'sessionControl') {
        frame.src = "mgr/views/system/sessioncontrol/index.html";
    }
    /*容器监控*/
    if (menu == 'containercontrol') {
        frame.src = "mgr/views/system/containercontrol/index.html";
    }
    /*个人信息*/
    if (menu == 'pre-detail') {
        frame.src = "/system/account/personalInfo";
    }
    /*demo*/
    if (menu == 'enttypeList') {
        frame.src = "views/demo/pubenttype/pubenttype.html";
    }
    /*工作流管理*/
    if (menu == 'workflow') {
        frame.src = "workflow/deployHome";
    }
    /*工作流管理*/
    if (menu == 'complainWorkflow') {
        frame.src = "views/complaint/list.jsp";
    }
    /*任务管理*/
    if (menu == 'taskManager') {
        frame.src = "views/workflow/task.jsp";
    }
    /*事项登记*/
    if (menu == 'complaintRegister') {
        frame.src = "/complaint/cpcomplaintsreport/complaintRegisterView";
    }
    /*电话登记*/
    if (menu == 'telComplaintRegister') {
        frame.src = "/complaint/cpcomplaintsreport/telComplaintRegisterView";
    }
    /*酒标申领*/
    if (menu == 'labelApply') {
        frame.src = "/ent/entapplication/labelApplyView";
    }
    /*酒标管理*/
    if (menu == 'labelManager') {
        frame.src = "/ent/entapplication/labelManagerView";
    }
    /*生产采集任务*/
    if (menu == 'productionTask') {
        frame.src = "/tax/alproduct/productionTaskView";
    }
    /*生产采集*/
    if (menu == 'productionCollection') {
        frame.src = "/tax/alproduct/productionCollectionView";
    }
    /*生产采集结果*/
    if (menu == 'productionCollectionResult') {
        frame.src = "/tax/alproduct/productCollectResultView";
    }
    /*销售采集*/
    if (menu == 'sellCollection') {
        frame.src = "/tax/alcirculation/sellCollectionView";
    }
    /*销售采集结果*/
    if (menu == 'sellCollectionResult') {
        frame.src = "/tax/alcirculation/sellCollectionResultView";
    }
    /*应税确认*/
    if (menu == 'taxConfirm') {
        frame.src = "/tax/alcirculation/taxConfirmView";
    }
    /*纳税申报*/
    if (menu == 'taxDeclare') {
        frame.src = "/tax/alcirculation/taxDeclareView";
    }
    /**投诉接受情况报表**/
    if (menu == 'rec-state') {
        frame.src = "/views/complaintRecState/EntPermitStatisticsTable.jsp";
    }
    /**各渠道受理情况**/
    if(menu == 'channel-accept'){
        frame.src = "/views/complaintRecState/EntAcceptTable.jsp"
    }
    /**备忘录**/
    if (menu == 'memo') {
        frame.src = "/memo/mgmemo/memoListView";
    }
     /**公告管理**/
    if (menu == 'noticeList') {
        frame.src = "/notice/mgnotice/noticeListView";
    }
     /**新增公告**/
    if (menu == 'noticeAdd') {
        frame.src = "/notice/mgnotice/noticeAdd";
    }
    /**查看企业基本信息**/
    if (menu == 'entBasicInfo') {
        frame.src = "/ent/ententbasic/currentEntBasicInfo";
    }
}

function clickMenuUrl(url) {
    var frame = document.getElementById("menu-text").src = url;
    /*
    // 任务中心
    frame.src = "views/task/task-monitor/index.html";
    frame.src = "views/task/task-mine/index.html";
    frame.src = "views/task/task-history/index.html";
    frame.src = "views/task/task-report/index.html";
    // 商事登记
    frame.src = "views/business-mgr/common-net/index.html";
    frame.src = "views/business-mgr/integration-srv/index.html";
    //非标受理
    frame.src = "views/business-mgr/common-net/index.html";
    // 系统管理
    frame.src = "views/system/organization/index.html";
    frame.src = "views/system/account/index.html";
    frame.src = "views/system/role/index.html";
    frame.src = "views/system/resource/resource.html";
    frame.src = "views/system/platform/index.html";
    frame.src = "views/system/logquery/index.html";
    frame.src = "views/system/authority/index.html";
    frame.src = "views/acceptance/gridquery/index.html";
    frame.src = "views/acceptance/gridcomplex/index.html";
    */
    /*数据源监控*/
    // frame.src = "views/system/dataorigin/index.html";
    /*sql监控*/
    // frame.src = "views/system/sqlcontrol/index.html";
    /*sql防火墙*/
    // frame.src = "views/system/sqlfirewall/index.html";
    /*web应用*/
    // frame.src = "views/system/webuse/index.html";
    /*url监控*/
    // frame.src = "views/system/urlcontrol/index.html";
    /*session监控*/
    // frame.src = "views/system/sessioncontrol/index.html";
    /*容器监控*/
    // frame.src = "views/system/containercontrol/index.html";
    /*个人信息*/
    // frame.src = "views/system/perdetails/index.html";
}

var submenu = document.getElementById('submenu');
submenu.onclick = function (ev) {
    $('#submenu').find('li.active').removeClass();
    var ev = ev || window.event;
    var target = ev.target || ev.srcElement;
    var Node = target.parentElement;

    if (Node.tagName == "LI" && target.href != undefined && target.href.indexOf('#') < 0) {
        Node.className += ' ' + 'active';
    }
}

