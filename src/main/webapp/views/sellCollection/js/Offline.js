
var offline_current_status = function (){
	var portletsStatusMap = {};
	var portletsExtendStatusMap = {};
	return {
		getPanelIdByPid: function(pid) { 
			var panelIds = new Array(); //这个地方是个数组
			for (var key in offline_rmis_map) {
				var defaultStatus = offline_rmis_map[key].defaultStatus;
				if (defaultStatus) {
					if (defaultStatus[pid]) {
						panelIds.push(offline_rmis_map[key].parameterPanelClientId);
					}
				}
			}
			return panelIds;
		},
		setParamValue: function(params) {
			for (var key in offline_rmis_map) {
				var portlet = offline_rmis_map[key];
				if (portlet.parameterPanelClientId == params[0]) {
					var portletStatus = portletsStatusMap[key];
					if (!portletStatus) {
						portletsStatusMap[key] = portletStatus = portlet.defaultStatus;
					}
					portletStatus[params[1]] = params[2];
					break;
				}
			}
		},
		directToPage: function(params) {
			var portletStatus = portletsExtendStatusMap[params[0]];
			if (!portletStatus) {
				portletsExtendStatusMap[params[0]] = portletStatus = {};
			}
			portletStatus.page = params[1];
		},
		getResult: function(data) {
			var DEFAULT_VALUE = "className=ParameterPanelService&methodName=getParamDefaultValue&params=";
			var STANDBY_VALUE = "className=ParameterPanelService&methodName=getParamStandbyValue&params=";
			var params = null;
			if (data.indexOf(DEFAULT_VALUE) == 0) {
				params = data.substring(DEFAULT_VALUE.length);
			}
			if (data.indexOf(STANDBY_VALUE) == 0) {
				params = data.substring(STANDBY_VALUE.length);
			}

			if (params) {
				params = eval("(" + decodeURIComponent(params) + ")");
				for (var key in offline_rmis_map) {
					var portlet = offline_rmis_map[key];
					if (portlet.parameterPanelClientId == params[0]) {
						var relate = portlet.relateParam[params[1]];
						if (!relate)
							continue;
						var paramKey = {};
						var portletsStatus = portletsStatusMap[key];
						if (portletsStatus) {
							for (var i = 0; i < relate.length; i++) {
								var id = relate[i];
								paramKey[id] = portletsStatus[id];
							}
							var lang = jsloader.resolve('freequery.lang.lang');
							var statusRmiMap = portlet[lang.toJSONString(paramKey)];
							return statusRmiMap[data];
						}
					}
				}
			}
			
			var OLAP_REFRESH_DEFINE = "className=OlapQueryClientService&methodName=refreshDefine&params=";
			if (data.indexOf(OLAP_REFRESH_DEFINE) == 0) {
				params = data.substring(OLAP_REFRESH_DEFINE.length);
				params = eval("(" + decodeURIComponent(params) + ")");
				var paging = portletsExtendStatusMap[params[0]];
				if (paging) {
					var portlet = offline_rmis_map[params[0]];
					var ret = portlet["Paging." + paging.page][data];
					if (ret)
						return ret;
				}
			}
			
			for (var key in offline_rmis_map) {
				if (key == "default")
					continue;
				var status = portletsStatusMap[key];
				var portletRmiMap = offline_rmis_map[key];
				var ret = null;
				if (status) {
					var lang = jsloader.resolve('freequery.lang.lang');
					var statusRmiMap = portletRmiMap[lang.toJSONString(status)];
					if (statusRmiMap)
						ret = statusRmiMap[data] || portletRmiMap[data];
					else
						ret = portletRmiMap[data];
				} else {
					ret = portletRmiMap[data];
				}
				if (ret)
					return ret;
			}
			return window.offline_rmis_map['default'][data];
		}
	}
}();

