package org.gecko.framework.pubdata.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.pubdata.entity.PubBaseinfoSysarea;
import org.springframework.stereotype.Service;

/**
 * 
 * PubBaseinfoSysareaService
 * 地区街道服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-12 16:58:55 
 *
 */
@Service("PubBaseinfoSysareaService")
public class PubBaseinfoSysareaService extends BaseGeckoService<PubBaseinfoSysarea> {

    public int updateField(String field, String value, String pk) {
        return updateField("PubBaseinfoSysarea", field, value, pk);
    }
}
