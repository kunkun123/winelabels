package org.gecko.framework.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.gecko.common.utils.UuidUtil;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.Authority;
import org.gecko.framework.system.repository.dao.AccountDao;
import org.gecko.framework.system.repository.dao.OrganizationDao;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 
 * AccountService
 * 账号服务接口
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58 
 *
 */
@Service("AccountService")
public class AccountService extends BaseGeckoService<Account> {
    @Resource
    private AccountDao accountDao;
    @Resource
    private OrganizationDao organizationDao;

    public List<Authority> getAuthoritiesById(String userId) {
        return accountDao.getAuthoritiesById(userId);
    }

    public List<Account> getAccount(Account o, Page<Account> page) {
        return accountDao.findByPage(o, page);
    }

    @Override
    public int delete(Account o) {
        return accountDao.delete(o);
    }

    @Override
    public int deleteById(String id) {
        return accountDao.deleteById(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return accountDao.batchDelete(ids);
    }

    public int save(String orgId, Account o) {
        int row = 0;
        if (this.save(o) !=null) {
            row = organizationDao.saveOrgAcct(orgId, o.getId());
        }
        return row;
    }
    public int updateField(String name, String value, String pk) {
        return updateField("Account", name, value, pk);
    }

    @Override
    public Account save(Account o) {
        return this.update(o);
    }

    @Override
    public Account update(Account o) {
        if (StringUtils.isEmpty(o.getId())) {
            o.setId(UuidUtil.get32UUID());
            accountDao.save(o);
        } else {
            Account old = accountDao.get(o.getId());
            if (old == null) {
                accountDao.save(o);
            } else {
                if (o.getCredential() != null) {
                    old.setCredential(o.getCredential());
                }
                if (o.getEmail() != null) {
                    old.setEmail(o.getEmail());
                }
                if (o.getGender() != null) {
                    old.setGender(o.getGender());
                }
                if (o.getMobilePhone() != null) {
                    old.setMobilePhone(o.getMobilePhone());
                }
                if (o.getPrincipal() != null) {
                    old.setPrincipal(o.getPrincipal());
                }
                if (o.getQq() != null) {
                    old.setQq(o.getQq());
                }
                if (o.getRealName() != null) {
                    old.setRealName(o.getRealName());
                }
                if (o.getTelPhone() != null) {
                    old.setTelPhone(o.getTelPhone());
                }
                accountDao.update(old);
            }
        }
        return o;
    }

    public Account login(Account account){
        return accountDao.login(account);
    }

    public Page<Account> accountsByRoleId(String roleId, Page<Account> page) {
    	 List<Account> list = accountDao.accountsByRoleId(roleId, page);
    	 page.setRows(list);
         return page;
    }

    public Page<Account> listByOrgId(String orgId, Page<Account> page) {
        List<Account> list = accountDao.listByOrgId(orgId, page);
        page.setRows(list);
        return page;
    }
    public List<Account> accountListByOrgId(String orgId, Page<Account> page) {
        List<Account> list = accountDao.listByOrgId(orgId, page);
        return list;
    }
}
