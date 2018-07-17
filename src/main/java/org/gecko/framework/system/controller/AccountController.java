package org.gecko.framework.system.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Gecko Generator
 * AccountController
 * 账号控制器
 * @email david.kosoon@gmail.com
 * @date 2017-05-23 15:33:31
 */
@Controller
@RequestMapping("/system/account")
public class AccountController extends BaseController<Account> {

    @Autowired
    public AccountService service;

    /**
     * @return String 返回类型ls
     * <p>
     * index
     * 打开首页
     */
    @RequestMapping("/index")
    public String index() {
        return "";
    }

    @RequestMapping(value = "/accountsByRoleId/{roleId}", method = RequestMethod.POST)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_QUERY"})
    public R accountsByRoleId(@PathVariable("roleId") String roleId,Page<Account> page) {
    	page.setLimit(999);
        return R.ok().put(service.accountsByRoleId(roleId,page).getRows());
    }

    /**
     * @param page Page
     * @return R 返回类型
     * <p>
     * list
     * 数据列表
     */
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_QUERY"})
    public Page<Account> list(Page<Account> page) {
        Account account = new Account();
        if (page.getSearch() != null) {
            String search = "%" + page.getSearch() + "%";
            account.setPrincipal(search);
            account.setEmail(search);
            account.setMobilePhone(search);
            account.setQq(search);
            account.setRealName(search);
            account.setTelPhone(search);
        }
        Page<Account> result = service.likeByPage(account, page);
        return result;
    }

    @RequestMapping(value = "/listByOrgId/{orgId}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_QUERY"})
    public Page<Account> listByOrgId(@PathVariable String orgId, Page<Account> page) {
        page = service.listByOrgId(orgId, page);
        return page;
    }

    /**
     * @param id ID
     * @return R 返回类型
     * <p>
     * get
     * 根据ID获取对象
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_VIEW"})
    public R get(@PathVariable String id) {
        Account account = service.get(id);
        return R.ok().put(account);
    }

    /**
     * @param ids ID array
     * @return R 返回类型
     * <p>
     * delete
     * 根据ID列表批量删除对象
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_DELETE"})
    public R delete(@RequestBody String[] ids) {
        service.batchDelete(ids);
        return R.ok();
    }

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNTS_EDIT"})
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (service.updateField(name, value, pk) > 0) {
            r = R.ok();
        }
        return r;
    }

    /**
     * @param entity 账号
     * @return R 返回类型
     * <p>
     * save
     * 保存对象
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_NEW", "GECKO_SYSTEM_ACCOUNT_EDIT"})
    public R save(@RequestBody Account entity) {
        R r = new R();
        if (StringUtils.isNoneBlank(entity.getId())) {
            service.update(entity);
            r = R.ok();
        } else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
                entity.setId(UuidUtil.get32UUID());
                ReflectUtil.fillsProperty(entity);
            }
            r.put(service.save(entity));
        }

        return r;
    }

    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_NEW", "GECKO_SYSTEM_ACCOUNT_EDIT"})
    @RequestMapping(value = "/saveorgacc/{orgId}", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public R saveOrgAcct(@RequestBody Account account, @PathVariable("orgId") String orgId) {
        return R.ok(String.valueOf(service.save(orgId, (Account) account)));
        //service.save(orgId, (Account) account);
    }

    /**
     * @param ids ID array
     * @return R 返回类型
     * <p>
     * export
     * 导出数据
     */
    @RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_EXPORT"})
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
    /**
     * 个人信息页面展现
     * 
     */
    @RequestMapping(value = "/personalInfo", method = {RequestMethod.POST, RequestMethod.GET})
   //@GeckoAuthority(codes = {"GECKO_SYSTEM_ACCOUNT_EXPORT"})
    public ModelAndView personalInfoView(HttpSession session) {
    	//获取当前登录的用户
	    Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
	    ModelAndView mad = new ModelAndView("/mgr/views/system/perdetails/index.jsp");
	    mad.addObject("account", acct);
	    return mad;
    }
    /**
     * @param entity 账号
     * @return R 返回类型
     * <p>
     * save
     * 保存对象
     */
    @RequestMapping(value = "/infoSave", method = RequestMethod.POST)
    //@ResponseBody
    public ModelAndView infoSave(Account entity) {
    	ModelAndView mad = new ModelAndView("/mgr/views/system/perdetails/index.jsp");
 	    //mad.addObject("account", acct);
        R r = new R();
        if (StringUtils.isNoneBlank(entity.getId())) {
            service.update(entity);
            r = R.ok();
        } else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
                entity.setId(UuidUtil.get32UUID());
                ReflectUtil.fillsProperty(entity);
            }
            r.put(service.save(entity));
        }

        return mad;
    }
}