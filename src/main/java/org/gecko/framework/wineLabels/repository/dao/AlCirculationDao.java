package org.gecko.framework.wineLabels.repository.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gecko.core.annotations.GECKOBatis;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.wineLabels.entity.AlCirculation;

/**
 * 
 * AlCirculationDao
 * 产品流通信息表数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:47:12 
 *
 */
@GECKOBatis
public interface AlCirculationDao extends IGeckoBaseDao<AlCirculation> {
	/**
	 * 根据搜索条件查询酒标信息
	 * @param param
	 * @return
	 */
	List<AlCirculation> findHisAlCirculationByParam(@Param("param") AlCirculation param);
	
}
