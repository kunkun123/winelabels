package org.gecko.framework.pubdata.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.pubdata.entity.PubBaseinfoSysunit;
import org.springframework.stereotype.Service;

/**
 * 
 * PubBaseinfoSysunitService
 * 单位管理服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-13 11:35:37 
 *
 */
@Service("PubBaseinfoSysunitService")
public class PubBaseinfoSysunitService extends BaseGeckoService<PubBaseinfoSysunit> {

    public int updateField(String field, String value, String pk) {
        return updateField("PubBaseinfoSysunit", field, value, pk);
    }
}
