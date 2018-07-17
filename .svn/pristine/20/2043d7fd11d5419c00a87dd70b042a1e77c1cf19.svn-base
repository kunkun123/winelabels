package org.gecko.framework.ent.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * 
 * 
 * 审核状态枚举
 * @author niupanfeng
 * @date 2017年4月26日 上午10:02:05
 *
 */
public enum AuditingStatus implements IGeckoEnum {

	UN("未通过",1), ON("通过",2),  NE("待审核",3);
	private int key;
	private String value;

	private AuditingStatus(String value, int key) {
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
