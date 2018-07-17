
 <%@include file="../../include/ent_include.jsp"%><!--静态包含--> 
<html>
<head>
   
    <script src="../../../static/scripts/ent/ententbasic/ententbasic.js"></script>
   
</head>
<body>

		<style>
			body {
				background-color:white; 
			}
		</style>



            <!--modal-body部分-->
            <div class="modal-body" style="height:35%">
            	<form role="form" class="form-horizontal" style="width:60%;height:60%" id="enttypeFormDetail">
            		<div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">统一社会信用代码</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.creditcode}" class="form-control" name="creditcode1" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">企业名称</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.entname}" class="form-control" name="entname1" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">地址</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.address}" class="form-control" name="address" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">电话</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.tel}" class="form-control" name="tel" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">开户银行</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.bank}" class="form-control" name="bank" readonly/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="firstname" class="col-sm-4 control-label">银行账号</label>
						    <div class="col-sm-6">
						      <input type="text" value="${entBasic.acct}" class="form-control" name="acct" readonly/>
						    </div>
						  </div>
	                </form>
	               
	                <div style="margin-left:60%;margin-top:-10%;width:40%;" id="licenseattachDiv">
	                	<img name="licenseattach" src="${entBasic.licenseattach}" height="150%" width="45%"/>
					</div>
	                <br/><br/><br/>
	                 <form role="form" class="form-horizontal" style="margin-left:5%;width:90%;height:100%" id="enttypeFormDetail">
            			<div class="form-group">
            			<c:forEach items="${permissUrl}" var="t" varStatus="status">  
						   <div class="col-sm-3" id="permissionurlDiv">
						  
						     <img name="permissionurl" src="${t}" height="65%" width="85%"/>
						    </div>
						</c:forEach>  
						   
						 </div>
					</form>
	               
					
					<form role="form" class="form-inline"style="margin-left:5%;margin-top:0%;width:80%;height:10%" id="enttypeFormDetail">
						联系方式：<br>
						<div class="form-group">
							<label for="f1">联系人：</label> <input style="border: 0px;outline:none;width:20%" type="text" name="contacts"
								class="form-control" value="${entBasic.contacts}" readonly/>
						
							<label for="f2">联系电话：</label> <input style="border: 0px;outline:none;width:20%" type="text" name="contactphone"
								class="form-control" value="${entBasic.contactphone}" readonly/>
						
							<label for="f3" >电子邮箱：</label> <input style="border: 0px;outline:none;width:20%" type="text" name="email"
								class="form-control" value="${entBasic.email}" readonly/>
						</div>
					</form>
				</div>
           
   

</body>
</html>