window.bof_offline_xhr = function() {
	return {
		debug :false,  //是否处于调试模式
		setRequestHeader: function() {
		},
		open: function(method, url, async) {
		try {
			if (method == "GET") {
				this.responseText = window.bof_offline_resources[url];
				if (url == "version.txt") {
					this.status = 404;
					return;
				} else if (url.indexOf("gbk.jsp?name=vision/") == 0) {
					this.responseText = window.bof_offline_resources[url.substring("gbk.jsp?name=vision/".length)];
				} else if (url.indexOf("gbk.jsp?names=") == 0) {
					var names = url.substring("gbk.jsp?names=".length).split(",");
					var content = new Array();
					for (var i = 0; i < names.length; i++) {
						var name = "js/" + names[i].replace(new RegExp('\\.', "g"), '/') + ".js";
						content.push(window.bof_offline_resources[name]);
					}
					this.responseText = content.join("!@#$%^&*()");
				} else if (url.indexOf("GetDpFusionChartXml?") == 0) {
					var index = "GetDpFusionChartXml?clientId=".length;
					var clientId = url.substring(index, url.indexOf('&', index));
					this.responseText = window.bof_offline_resources["GetDpFusionChartXml?clientId=" + clientId];
				} else if (url.indexOf("ReportServer?op=simplewrite__readcontent") >= 0) {   //用于复杂报表切参数后，换数据内容
					this.responseText = offline_current_status.getResult("simplewrite__readcontent");
				} else if (!this.responseText) {
					if (url.indexOf("GetDpFusionChartXml?") == 0) {
						url = url.replace(new RegExp("dpRequestIndex=\\d+"), "");
						this.responseText = window.bof_offline_rmis[url];
					} else {
						//debugger;
					}
				}
				
				if (!this.responseText) {
					//没有响应
					debugger;
					document.body.innerHTML = "";
					document.body.appendChild(document.createTextNode(url));
				}
			} else {
				this.url = url;
			}
		} catch(e) {
			debugger;
			throw e;
		}
		},
		send: function(data) {
		try {
			if (this.url && this.url.indexOf("QueryView.jsp?queryId=") == 0) {
				var index = this.url.indexOf("&");
				var url = this.url.substring(0, index);
				for (var key in offline_rmis_map) {
					var portlet = offline_rmis_map[key];
					var ret = portlet[url];
					if (ret) {
						this.responseText = ret;
						return;
					}
				}
			}
			if (this.url && this.url.indexOf("Chart.jsp?queryId=") == 0) {
				var index = this.url.indexOf("&");
				var url = this.url.substring(0, index);
				for (var key in offline_rmis_map) {
					var portlet = offline_rmis_map[key];
					var ret = portlet[url];
					if (ret) {
						this.responseText = ret;
						return;
					}
				}
			}
			if (this.url && data) {
				if (window.console)
					console.log("RMI DATA: " + data);
				this.responseText = offline_current_status.getResult(data);//window.offline_current_rmis[data] || window.window.offline_rmis_map['default'][data];
				if (!this.responseText)
				{
					var index = data.indexOf("&");
					var className = data.substring("className=".length, index);
					index += "&methodName=".length;
					var methodName = data.substring(index, data.indexOf('&', index));
					var params = eval("(" + decodeURIComponent(data.substring(data.indexOf("params=") + "params=".length)) + ")");
					if (className == "CompositeService" && methodName == "setParamValues") {
						var retList = [];
						for (var x = 0; x < params[1].length; x++) {
							var p = params[1][x];
							var newParam = [params[0], p.id, p.value, p.displayValue];
							var newParamStr = lang.toJSONString(newParam);
							this.send("className=ParameterPanelService&methodName=setParamValue&params=" + encodeURIComponent(newParamStr));
							var r = eval("(" + this.responseText + ")").result;
							retList.push({
								"serviceName":"ParameterPanelService",
								"methodName":"setParamValue",
								"params":newParam,
								"result":r
							});
						}
						this.responseText = lang.toJSONString({retCode:0, result:retList});
						return;
					}else if (className == "CompositeService" && methodName == "complexReportSetParamsByParamPanel") {
						for (var x = 0; x < params[0].length; x++) {
							var p = params[0][x];
							var panelIds = offline_current_status.getPanelIdByPid(p.id);
							for (var y= 0; y<panelIds.length;y++) {
								var panelId = panelIds[y];
								var newParam = [panelId, p.id, p.value, p.displayValue];
								var newParamStr = lang.toJSONString(newParam);
								this.send("className=ParameterPanelService&methodName=setParamValue&params=" + encodeURIComponent(newParamStr));
							}
						}
						this.responseText = offline_current_status.getResult(data);
					}
					
					offline_current_status.getResult(data);
					this.responseText = "{retCode:'OFFLINE_UNSUPPORT', detail:\"OFFLINE_UNSUPPORT:" 
									+ data.substring(0, data.indexOf("&params=")) + "\"}";
					if (window.console)
						console.log("RMI ERROR: OFFLINE_UNSUPPORT:" + data.substring(0, data.indexOf("&params=")));
				}
				var SET_PARAM_DELIM = "className=ParameterPanelService&methodName=setParamValue&params=";
				if (data.indexOf(SET_PARAM_DELIM) == 0) {
					var paramStr = decodeURIComponent(data.substring(SET_PARAM_DELIM.length));
					var param = eval("(" + paramStr + ")");
					offline_current_status.setParamValue(param);
				}
				var OLAP_PAGE = "className=OlapQueryClientService&methodName=directToPage&params=";
				if (data.indexOf(OLAP_PAGE) == 0) {
					var paramStr = decodeURIComponent(data.substring(SET_PARAM_DELIM.length));
					var param = eval("(" + paramStr + ")");
					offline_current_status.directToPage(param);
				}
			}
			var that = this;
			setTimeout(function() {
				if (that.onreadystatechange) {
					that.onreadystatechange();
				}
			}, 120);
		} catch(e) {
			debugger;
			throw e;
		}
		},
		abort: function() {
		},
		readyState: 4,
		status: 200,
		responseText: ''
	};
}