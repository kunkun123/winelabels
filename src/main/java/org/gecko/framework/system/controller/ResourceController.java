package org.gecko.framework.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.Resource;
import org.gecko.framework.system.entity.enums.RoleType;
import org.gecko.framework.system.service.ResourceService;
import org.gecko.framework.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 资源控制器
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:41
 */
@Controller
@RequestMapping("/system/resource")
public class ResourceController extends BaseController<Resource> {

    @Autowired
    public ResourceService resourceService;
    @Autowired
    public RoleService roleService;
    @Autowired
    HttpSession session;

    /**
     * index
     * 打开首页
     *
     * @param model 设定文件
     * @return String   返回类型
     */
    @RequestMapping("/index")
    public String index(Model model) {
        return "";
    }

    /**
     * 数据列表
     *
     * @param page   分页设置
     * @param search
     * @return R返回类型
     */
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_QUERY"})
    public Page<Resource> list(Page<Resource> page) {
        Resource resource = new Resource();
        if (page.getSearch() != null)
            resource.setSourceName("%" + page.getSearch() + "%");
        page = resourceService.likeByPage(resource, page);
        return page;
    }

    @RequestMapping(value = "/menuList", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_QUERY"})
    public R menuList() {
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
        List<Resource> result = new ArrayList<>(0);
        if (account != null) {
        	 List<Integer> roleTypes = roleService.roleType(account.getId()) ;
             for (@SuppressWarnings("rawtypes")
 			Iterator iterator = roleTypes.iterator(); iterator.hasNext();) {
 				Integer roleType = (Integer) iterator.next();
 				if(roleType!=null){
 					if (roleType == RoleType.ADMIN.getKey() || roleType == RoleType.SUPERADMIN.getKey()) {
 	 	                result = resourceService.find(null);
 	 	            } else {
 	 	                result = resourceService.menuList(account.getId());
 	 	            }
 				}
 			}
	           
        }
        return R.ok().put(result);
    }

    /**
     * @param @param id 唯一ID
     * @param id     唯一ID
     * @return R  返回类型
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_VIEW"})
    public R get(@PathVariable String id) {
        Resource resource = resourceService.get(id);
        return R.ok().put(resource);
    }

    /**
     * 根据ID列表批量删除对象
     *
     * @param ids 唯一ID列表
     * @return R 返回类型
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_DELETE"})
    public R delete(@RequestBody String[] ids) {
        resourceService.batchDelete(ids);
        return R.ok();
    }

    /**
     * save 保存对象
     *
     * @param resource
     * @return R返回类型
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_NEW", "GECKO_SYSTEM_RESOURCES_EDIT"})
    public R save(@RequestBody Resource resource) {
        R r = R.ok();
        if (null != resource.getId() && StringUtils.isNoneBlank(String.valueOf(resource.getId()))) {
            resourceService.update(resource);
        } else {
            if (org.springframework.util.StringUtils.isEmpty(resource.getId())) {
                resource.setId(UuidUtil.get32UUID());
                ReflectUtil.fillsProperty(resource);
            }
            r.put(resourceService.save(resource));
        }

        return r;
    }

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_EDIT"})
    public R edit(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (resourceService.updateField(name, value, pk) > 0) {
            r = R.ok();
        }
        return r;
    }

    /**
     * export  导出数据
     *
     * @param ids 唯一ID列表
     * @return R返回类型
     */
    @RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_RESOURCES_EXPORT"})
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
}
