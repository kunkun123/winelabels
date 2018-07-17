package org.gecko.framework.system.repository.dao;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.system.entity.Role;
import org.gecko.framework.system.entity.RoleAccount;

import java.util.List;

/**
 * 
 * RoleDao
 * 角色数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
@GECKOBatis
public interface RoleDao extends IGeckoBaseDao<Role> {

    List<Role> getRoles(@Param("accountId") String accountId);
    List<Role> getRolesByName(String roleName);
    List<Integer> roleType(String accountId);
	int batchSaveAccount2Role(List<RoleAccount> roleAccountList);
	int batchDeleteAccount2Role(@Param("roleId")String roleId, @Param("list")List<RoleAccount> roleAccountList);
}
