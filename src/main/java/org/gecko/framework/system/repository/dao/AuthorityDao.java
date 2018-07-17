package org.gecko.framework.system.repository.dao;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.system.entity.Authority;
import org.gecko.framework.system.entity.RoleAuthority;

import java.util.List;

/**
 * 
 * AuthorityDao
 * 权限数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
@GECKOBatis
public interface AuthorityDao extends IGeckoBaseDao<Authority> {
    List<Authority> getAuthByAccountId(@Param("accountId") String accountId);

    List<Authority> roleAuth(String roleId);

    int saveRoleAuth(List<RoleAuthority> roleAuthList);

    void deleteByRoleIds(List<String> roleIds);

    List<Authority> getPage(@Param("param") String search, Page<Authority> page);

	String getMaxId();
}
