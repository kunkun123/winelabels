package org.gecko.framework.wineLabels.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.wineLabels.entity.AlAlcohollable;
import org.springframework.stereotype.Service;

/**
 * 
 * AlAlcohollableService
 * 酒标信息表服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:26:10 
 *
 */
@Service("AlAlcohollableService")
public class AlAlcohollableService extends BaseGeckoService<AlAlcohollable> {

    public int updateField(String field, String value, String pk) {
        return updateField("AlAlcohollable", field, value, pk);
    }
}
