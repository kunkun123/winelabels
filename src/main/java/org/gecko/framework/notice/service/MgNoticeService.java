package org.gecko.framework.notice.service;

import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.notice.entity.MgNotice;
import org.springframework.stereotype.Service;

/**
 * 
 * MgNoticeService
 * MG_NOTICE服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-04 14:32:45 
 *
 */
@Service("MgNoticeService")
public class MgNoticeService extends BaseGeckoService<MgNotice> {

    public int updateField(String field, String value, String pk) {
        return updateField("MgNotice", field, value, pk);
    }
}
