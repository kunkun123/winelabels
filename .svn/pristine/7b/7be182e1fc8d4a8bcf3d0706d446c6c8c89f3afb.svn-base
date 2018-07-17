$(function() {
	$('#input-daterange').datepicker({autoclose:true});
	var columns = [{
		field: 'state',
		checkbox: true
	}, {
		field: 'id',
		title: '流水号',
		align: 'left'
	}, {
		field: 'cname',
		title: '企业名称',
		align: 'left'
	}, {
		field: 'ccode',
		title: '企业注册号',
		align: 'left',
		sortable: true
	},  {
		field: 'ctype',
		title: '企业类型',
		align: 'left',
		sortable: true
	},{
		field: 'createTime',
		title: '提交时间',
		align: 'center',
		sortable: true
	}, {
		field: 'type',
		title: '类别',
		align: 'left'
	}];

	var gridHeight = $(window).height() - ($('.breadcrumbs').height() + 25);
	var pageSize = Math.floor(gridHeight / 23);

	var accountTable = $('#data-table').bootstrapTable({
		url: '/data/demo/commonet-list.json',
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
		columns: columns
	});
	//查看详情
	$('#show-detail').click(function(){
		$('#show-detail-modal').modal();
	});
	
	//查看股东,组织机构详情

	$('.gdxxBtn').click(function() {
		$('#collapseOne').collapse('show');
	});
	$('.zzjgBtn').click(function() {
		$('#zzjgdetail').collapse('show');
	});
	
	$('a.media').media({
		width : '100%',
		height : 450
	});

});
