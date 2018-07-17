package org.gecko.framework.system.repository.dao;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.Authority;

import java.util.List;

/**
 * 
 * AccountDao
 * 账号数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
@GECKOBatis
public interface AccountDao extends IGeckoBaseDao<Account> {

    /**
     * @param userId 账号ID
     * @return List<Authority>  返回类型
     * getAuthoritiesById
     * 根据用户ID获取权限列表
     */
    List<Authority> getAuthoritiesById(String userId);

    Account login(Account account);

    List<Account> accountsByRoleId(@Param("roleId") String roleId, Page<Account> page);

    List<Account> listByOrgId(@Param("orgId") String orgId, Page<Account> page);
}
