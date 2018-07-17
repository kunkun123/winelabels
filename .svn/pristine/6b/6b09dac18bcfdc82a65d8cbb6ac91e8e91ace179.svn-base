$(function(){
	$( "#datepicker1" ).datepicker({
		showOtherMonths: true,
		selectOtherMonths: false,
	});
	$( "#datepicker2" ).datepicker({
		showOtherMonths: true,
		selectOtherMonths: false,
	});
	var logColumns=[{
			field: 'id',
			title: '',
			align : 'center',
			checkbox:false,
			width:40
		}, {
			 field : 'operate',
             title : '级别',
             align : 'center',
             events : impower,
             formatter : operateFormatter,
             width:20
		},{
			field: 'name',
			title: '姓名',
			align : 'left'
		}, {
			field: 'sex',
			title: '性别',
			align : 'left'
		},{
			field: 'account',
			title: '账号',
			align : 'left'
		},{
			field: 'phoneNum',
			title: '手机号',
			align : 'left'
		},{
			field: 'email',
			title: 'email',
			align : 'left'
		},{
			 field : 'operate',
             title : '记录时间',
             align : 'center',
            
	}];
	var logTable = $('#logTable').bootstrapTable({
		url: '../../../data/demo/user.json',
		showHeader:true,
		toolbar:undefined,
		pagination:true,//分页
		pageNumber:1,//如果设置了分页，首页页码
		pageSize:4,//如果设置了分页，页面数据条数
		paginationPreText:'<',
		paginationNextText:'>',
		height:458,//设置表格的高度
		pageList:[10,25,50,100],//如果设置了分页，设置可供选择的页面数据条数
		clickToSelect:true,
		checkboxHeader:false,
		striped:true,
		columns: logColumns
	});
})

var impower = function(){
}
var operateFormatter = function(){
	return "<button style='border:none;outline:none;border-radius:0px;height:20px;line-height:8px;margin-bottom:4px;' class='btn btn-success  btn-sm'>普通</button>";
}


