package org.gecko.framework.system.service;

import java.util.List;

import org.gecko.common.utils.UuidUtil;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.system.entity.Resource;
import org.gecko.framework.system.repository.dao.ResourceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * ResourceService
 * 资源服务接口
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:41
 */
@Service("ResourceService")
public class ResourceService extends BaseGeckoService<Resource> {

    @Autowired
    ResourceDao resourceDao;

    public Resource saveResource(Resource o) {
        if (StringUtils.isEmpty(o.getId())) {
            o.setId(UuidUtil.get32UUID());
            o.setAvailable(true);
            o.setSortIndex(0D);
            o.setIsPlatform(false);
            resourceDao.save(o);
        } else {
            resourceDao.update(o);
        }
        return o;
    }

    @Override
    public Resource update(Resource o) {
         resourceDao.update(o);
         return o;
    }

    public List<Resource> menuList(String accountId) {
        return resourceDao.menuList(accountId);
    }

    public int updateField(String name, String value, String pk) {
        return updateField("Resource", name, value, pk);
    }
}
