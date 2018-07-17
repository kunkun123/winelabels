<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>

<script>
	//酒标销售确认
	var iframesrc1= "http://localhost:8010/iData/vision/openresource.jsp?user=admin&password=manager&resid=I297edff815b2411f016242230dce60a5";
	//酒标应税确认
	var iframesrc2= "http://localhost:8010/iData/vision/openresource.jsp?user=admin&password=manager&resid=I297edff815b2411f01624223c9aa60c2";
	//纳税申报
	var iframesrc3= "http://localhost:8010/iData/vision/openresource.jsp?resid=I297edff815b2411f0162422140a7605b&user=admin&password=manager";
</script>
	<div style="width:49%; height:278px;float:left;">
		
		<div style="width: 99%; height:99%;">
			<iframe id="analysisTable3"
				style="padding: 0px; width: 99%; height:199%; overflow-y : hidden;"
				></iframe>
		</div>
	</div>
	<div style="width:49%; height:278px;float:right;">
		<div style="width:99%; height:99%;">
			
			<iframe id="analysisTable1"
				style="padding: 0px; width: 99%; height:99%; overflow-y : hidden;"
				></iframe>
		</div>
		<div style="width: 99%; height:99%;">
			<iframe id="analysisTable2"
				style="padding: 0px; width: 99%; height:99%; overflow-y : hidden;"
				></iframe>
		</div>
	</div>
<script>
	var iframe1 = document.getElementById("analysisTable1");
	iframe1.src = iframesrc1;
	var iframe2 = document.getElementById("analysisTable2");
	iframe2.src = iframesrc2;
	var iframe3 = document.getElementById("analysisTable3");
	iframe3.src = iframesrc3;
</script>


</body>
</html>	