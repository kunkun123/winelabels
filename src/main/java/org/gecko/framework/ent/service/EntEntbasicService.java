package org.gecko.framework.ent.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.ent.entity.EntEntbasic;
import org.springframework.stereotype.Service;

/**
 * 
 * EntEntbasicService
 * ENT_ENTBASIC服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 16:26:47 
 *
 */
@Service("EntEntbasicService")
public class EntEntbasicService extends BaseGeckoService<EntEntbasic> {

    public int updateField(String field, String value, String pk) {
        return updateField("EntEntbasic", field, value, pk);
    }
}
