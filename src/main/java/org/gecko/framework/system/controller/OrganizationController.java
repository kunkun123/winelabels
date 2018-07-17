package org.gecko.framework.system.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.Organization;
import org.gecko.framework.system.service.AccountService;
import org.gecko.framework.system.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 机构控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58
 *
 */
@Controller
@RequestMapping("/system/organization")
public class OrganizationController extends BaseController<Organization> {

	@Autowired
	public OrganizationService organizationService;
	@Autowired
	public AccountService accountService;
	
	/**
	 * index
	 * 打开首页
	 * @param  model    设定文件
	 * @return String   返回类型
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		return "";
	}
	
	/**
	 * 数据列表
	 * @param page 分页设置
	 * @param organization
	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Page<Organization> list(Page<Organization> page, String search, String order) {
		page.setLimit(99999);
	    Organization organization = new Organization();
//	    organization.setOrgCode("%"+search+"%");
//	    organization.setOrgName("%"+search+"%");
		page = organizationService.likeByPage(organization, page);
		return page;
	}


    @RequestMapping(value = "/tree", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public R tree(@RequestParam(name = "orgnization", required = false) Organization orgnization) {
        Object result = organizationService.tree(orgnization);
        return R.ok().put(result);
    }

	/**
	 * 
	 * @param @param id 唯一ID
	 * @param id 唯一ID
	 * @return R  返回类型
	 */
	@RequestMapping(value = "/get/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public R get(@PathVariable String id) {
		Organization organization = organizationService.get(id);
		return R.ok().put(organization);
	}

    @RequestMapping("/edit")
    @ResponseBody
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (organizationService.updateField(name, value, pk) > 0) {
            r = R.ok();
        }
        return r;
    }

	/**
	 * 根据ID列表批量删除对象
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public R delete(@RequestBody String[] ids) {
		organizationService.batchDelete(ids);
		return R.ok();
	}
    /**
	 * 删除单个对象
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/deleteOrg", method = RequestMethod.DELETE)
	@ResponseBody
	public R deleteOrg(HttpServletRequest request) {
    	String id = request.getParameter("id");
    	String[] ids = id.split(",");
		organizationService.batchDelete(ids);
		return R.ok();
	}
	/**
     * save 保存对象
     * @param organization
     * @return R返回类型
     */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public R save(@RequestBody Organization organization) {
        R r = R.ok();
		if(null != organization.getId() && StringUtils.isNoneBlank(String.valueOf(organization.getId()))) {
			  if (organization.getParentOrg() != null) {
	                Organization parentOrgnization = organizationService.get(organization.getParentOrg());
	                organization.setOrgSeq(parentOrgnization.getOrgSeq() + "." + organization.getId());
	              //organization.setOrgSeq(parentOrgnization.getOrgSeq() + "." + organization.getId());
	    			organizationService.update(organization);
	           }
		} else {
			r.put(organizationService.save(organization));
		}
		
		return r;
	}
	
	/**
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
	/**
	 * 查询登录账号同部门的人员
	 */
	@RequestMapping(value = "/getDeparmentAccount")
	@ResponseBody
	public List<Account> getDeparmentAccounts(HttpSession session) {
		 //获取当前登录的用户
	    Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
	    Organization organization = organizationService.getOrganizationByAccountId(acct.getId());
	    if(null!=organization){
	    	List<Account> accounts =accountService.accountListByOrgId(organization.getId(), null);
	    	return accounts;
	    }
        return null;
	}
	/**
	 * 查询登录账号的部门
	 * @throws IOException 
	 */
	@RequestMapping(value = "/getDeparmentByAccount")
	@ResponseBody
	public R getDeparmentByAccount(HttpSession session) throws IOException {
		 //获取当前登录的用户
	    Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
	    Organization org = organizationService.getOrganizationByAccountId(acct.getId());
	    R r = new R();
	    if(null!=org){
	    	//自治区账号
		    if(org.getParentOrg()==null){
		    	r.put("orgType", 0);
		    }else if("150".equals(org.getParentOrg())){
		    	r.put("orgType", 1);
		    }
	    }
	    return r;
	}
}
