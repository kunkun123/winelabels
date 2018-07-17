$(function(){
	$.ajax({  
        type : "GET",  //提交方式  
        url : "http://127.0.0.1:8080/gecko.framework/druid/weburi.json",//路径  
        dataType:"json",
        success:function(data) {//返回数据根据结果进行相应的处理  
	        var dataText= data.Content;
			var template = Handlebars.compile($('#points-template').html());
			$('#table-data').html(template(dataText));
       	}   
 	});
 		var roleColumns=[{
			field: 'id',
			title: 'N',
			align : 'center',
		}, {
			field: 'name',
			title: 'URL',
			align : 'left'
		}, {
			field: 'Num',
			title: '请求次数',
			align : 'left'
		},{
			field: 'time',
			title: '请求时间',
			align : 'left'
		},{
			field: 'latest',
			title: '执行中',
			align : 'left'
		},{
			field: 'email',
			title: '最大并发',
			align : 'left'
		},{
			 field : 'newUpdate',
	         title : 'Jdbc执行数',
	         align : 'center',
	},{
			 field : 'readRow',
	         title : 'Jdbc出错数',
	         align : 'center',
	},{
			 field : 'executory',
	         title : 'Jdbc时间',
	         align : 'center',
	},{
			 field : 'max',
	         title : '事务提交数',
	         align : 'center',
	},{
			 field : 'timeDistribute',
	         title : '事务回滚数',
	         align : 'center',
	},{
			 field : 'executoryRS',
	         title : '读取行数',
	         align : 'center',
	},{
			 field : 'rowDistribute',
	         title : '更新行数',
	         align : 'center',
	},{
			 field : 'updateDistribute',
	         title : '区间分布',
	         align : 'center',
	},]
  
		var roleTable =$('#tb').bootstrapTable({
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
		
		
		
		
		
		var sqlColumns=[{
			field: 'id',
			title: 'N',
			align : 'center',
		}, {
			field: 'name',
			title: 'URL',
			align : 'left'
		}, {
			field: 'Num',
			title: '请求次数',
			align : 'left'
		},{
			field: 'time',
			title: '请求时间',
			align : 'left'
		},{
			field: 'latest',
			title: '执行中',
			align : 'left'
		},{
			field: 'email',
			title: '最大并发',
			align : 'left'
		},{
			 field : 'newUpdate',
	         title : 'Jdbc执行数',
	         align : 'center',
	},{
			 field : 'readRow',
	         title : 'Jdbc出错数',
	         align : 'center',
	},{
			 field : 'executory',
	         title : 'Jdbc时间',
	         align : 'center',
	},{
			 field : 'max',
	         title : '事务提交数',
	         align : 'center',
	},{
			 field : 'timeDistribute',
	         title : '事务回滚数',
	         align : 'center',
	},{
			 field : 'executoryRS',
	         title : '读取行数',
	         align : 'center',
	},{
			 field : 'rowDistribute',
	         title : '更新行数',
	         align : 'center',
	},{
			 field : 'updateDistribute',
	         title : '区间分布',
	         align : 'center',
	},]
  
		var sqlTable =$('#sql-wall').bootstrapTable({
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
			columns:sqlColumns 
		});
		
		
		var callFunction=[{
			field: 'id',
			title: 'N',
			align : 'center',
		}, {
			field: 'name',
			title: 'URL',
			align : 'left'
		}, {
			field: 'Num',
			title: '请求次数',
			align : 'left'
		},{
			field: 'time',
			title: '请求时间',
			align : 'left'
		},{
			field: 'latest',
			title: '执行中',
			align : 'left'
		},{
			field: 'email',
			title: '最大并发',
			align : 'left'
		},{
			 field : 'newUpdate',
	         title : 'Jdbc执行数',
	         align : 'center',
	},{
			 field : 'readRow',
	         title : 'Jdbc出错数',
	         align : 'center',
	},{
			 field : 'executory',
	         title : 'Jdbc时间',
	         align : 'center',
	},{
			 field : 'max',
	         title : '事务提交数',
	         align : 'center',
	},{
			 field : 'timeDistribute',
	         title : '事务回滚数',
	         align : 'center',
	},{
			 field : 'executoryRS',
	         title : '读取行数',
	         align : 'center',
	},{
			 field : 'rowDistribute',
	         title : '更新行数',
	         align : 'center',
	},{
			 field : 'updateDistribute',
	         title : '区间分布',
	         align : 'center',
	},]
  
		var functionTable =$('#function-table').bootstrapTable({
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
			columns:callFunction 
		});
	
});














