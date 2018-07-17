package org.gecko.framework.ent.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * 
 * 
 * 商品种类枚举
 * @author niupanfeng
 * @date 2017年4月26日 上午10:02:05
 *
 */
public enum ProductType implements IGeckoEnum {

	SPIRIT(1, "白酒"), BEER(2, "啤酒"),   YELLOWWINE (3, "黄酒"), OTHERS(4, "其他酒");

	private int key;
	private String value;

	private ProductType(int key, String value) {
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
