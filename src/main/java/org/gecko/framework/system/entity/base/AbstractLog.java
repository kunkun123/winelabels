package org.gecko.framework.system.entity.base;

import org.codehaus.jackson.map.annotate.JsonDeserialize;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.common.utils.JsonTimeDeserializer;
import org.gecko.common.utils.JsonTimeSerializer;
import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.system.entity.enums.LogLevel;

import java.sql.Timestamp;

public abstract class AbstractLog extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@GeckoField(fieldType = FieldType.BIGDATA, description = "内容")
	private String content;

	@GeckoField(fieldType = FieldType.STRING, description = "当前用户")
	private String currentUserName;

	@GeckoField(fieldType = FieldType.STRING, description = "IP", nullable = true)
	private String ip;

	@GeckoField(fieldType = FieldType.ENUM, description = "日志级别", searchable = true)
	private LogLevel logLevel = LogLevel.INFO;

	@GeckoField(fieldType = FieldType.DATETIME, description = "记录时间", searchable = true)
	private Timestamp recordTime = new Timestamp(System.currentTimeMillis());

	@GeckoField(fieldType = FieldType.STRING, description = "访问地址", searchable = true)
	private String requestUrl;

	@GeckoField(fieldType = FieldType.STRING, length = 2000, nullable = true, description = "参数", searchable = true)
	private String requestParams;

	@GeckoField(fieldType = FieldType.BIGDATA, nullable = true, description = "返回值", searchable = true)
	private String returnValue;

	@GeckoField(fieldType = FieldType.STRING, nullable = true, length = 500, description = "方法", searchable = true)
	private String callMethod;

	public String getRequestParams() {
		return requestParams;
	}

	public void setRequestParams(String requestParams) {
		this.requestParams = requestParams;
	}

	public String getReturnValue() {
		return returnValue;
	}

	public void setReturnValue(String returnValue) {
		this.returnValue = returnValue;
	}

	public String getCallMethod() {
		return callMethod;
	}

	public void setCallMethod(String callMethod) {
		this.callMethod = callMethod;
	}

	public String getRequestUrl() {
		return requestUrl;
	}

	public void setRequestUrl(String requestUrl) {
		this.requestUrl = requestUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCurrentUserName() {
		return currentUserName;
	}

	public void setCurrentUserName(String currentUserName) {
		this.currentUserName = currentUserName;
	}

	public LogLevel getLogLevel() {
		return logLevel;
	}

	public void setLogLevel(LogLevel logLevel) {
		this.logLevel = logLevel;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@JsonSerialize(using = JsonTimeSerializer.class)
	@JsonDeserialize(using = JsonTimeDeserializer.class)
	public Timestamp getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}

}
