
 <%@include file="../include/ent_include.jsp"%><!--静态包含--> 
<html>
<head>
</head>
<body>

		<style>
			body {
				background-color:white; 
			}
		</style>

	<div id="labelInfo">
		
	</div>
</body>
</html>
<script>
 function showUnreadNews(){
 	
 	//alert(productId);
  			$.ajax({
                type: "GET",
                url: "/tax/alproduct/reciveDate?productId",
                dataType: "json"
            });
}

function showDate(){
	var productId = window.parent.document.getElementById("productId").value;
 	var spec = window.parent.document.getElementById("productSpec").value;
 	var flagStatus = window.parent.document.getElementById("flagStatus").value;
 	if(flagStatus=="start"){
 		$.ajax({
				type: "GET",
                url: "/tax/alproduct/showDate?productId="+productId+"&spec="+spec,
                dataType: "json",
                success: function(msg) {
                	//alert(111);
                	$("#labelInfo").html("");
               		$.each(msg,function(index,value){
	               		if(index%(spec*1+1)==0){
	               			$("#labelInfo").append("<span>"+value.split("@")[0]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.split("@")[1]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span>"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/tax/alproduct/deleteCollection?winelable="+value.split("@")[0]+"'>删除</a><br>");
					
	               		}else{
	               			$("#labelInfo").append("<span>"+value.split("@")[0]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓶标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.split("@")[1]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span><br>");
	               		}
     				});
                }
            });
 	}
		
}
$(document).ready(function() {
		
		showUnreadNews();
       setInterval('showDate()',8000);
});
    
</script>