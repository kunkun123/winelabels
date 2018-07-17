$(function() {
	$('#input-daterange').datepicker({autoclose:true});
	var columns = [{
		field: 'state',
		checkbox: true
	}, {
		field: 'id',
		title: '流水号',
		valign:'middle',
		align: 'left'
	}, {
		field: 'name',
		title: '姓名',
        valign:'middle',
		align: 'left'
	}, {
		field: 'part',
		title: '报障部门',
		align: 'left',
        valign:'middle',
		sortable: true
	}, {
		field: 'msg',
		title: '报障信息',
        valign:'middle',
		align: 'left',
		sortable: true
	}, {
		field: 'phoneNum',
		title: '手机号',
        valign:'middle',
		align: 'left'
	}, {
		field: 'createTime',
		title: '创建时间',
        valign:'middle',
		align: 'center',
		sortable: true
	}];

	var gridHeight = $(window).height() - ($('.breadcrumbs').height() + 25);
	var pageSize = Math.floor(gridHeight / 23);

	var accountTable = $('#data-table').bootstrapTable({
		url: '../../../data/demo/task_report.json',
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

	$('#add-data').click(function(){
		$('#add-data-modal').modal('show');
	});

	$('#export-excel').click(function(){
		showExportModal();
	});

	$('#export-json').click(function(){
		showExportModal();
	});

	$('#export-pdf').click(function(){
		showExportModal();
	});

	function showExportModal() {
		$('#export-data-modal').modal('show');
	}
});
