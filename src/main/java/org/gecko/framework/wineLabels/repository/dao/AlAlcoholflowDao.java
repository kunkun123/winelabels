package org.gecko.framework.wineLabels.repository.dao;

import java.util.List;

import org.gecko.core.annotations.GECKOBatis;
import org.gecko.framework.base.IGeckoBaseDao;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;

/**
 * 
 * AlAlcoholflowDao
 * 酒标流程表数据访问接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:40:01 
 *
 */
@GECKOBatis
public interface AlAlcoholflowDao extends IGeckoBaseDao<AlAlcoholflow> {
	List<AlAlcoholflow> findByWinelabels(String wineLabelId);
}
