package org.gecko.framework.wineLabels.service;

import java.util.List;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;
import org.gecko.framework.wineLabels.repository.dao.AlAlcoholflowDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * AlAlcoholflowService
 * 酒标流程表服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:40:01 
 *
 */
@Service("AlAlcoholflowService")
public class AlAlcoholflowService extends BaseGeckoService<AlAlcoholflow> {
	@Autowired
	AlAlcoholflowDao alcoholflowDao;
	
    public int updateField(String field, String value, String pk) {
        return updateField("AlAlcoholflow", field, value, pk);
    }
    public List<AlAlcoholflow> findByWinelabels(String wineLabelId) {
		return alcoholflowDao.findByWinelabels(wineLabelId);
	}
}
