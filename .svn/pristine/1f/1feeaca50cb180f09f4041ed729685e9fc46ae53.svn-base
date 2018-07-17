
$(function(){
	 $.ajax({  
        type : "GET",  //提交方式  
        url : "http://127.0.0.1:8080/gecko.framework/druid/datasource.json",//路径  
        dataType:"jsonp",
        jsonp: "jsoncallback",
        success:function(data) {//返回数据根据结果进行相应的处理  
            var contets = data.Content;
            var tabs = '';
            var tabContents = '';
            for (var i = 0; i < contets.length; i++) {
                var content = contets[i];
                if(i ==0){
                	content.first=true;
                }else{
                	content.first=false;
                }
                var tabTemplate = Handlebars.compile($('#dataorgin-tab-template').html());
                tabs += tabTemplate(content);

                var tabContentTemplate = Handlebars.compile($('#dataorgin-tab-content-template').html());
                tabContents += tabContentTemplate(content);
            };
            $('#datasource-tabs').html(tabs);
            $('#datasource-tabs-content').html(tabContents);
			// $('#table-data').html(template(dataText));           
        }  
   }); 
})
