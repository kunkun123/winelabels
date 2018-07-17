package org.gecko.framework.system.entity;

import org.gecko.framework.base.BaseEntity;

public class RoleAuthority extends BaseEntity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 786655669408246710L;
	private String roleId;
    private String authorityId;
    private String id;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(String authorityId) {
        this.authorityId = authorityId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
