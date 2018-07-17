$(function() {
	$('#input-daterange').datepicker({autoclose:true});
	var columns = [{
		field: 'state',
        valign:'middle',
		checkbox: true
	}, {
		field: 'id',
		title: '受理号',
		valign:'middle',
		align: 'left'
	}, {
		field: 'cname',
		title: '企业名称',
        valign:'middle',
		align: 'left'
	}, {
		field: 'ccode',
		title: '企业注册号',
		align: 'left',
        valign:'middle',
		sortable: true
	}, {
		field: 'push_time',
		title: '提交时间',
		align: 'left',
        valign:'middle',
		sortable: true
	}, {
		field: 'type',
		title: '类别',
        valign:'middle',
		align: 'left'
	}, {
		field: 'status',
		title: '状态',
		align: 'left',
        valign:'middle',
		sortable: true
	}];

	var gridHeight = $(window).height() - ($('.breadcrumbs').height() + 25);
	var pageSize = Math.floor(gridHeight / 23);

	var accountTable = $('#data-table').bootstrapTable({
		url: '../../../data/demo/task-history.json',
		pagination: true, //分页
		pageNumber: 1, //如果设置了分页，首页页码
		pageSize: pageSize, //如果设置了分页，页面数据条数
		paginationPreText: '<',
		paginationNextText: '>',
		height: 300, //设置表格的高度
		buttonsClass: 'success',
		iconSize: 'xs',
		//pageList: [pageSize, pageSize*2, pageSize*3, pageSize*4], //如果设置了分页，设置可供选择的页面数据条数
		clickToSelect: true,
		sortable: true,
		//singleSelect: true,
		striped:true,
		checkboxHeader: true,
		columns: columns,
        rowStyle:function rowStyle(row, index) {
            return {
                css: { "line-height":"30px"}
            };
        }
	});
	
	$('#export-data-modal  input').attr("readonly","readonly");

	function showExportModal() {
		 $('#export-data-modal').modal('show');
		 $('a.media').media({
				width : '100%',
				height : 450
			});
	}
	$('#add-data').click(function(e){
		showExportModal();
	});
	$('#data-table').on('click-row.bs.table',function (){
		 showExportModal();
	 });
	//查看股东,组织机构详情

	$('.gdxxBtn').click(function() {
		$('#collapseOne').collapse('show');
	});
	$('.zzjgBtn').click(function() {
		$('#zzjgdetail').collapse('show');
	});
});
