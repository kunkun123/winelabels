<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../../include/notice_include.jsp"%><!--静态包含--> 
    
    <script src="../../../static/scripts/notice/mgnotice/mgnotice_list.js"></script>

</head>
<body>
		<style>
			body {
				background-color:white; 
			}
		</style>


<div class="page-content table-responsive">
<form role="form" id="queryForm" action="/notice/mgnotice/noticeListView">
		<table class="table table-hover ">
			<tbody class="form-inline"> 
				<tr class="table-bordered">
					<td class=" table-bordered" style="width:15%" align="right">
						<label class="bolder blue control-label"  for="form-field-1">开始日期：</label>
					</td>
					<td class=" table-bordered" style="width:35%">
						<input name="search"  id="startDate" type="text" class="form-control" width="98%"/>
					</td>
					<td class=" table-bordered" style="width:15%" align="right">
						<label class="control-label bolder blue" for="form-field-1">结束日期：</label>
					</td>
					<td class=" table-bordered" style="width:35%">
						<input name="search" id="endDate" type="text" class="form-control" width="98%"/>
					</td>
				</tr>
				
				<tr class="table-bordered">
					<td class=" table-bordered" style="width:15%" align="right">
						<label class="bolder blue control-label"  for="form-field-1">编号：</label>
					</td>
					<td class=" table-bordered" style="width:35%">
						<input name="search"  id="serial" type="text" class="form-control" width="98%"/>
					</td>
					<td class=" table-bordered" style="width:15%" align="right">
						<label class="control-label bolder blue" for="form-field-1">标题：</label>
					</td>
					<td class=" table-bordered" style="width:35%">
						<input name="search" id="title" type="text" class="form-control" width="98%"/>
					</td>
				</tr>
				<tr id="lessQuery" >
	  			<td  colspan="4"  align="center">
	  			
	 				<button type="button" class="btn btn-lg btn-primary" onclick="query()">查&nbsp;&nbsp;&nbsp;询</button>
	 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 				<button type="button" class="btn btn-lg btn-light" onclick="clearInput()">重&nbsp;&nbsp;&nbsp;置</button>
	 				</td>
	 			</tr> 
			</tbody>
		</table>
</form>
    <table id="mgnoticeTable" class="text-nowrap"></table>
</div>

<!-- 明细Moda窗口 -->
<div class="modal fade" id="myDetailModal" tabindex="-1" role="dialog" aria-labelledby="myDetailModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <i class="normal-icon ace-icon fa fa-user red bigger-130 user-icon"></i>
                <span class="modal-title" style="color: #DD5A43">通知公告</span>
            </div>
            <!--modal-body部分-->
            <div class="modal-body">
                <form id="enttypeFormDetail" class="form-inline">
									
									<table width="99%">
										<tr>
											<td width="95%"><input width="99%" type="text" class="form-control" id="serialnoShow" name="serialnoShow" readonly="readonly"></td>
										</tr>
										<tr>
											<td align="center" id="titleShow"></td>
										</tr>
										<tr>
											<td align="center" id="publicdateShow"></td>
										</tr>
										<tr>
											<td id="contentShow"></td>
										</tr>
									</table>
                    
                   
                </form>

            </div>
            <!--modal-footer部分-->
            <div class="modal-footer" id="modal-footer">
                <button type="button" class="btn btn-primary save" onclick="$('#myDetailModal').modal('hide');">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>