/**
 * ent-ententbasic
 */
$(function () {
   
function view(obj){
	console.log(obj)
	if(obj.producepermissionurl!=null){
		
		$("#producepermissionurlDiv").html('<img name="producepermissionurl" src="'+accPath+"/"+obj.producepermissionurl+'" height="55%" width="100%"/>');
	}
	if(obj.importpermissionurl!=null){
		
		$("#importpermissionurlDiv").html('<img name="producepermissionurl" src="'+accPath+"/"+obj.importpermissionurl+'" height="55%" width="100%"/>');
	}
	if(obj.sellpermissionurl!=null){
		
		$("#sellpermissionurlDiv").html('<img name="sellpermissionurl" src="'+accPath+"/"+obj.sellpermissionurl+'" height="55%" width="100%"/>');
	}
	if(obj.businesspermissionurl!=null){
		
		$("#businesspermissionurlDiv").html('<img name="businesspermissionurl" src="'+accPath+"/"+obj.businesspermissionurl+'" height="55%" width="100%"/>');
	}
	if(obj.licenseattach!=null){
		$("#licenseattachDiv").html('<img name="licenseattach" src="'+accPath+"/"+obj.licenseattach+'" height="150%" width="85%"/>');
	}
	$("[name='creditcode1']").val(obj.creditcode);
	$("[name='entname1']").val(obj.entname);
	$("[name='address']").val(obj.address);
	$("[name='tel']").val(obj.tel);
	$("[name='bank']").val(obj.bank);
	$("[name='acct']").val(obj.acct);   
	$("[name='contacts']").val(obj.contacts);
	$("[name='contactphone']").val(obj.contactphone);
	$("[name='email']").val(obj.email);
//	$("#creditcode").html(obj.creditcode);
	$("#myDetailModal").modal("show");
}
function editStatus(obj){
	
	$("[name='creditcode1']").val(obj.creditcode);
	$("[name='entname1']").val(obj.entname);
	$("[name='address']").val(obj.address);
	$("[name='tel']").val(obj.tel);
	$("[name='bank']").val(obj.bank);
	$("[name='acct']").val(obj.acct);  
	$("#editEntId").val(obj.id);
	$("#editStatus").modal("show");
}
});