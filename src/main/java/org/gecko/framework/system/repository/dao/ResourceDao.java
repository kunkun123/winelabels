package org.gecko.framework.system.repository.dao;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.system.entity.Resource;

import java.util.List;

/**
 * 
 * ResourceDao
 * 资源数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:41 
 *
 */
@GECKOBatis
public interface ResourceDao extends IGeckoBaseDao<Resource> {

    List<Resource> menuList(@Param("accountId") String accountId);

    int updateField(@Param("field") String field, @Param("value") String value, @Param("pk") String pk);
}
