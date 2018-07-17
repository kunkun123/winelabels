$(function(){
	var $table = $('#complex-table');
	function initTable(){
		 	var columns = [{
			field: 'state',
			checkbox: true,
		}, {
			field: 'id',
			title: '编号',
			valign:'middle',
			align: 'left',
		}, {
			field: 'name',
			title: '姓名',
			align: 'left',
			valign:'middle'
		}, {
			field: 'sex',
			title: '性别',
			align: 'left',
			valign:'middle',
			sortable: true
		}, {
			field: 'account',
			title: '账号',
			align: 'left',
			valign:'middle',
			sortable: true
		}, {
			field: 'phoneNum',
			title: '手机号',
			valign:'middle',
			align: 'left'
		}, {
			field: 'email',
			title: 'email',
			valign:'middle',
			align: 'left'
		}, {
			field: 'createTime',
			title: '创建时间',
			align: 'center',
			valign:'middle',
			sortable: true
		}, {
			field: 'handle',
			title: '操作',
			align: 'center',
			valign:'middle',
			events : impower,
			formatter : function(value, row, index) {
			    var editor ="<a class='tooltip-success' data-rel='tooltip'  title='编辑'><i data-role='edit' style='cursor:pointer' class='ace-icon fa green fa-pencil bigger-110'></i></a>";
			    var del ="<a id='id-btn-dialog2' class='tooltip-warning' data-rel='tooltip' title='删除'><i data-role='delete' style='cursor:pointer' class='ace-icon fa fa-trash-o red bigger-110'></i></a>";
			   /* var scale ="<a class='tooltip-info' data-rel='tooltip'  title='查看'><i style='cursor:pointer' class='ace-icon fa gray fa-file-image-o bigger-110'></i></a>";*/
				return editor +"&nbsp;&nbsp;&nbsp;"+del+"&nbsp;&nbsp;&nbsp;";
			}
		}];
		
	 	$table.bootstrapTable({
		 	url: '../../../data/demo/userlist.json',
			pagination: true, //分页
			pageNumber: 1, //如果设置了分页，首页页码
			pageSize: pageSize, //如果设置了分页，页面数据条数
			paginationPreText: '<',
			paginationNextText: '>',
			height: 300, //设置表格的高度
			buttonsClass: 'success',
			iconSize: 'xs',
			clickToSelect: true,
			sortable: true,
			//singleSelect: true,
			striped:true,
			checkboxHeader: true,
			columns:columns,
			sidePagination:'client',
			rowStyle:function rowStyle(row, index) {
				return {
				   css: { "line-height":"30px"}
				};
			},
			onGeckoClick : function(row, target) {
				if (target.attr('data-role') === 'delete') {
					$('#deal-modal').modal('show')
				} else if (target.attr('data-role') === 'edit') {
						alert(2)
				}
			},
			onLoadSuccess: function(e, index, row, $detail){
				$('[data-rel=tooltip]').tooltip();
			}
	});
	}
	initTable();
	
	var gridHeight = $(window).height() - ($('.breadcrumbs').height() + 25);
	var pageSize = Math.floor(gridHeight / 23);

	var impower = function(event){}
});
