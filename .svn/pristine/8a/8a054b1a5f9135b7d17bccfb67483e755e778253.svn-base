package org.gecko.framework.system.service;

import com.alibaba.druid.util.StringUtils;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.cache.GeckoCache;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.system.entity.Organization;
import org.gecko.framework.system.entity.enums.OrganizationCategory;
import org.gecko.framework.system.repository.dao.OrganizationDao;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * OrganizationService
 * 机构服务接口
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58
 */
@Service("OrganizationService")
public class OrganizationService extends BaseGeckoService<Organization> implements InitializingBean {

    public int updateField(String field, String value, String pk) {
        return updateField("Organization", field, value, pk);
    }

    @Resource
    OrganizationDao organizationDao;

    @Override
    public Organization save(Organization orgnization) {
        if (orgnization.getOrgCategory() == null)
            orgnization.setOrgCategory(OrganizationCategory.OTHER);
        if (StringUtils.isEmpty(orgnization.getId())) {// new
            //orgnization.setId(UuidUtil.get32UUID());
            if (orgnization.getParentOrg() != null) {
                Organization parentOrgnization = get(orgnization.getParentOrg());
                
                List<BigDecimal> organizationIds = new ArrayList<BigDecimal>();
                List<Organization> organizations = organizationDao.getOrganizationsByParent(parentOrgnization.getId());
                BigDecimal maxId = null ;
                for (Iterator iterator = organizations.iterator(); iterator.hasNext();) {
					Organization organization = (Organization) iterator.next();
					organizationIds.add(new BigDecimal(organization.getId()));
					maxId = Collections.max(organizationIds);
				}
                orgnization.setId("");
                orgnization.setOrgSeq(parentOrgnization.getOrgSeq() + "." + orgnization.getId());
            } else {
                orgnization.setOrgSeq("." + orgnization.getId());
            }
            organizationDao.save(orgnization);
        } else {// update
            Organization orgnizationOld = get(orgnization.getId());
            orgnizationOld.setOrgCategory(orgnization.getOrgCategory());
            orgnizationOld.setOrgCode(orgnization.getOrgCode());
            orgnizationOld.setOrgName(orgnization.getOrgName());
            orgnizationOld.setOrgSeq(orgnization.getOrgSeq());
            orgnizationOld.setParentOrg(orgnization.getParentOrg());
            if (orgnization.getParentOrg() != null) {
                Organization parentOrgnization = get(orgnization.getParentOrg());
                orgnizationOld.setOrgSeq(orgnizationOld.getParentOrg() == null ? ""
                        : parentOrgnization.getOrgSeq() + "." + orgnization.getId());

            }
            organizationDao.update(orgnizationOld);
        }
        return orgnization;
    }

    public static final String ORGNIZATION_TREE_DATA = "org_tree_data";

    public Object tree(Organization org) {
//        @SuppressWarnings("unchecked")
//        List<Organization> treeList = (List<Organization>) GeckoCache.get(ORGNIZATION_TREE_DATA);
    	List<Organization> treeList = null;
        if (treeList == null) {
            Organization orgnization = org;
            if (orgnization == null)
                orgnization = new Organization();
            Page<Organization> page = new Page<Organization>();
            page.setLimit(Integer.MAX_VALUE);
            treeList = find(orgnization);
            GeckoCache.set(ORGNIZATION_TREE_DATA, treeList);
        }
        return treeList;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // Organization o = new Organization();
        // Page<Organization> page = new Page<Organization>();
        // o.setParentOrg(null);
        //
        // if (findByPage(o, page) == null) {
        // System.out.println(o.getId() + "," + o);
        // o.setId(UuidUtil.get32UUID());
        // o.setOrgName(Constant.Properties.TOP_ORGNIZATION_NAME);
        // o.setOrgCategory(OrganizationCategory
        // .valueOf(GeckoProperties.getString(Constant.Properties.TOP_ORGNIZATION_CATEGORY)));
        // o.setOrgSeq(o.getId());
        // o.setParentOrg(null);
        // }
    }

	public Organization getOrganizationByAccountId(String userId) {
		return organizationDao.getOrganizationByAccountId(userId);
	}
}
