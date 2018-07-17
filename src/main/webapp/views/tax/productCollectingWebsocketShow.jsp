
 <%@include file="../include/ent_include.jsp"%><!--éæåå«--> 
<html>
<head>
</head>
<body>

		<style>
			body {
				background-color:white; 
			}
		</style>

	<div id="message">
		
	</div>
</body>
</html>
<script>
 	var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8008/websocket/socketServer.do");
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
        //setMessageInnerHTML("WebSocket连接成功");
    }
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
    	var info = event.data.split(",");
    	var html = "";
    	//http://192.168.0.100/F?C=892NMJH235157381309979841=2018-07-12 04:11:50,
    	//http://192.168.0.100/F?C=SHD8123NM5157376872018701=2018-07-12 04:11:50,
    	//http://192.168.0.100/F?C=892NMJH2351573813100148c0=2018-07-12 04:11:50,
    	//http://192.168.0.100/F?C=N4F2N12435157381195266600=2018-07-12 04:11:50,
    	//http://192.168.0.100/F?C=N4F2N124351573811953335c0_=2018-07-12 04:11:50
    	for (var i = 0; i <info.length-1; i++){
	    	if(info[i].indexOf("_") == -1){
	    		 var winelabelArr = info[i].split("=");
			    html += "<span>"+winelabelArr[1]
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瓶标"
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+winelabelArr[2]
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span>"
     					//+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/tax/alproduct/deleteCollection?winelable="++winelabelArr[1]+"'>删除</a><br>");
					
	    	}else{
	    	 var winelabelArr = info[i].split("=");
			    html += "<span>"+winelabelArr[1]
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱标"
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+winelabelArr[2].replace("_","");
	     				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫描成功</span>"
	    	}
		   
		}
        setMessageInnerHTML(html);
    }

    //连接关闭的回调方法
    websocket.onclose = function () {
        //setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('message').innerHTML = innerHTML + '<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function send() {
        var message = document.getElementById('text').value;
        websocket.send(message);
    }
 function showUnreadNews(){
 	
 	//alert(productId);
  			$.ajax({
                type: "GET",
                url: "/tax/alproduct/reciveWebsocketDate?productId",
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
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ç®±æ "
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.split("@")[1]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;æ«ææå</span>"
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/tax/alproduct/deleteCollection?winelable="+value.split("@")[0]+"'>å é¤</a><br>");
					
	               		}else{
	               			$("#labelInfo").append("<span>"+value.split("@")[0]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ç¶æ "
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.split("@")[1]
     					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;æ«ææå</span><br>");
	               		}
     				});
                }
            });
 	}
		
}
$(document).ready(function() {
		
		showUnreadNews();
       //setInterval('showDate()',8000);
});
    
</script>