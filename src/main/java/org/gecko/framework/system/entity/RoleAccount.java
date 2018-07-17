package org.gecko.framework.system.entity;

import org.gecko.framework.base.BaseEntity;

public class RoleAccount extends BaseEntity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 786655669408246710L;
	private String roleId;
    private String accountId;
    private String id;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
