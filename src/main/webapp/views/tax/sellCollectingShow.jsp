
 <%@include file="../include/ent_include.jsp"%><!--静态包含--> 
<html>
<head>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"54182",secure:"54187"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-132" data-genuitec-path="/wineLabels/src/main/webapp/views/tax/sellCollectingShow.jsp">

		<style data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-132" data-genuitec-path="/wineLabels/src/main/webapp/views/tax/sellCollectingShow.jsp">
			body {
				background-color:white; 
			}
		</style>

	<div id="labelInfo">
		
	</div>
</body>
</html>
<script>
function showDate(){
	var productId = window.parent.document.getElementById("productId").value;
 	var spec = window.parent.document.getElementById("spec").value;
		$.ajax({
				type: "GET",
                url: "/tax/alproduct/showDate?productId="+productId+"&spec="+spec,
                dataType: "json",
                success: function(msg) {
                	$("#labelInfo").html("");
               		$.each(msg,function(index,value){
	               		if(index%(spec*1+1)==0){
	               			$("#labelInfo").append("<span>"+value
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+getNowFormatDate()
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span><br>");
					
	               		}else{
	               			$("#labelInfo").append("<span>"+value
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓶标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+getNowFormatDate()
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span><br>");
	               		}
     				});
                }
            });
}
$(document).ready(function() {
	var a = $(window.parent.document.getElementById("serial"));
	var b = $(window.parent.document.getElementById("belowent1"));
	var c=0;
	$("#serial",parent.document).bind("input propertychange change",function(event){
		//alert(a.val().length);
       if(a.val().length==50 && c==0){
       var belowEntId = b.val();
       var winelabels = a.val().split('=')[1];
	   //alert(winelabels);
	   c=1;
	   setTimeout(function(){c=0},100);
       $.ajax({
				type: "GET",
                url: "/tax/alcirculation/saleCollection?winelabels="+winelabels+"&belowEntId="+belowEntId,
                dataType: "json",
                success: function(msg) {
               		$.each(msg,function(index,value){
               			
	               		if(value.type=="BOX"){
	               			$("#labelInfo").append("<span>"+winelabels
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+getNowFormatDate()
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span><br>");
					
	               		}else{
	               			$("#labelInfo").append("<span>"+winelabels
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓶标"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+getNowFormatDate()
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span><br>");
	               		}
     				});
     				a.val("");
                }
            });}
	});
});
    
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}    
</script>