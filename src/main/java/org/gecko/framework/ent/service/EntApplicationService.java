package org.gecko.framework.ent.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.ent.entity.EntApplication;
import org.springframework.stereotype.Service;

/**
 * 
 * EntApplicationService
 * 酒标申请记录服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 20:31:34 
 *
 */
@Service("EntApplicationService")
public class EntApplicationService extends BaseGeckoService<EntApplication> {

    public int updateField(String field, String value, String pk) {
        return updateField("EntApplication", field, value, pk);
    }
}
