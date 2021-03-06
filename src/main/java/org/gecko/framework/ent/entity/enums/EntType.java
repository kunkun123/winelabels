package org.gecko.framework.ent.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * 
 * 
 * 企业类型枚举
 * @author niupanfeng
 * @date 2017年4月26日 上午10:02:05
 *
 */
public enum EntType implements IGeckoEnum {

	MA(1, "生产企业"), BU(2, "销售企业");
	private int key;
	private String value;

	private EntType(int key, String value) {
		this.key = key;
		this.value = value;
	}

	@Override
	public int getKey() {
		return key;
	}

	@Override
	public String getValue() {
		return value;
	}
}
