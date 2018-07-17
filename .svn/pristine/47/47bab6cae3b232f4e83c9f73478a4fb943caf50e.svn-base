$(function(){
	var roleColumns=[{
			field: 'id',
			title: 'N',
			align : 'center',
		}, {
			field: 'name',
			title: 'SQL',
			align : 'left'
		}, {
			field: 'Num',
			title: '执行数',
			align : 'left'
		},{
			field: 'time',
			title: '执行时间',
			align : 'left'
		},{
			field: 'latest',
			title: '最慢',
			align : 'left'
		},{
			field: 'email',
			title: '事务中',
			align : 'left'
		},{
			 field : 'newUpdate',
	         title : '更新行数',
	         align : 'center',
	},{
			 field : 'readRow',
	         title : '读取行数',
	         align : 'center',
	},{
			 field : 'executory',
	         title : '执行中',
	         align : 'center',
	},{
			 field : 'max',
	         title : '最大病发',
	         align : 'center',
	},{
			 field : 'timeDistribute',
	         title : '执行时间分布',
	         align : 'center',
	},{
			 field : 'executoryRS',
	         title : '执行+RS时分布',
	         align : 'center',
	},{
			 field : 'rowDistribute',
	         title : '读取行分布',
	         align : 'center',
	},{
			 field : 'updateDistribute',
	         title : '更新行分布',
	         align : 'center',
	},]
  
		var roleTable =$('#sqlTable').bootstrapTable({
			url: '/data/demo/user.json',
			showHeader:true,
			toolbar:undefined,
			pagination:true,//分页
			pageNumber:1,//如果设置了分页，首页页码
			pageSize:4,//如果设置了分页，页面数据条数
			paginationPreText:'<',
			paginationNextText:'>',
			height:400,//设置表格的高度
			pageList:[10,25,50,100],//如果设置了分页，设置可供选择的页面数据条数	
			columns:roleColumns 
		});
		
		$('#add-role').click(function(){
			$('#create-role-modal').modal('show');
		});
		
		$('#edit-role').click(function(){
			$('#edit-role-modal').modal('show');
		});
		
		$('#remove-role').click(function(){
			$('#remove-role-modal').modal('show');
		});
});
