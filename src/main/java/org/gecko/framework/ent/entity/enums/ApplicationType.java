package org.gecko.framework.ent.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * 
 * 
 * 申请类型枚举
 * @author niupanfeng
 * @date 2017年4月26日 上午10:02:05
 *
 */
public enum ApplicationType implements IGeckoEnum {

	WINELABELS(1, "酒标申请"), ENTINFO(3, "企业信息申请");
	private int key;
	private String value;

	private ApplicationType(int key, String value) {
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
