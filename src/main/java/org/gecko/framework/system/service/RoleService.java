package org.gecko.framework.system.service;

import org.gecko.common.utils.UuidUtil;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.system.entity.Role;
import org.gecko.framework.system.entity.RoleAccount;
import org.gecko.framework.system.entity.enums.RoleType;
import org.gecko.framework.system.repository.dao.RoleDao;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * RoleService
 * 角色服务接口
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58
 */
@Service("RoleService")
public class RoleService extends BaseGeckoService<Role> {
    @Resource
    RoleDao roleDao;

    public List<Role> tree() {
        List<Role> result = roleDao.find(null);
        return result;
    }

    public List<Role> getRoles(String accountId) {
        return roleDao.getRoles(accountId);
    }

    @Override
    public Role save(Role o) {
        this.update(o);
        return o;
    }

    public int updateField(String name, String value, String pk) {
        return updateField("Role", name, value, pk);
    }

    @Override
    public Role update(Role o) {
        if (o.getRoleType() == null) {
            //o.setRoleType(RoleType.SYSTEM);
        }
        if (o.getDescription() == null) {
            o.setDescription("");
        }
        if (o.getAvailable() == 0) {
            o.setAvailable(1);
        }
        if (o.getRoleName() == null) {
            o.setRoleName("");
        }
        if (StringUtils.isEmpty(o.getId())) {
            o.setId(UuidUtil.get32UUID());
            o.setAvailable(1);
            //o.setRoleType(RoleType.CUSTOM);
            roleDao.save(o);
        } else {
            roleDao.update(o);
        }
        return o;
    }

    public List<Integer> roleType(String accountId) {
        return roleDao.roleType(accountId);
    }
    
    public List<Role> getRolesByName(String roleName){
    	System.out.println(roleName+"-----------------");
    	return roleDao.getRolesByName(roleName);
    }

	public int batchSaveAccountRole(List<RoleAccount> roleAccountList) {
		return roleDao.batchSaveAccount2Role(roleAccountList);
	}

	public int batchDeleteAccount2Role(List<RoleAccount> roleAccountList) {
		String roleId = roleAccountList.get(0).getRoleId();
		return roleDao.batchDeleteAccount2Role(roleId,roleAccountList);
	}
}
