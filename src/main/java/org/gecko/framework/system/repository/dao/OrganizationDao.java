package org.gecko.framework.system.repository.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.system.entity.Organization;

/**
 * 
 * OrganizationDao
 * 机构数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
@GECKOBatis
public interface OrganizationDao extends IGeckoBaseDao<Organization> {

    int saveOrgAcct(@Param("orgId")String orgId, @Param("accountId")String accountId);

	Organization getOrganizationByAccountId(String userId);

	List<Organization> getOrganizationsByParent(String parentId);
}
