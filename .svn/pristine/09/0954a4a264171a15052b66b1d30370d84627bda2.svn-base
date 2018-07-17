package org.gecko.framework.wineLabels.service;

import java.util.List;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.wineLabels.entity.AlCirculation;
import org.gecko.framework.wineLabels.repository.dao.AlCirculationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * AlCirculationService
 * 产品流通信息表服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:47:12 
 *
 */
@Service("AlCirculationService")
public class AlCirculationService extends BaseGeckoService<AlCirculation> {
	@Autowired
	public AlCirculationDao dao;
	
    public int updateField(String field, String value, String pk) {
        return updateField("AlCirculation", field, value, pk);
    }

	public List<AlCirculation> findHisAlCirculationByParam(AlCirculation param) {
		return dao.findHisAlCirculationByParam(param);
	}
}
