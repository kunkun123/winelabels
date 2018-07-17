package org.gecko.framework.system.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * 
 * LogLevel
 * 日志级别
 * @author niupanfeng
 * @date 2017年4月25日 下午9:57:36
 *
 */
public enum LogLevel implements IGeckoEnum {

	INFO(1, "info"),

	WARING(2, "warning"),

	ERROR(3, "error"),

	FATAL(4, "fatal");

	@Override
	public int getKey() {
		return key;
	}

	@Override
	public String getValue() {
		return value;
	}

	private int key;
	private String value;

	LogLevel(int key, String value) {
		this.key = key;
		this.value = value;
	}
}
