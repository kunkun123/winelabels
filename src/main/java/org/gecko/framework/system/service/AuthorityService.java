package org.gecko.framework.system.service;

import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.system.entity.Authority;
import org.gecko.framework.system.entity.RoleAuthority;
import org.gecko.framework.system.repository.dao.AuthorityDao;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 * AuthorityService
 * 权限服务接口
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58
 */
@Service("AuthorityService")
public class AuthorityService extends BaseGeckoService<Authority> {

    @Resource
    AuthorityDao authorityDao;

    public Page<Authority> tableData(Page<Authority> page) {
        String search = null;
        if (page.getSearch() != null)
            search = page.getSearch();
        List<Authority> treeData = authorityDao.getPage(search, page);//或如下：
        page.setRows(treeData);
        return page;
    }

    public Map<String, String> getAuthMapByAccountId(String accountId) {
        Map<String, String> authorityMap = new HashMap<>();
        List<Authority> authorities = authorityDao.getAuthByAccountId(accountId);
        for (Authority authority : authorities) {
            authorityMap.put(authority.getAuthorityCode(), authority.getAuthorityName());
        }
        return authorityMap;
    }

    public List<Authority> roleAuth(String roleId) {
        return authorityDao.roleAuth(roleId);
    }

    public int saveRoleAuth(List<RoleAuthority> roleAuthList) {
        HashSet<String> roleIds = new HashSet<>();
        for (RoleAuthority ra : roleAuthList) {
            roleIds.add(ra.getRoleId());
        }
        List<String> ids = new ArrayList<>(10);
        ids.addAll(roleIds);
        authorityDao.deleteByRoleIds(ids);
        return authorityDao.saveRoleAuth(roleAuthList);
    }

    public int updateField(String name, String value, String pk) {
        return updateField("Authority", name, value, pk);
    }

    public Authority newAuthority(Authority o) {
        if (StringUtils.isEmpty(o.getId())) {
            o.setId(UuidUtil.get32UUID());
            ReflectUtil.fillsProperty(o);
        }
        authorityDao.save(o);
        return o;
    }

    @Override
    public int batchDelete(String[] ids) {
        int row = authorityDao.batchDelete(ids);
        return row;
    }

	public String getMaxId() {
		return authorityDao.getMaxId();
	}

	public void deleteRoleAuthByRoleId(String roleId) {
		List<String> roleIds = new LinkedList<String>();
		roleIds.add(roleId);
		authorityDao.deleteByRoleIds(roleIds);
	}
}
