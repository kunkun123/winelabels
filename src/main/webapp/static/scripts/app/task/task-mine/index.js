$(function() {
	$('#input-daterange').datepicker({autoclose:true});
	var columns = [{
		field: 'state',
		checkbox: true
	}, {
		field: 'id',
		title: '受理号',
		align: 'left',
		sortable: true
	},{
		field: 'name',
		title: '企业名称',
		align: 'left'
	}, {
		field: 'code',
		title: '企业注册号',
		align: 'left'
	}, {
		field: 'push_time',
		title: '提交时间',
		align: 'left',
		sortable: true
	}, {
		field: 'type',
		title: '类别',
		align: 'left',
		sortable: true
	}, {
		field: 'status',
		title: '状态',
		align: 'left'
	}];

	var gridHeight = $(window).height() - ($('.breadcrumbs').height() + 25);
	var pageSize = Math.floor(gridHeight / 23);

	var accountTable = $('#data-table2').bootstrapTable({
		url: '/data/demo/myTask.json',
		pagination: true, //分页
		pageNumber: 1, //如果设置了分页，首页页码
		pageSize: pageSize, //如果设置了分页，页面数据条数
		paginationPreText: '<',
		paginationNextText: '>',
		height: gridHeight, //设置表格的高度
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

	$('.gdxxBtn').click(function() {
		$('#collapseOne').collapse('show');
	});
	
	$('.zzjgBtn').click(function() {
		$('#zzjgdetail').collapse('show');
	});
	
	$('#showPDF').click(function(){
		$('a.media').media({
			width : '100%',
			height : 450
		});
	})
	function showExportModal() {
		$('#export-data-modal').modal('show');
	}
});
