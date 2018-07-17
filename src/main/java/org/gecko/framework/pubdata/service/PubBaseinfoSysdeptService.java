package org.gecko.framework.pubdata.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.pubdata.entity.PubBaseinfoSysdept;
import org.springframework.stereotype.Service;

/**
 * 
 * PubBaseinfoSysdeptService
 * 部门管理服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-12 16:58:55 
 *
 */
@Service("PubBaseinfoSysdeptService")
public class PubBaseinfoSysdeptService extends BaseGeckoService<PubBaseinfoSysdept> {

    public int updateField(String field, String value, String pk) {
        return updateField("PubBaseinfoSysdept", field, value, pk);
    }
}
