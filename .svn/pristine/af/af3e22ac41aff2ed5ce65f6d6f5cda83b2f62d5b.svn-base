package org.gecko.framework.system.entity.enums;

import org.gecko.core.enums.IGeckoEnum;

/**
 * AuthorityType
 * 权限类型
 *
 * @author niupanfeng
 * @date 2017年4月26日 上午11:39:21
 */
public enum RoleType implements IGeckoEnum {

    /**
     * 系统
     */
    SYSTEM(-1, "SYSTEM"),

    ADMIN(1, "ADMIN"),//系统管理员，最高权限

    SUPERADMIN(0, "SUPERADMIN"),//系统管理员，最高权限

    /**
     * 用户自定义
     */
    CUSTOM(20, "CUSTOM");

    private int key;
    private String value;

    RoleType(int key, String value) {
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
