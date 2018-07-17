
<html>
<head>
		<%@include file="../../include/notice_include.jsp"%><!--静态包含--> 
		
    <script src="../../../static/scripts/notice/mgnotice/mgnotice.js"></script>
    

</head>
<body >
		<style>
			body {
				background-color:white; 
			}
		</style>

		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								
							</li>

							
						</ul><!-- /.breadcrumb -->

						
		</div>

    <div class="page-content" style="heigh:100%">
    		<div class="tabbable">
											<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
												<li class="active">
													<a data-toggle="tab">公告录入</a>
												</li>

											</ul>


        <div class="tab-content">
				
        <table id="table1"  class="table table-hover">
            <tbody class="form-inline">
            <tr class="table-bordered">
                <td colspan="2" class=" table-bordered">新增公告</td>

            </tr>
            <tr class="table-bordered">
                <td width="30%" class=" table-bordered" align="right">编号</td>
                <td width="70%" class=" table-bordered">

                    <input type="text" id="serialno" readonly="readonly" style="width:98%"/>
                </td>
            </tr>
            <tr class="table-bordered">
                <td width="30%" class=" table-bordered" align="right">标题</td>
                <td width="70%" class=" table-bordered">
                    <input type="text" id="title" style="width:98%"/>
                </td>
            </tr>
            <tr class="table-bordered">
                <td width="30%" class=" table-bordered" align="right">发布范围</td>
                <td width="70%" class=" table-bordered">
                    <select id="scope">
                        <option selected="true" value="0">本级</option>
                        <option value="1">本下级</option>

                    </select>
                </td>
            </tr>
            <tr class="table-bordered">
                <td width="30%" class=" table-bordered" align="right">内容</td>
                <td width="70%" class=" table-bordered">
                    <input type="text" id="content" style="width:98%"/>
                </td>
            </tr>
            <tr class="table-bordered">
                <td width="30%" class=" table-bordered" align="right">附件上传</td>
                <td width="70%" class=" table-bordered">
                	<input name="uploadFile" type="file" id="uploadFile" />
                </td>
            </tr>
            </tbody>
        </table>
        <table width="100%">
            <tbody>
            <tr><td> &nbsp;</td></tr>
            <tr>
                <td align="center">
                    <button type="button" class="btn btn-lg btn-primary" onclick="publish()">发&nbsp;&nbsp;&nbsp;布</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-lg btn-primary" onclick="save()">保&nbsp;&nbsp;&nbsp;存</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-lg btn-light" onclick="resetInput()">重&nbsp;&nbsp;&nbsp;置</button>
                </td>
            </tr>
            </tbody>
        </table>
        </div>
        </div>
    </div>
    
    <script>
    	$(document).ready(function(){
  			$("#serialno").val(generateSerialNo());
			});
    
    </script>
</body>
</html>
