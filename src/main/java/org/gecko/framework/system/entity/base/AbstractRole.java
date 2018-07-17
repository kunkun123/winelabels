package org.gecko.framework.system.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.framework.system.entity.enums.RoleType;
import org.omg.CORBA.INTERNAL;

/**
 * 
 * AbstractRole
 * 角色
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
public abstract class AbstractRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @GeckoField(fieldType=FieldType.STRING, description="角色名称", searchable=true)
    private String roleName;

    @GeckoField(fieldType=FieldType.STRING, description="角色描述", nullable=true, searchable=true)
    private String description;

    @GeckoField(fieldType=FieldType.ENUM, description="角色类型")
    private RoleType roleType;

    @GeckoField(fieldType=FieldType.INTEGER, description="是否可用")
    private int available;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RoleType getRoleType() {
        return roleType;
    }

    public void setRoleType(RoleType roleType) {
        this.roleType = roleType;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

}
