package org.gecko.framework.system.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Role;
import org.gecko.framework.system.entity.RoleAccount;
import org.gecko.framework.system.entity.RoleAuthority;
import org.gecko.framework.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 角色控制器
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:14:58
 */
@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController<Role> {

    @Autowired
    public RoleService roleService;

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

    @RequestMapping(value = "tree", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLE_QUERY"})
    public R tree() {
        return R.ok().put(roleService.tree());
    }


    /**
     * 数据列表
     *
     * @param page 分页设置
     * @param role
     * @return R返回类型
     */
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_QUERY"})
    public Page<Role> list(Page<Role> page, String search, String order) {
        Role role = new Role();
        role.setRoleName("%" + search + "%");
        role.setDescription("%" + search + "%");
        page = roleService.findByPage(role, page);
        return page;
    }

    /**
     * @param @param id 唯一ID
     * @param id     唯一ID
     * @return R  返回类型
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_VIEW"})
    public R get(@PathVariable String id) {
        Role role = roleService.get(id);
        return R.ok().put(role);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_EDIT"})
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (roleService.updateField(name, value, pk) > 0) {
            r = R.ok();
        }
        return r;
    }

    /**
     * 根据ID列表批量删除对象
     *
     * @param ids 唯一ID列表
     * @return R 返回类型
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_DELETE"})
    public R delete(@RequestBody String[] ids) {
        roleService.batchDelete(ids);
        return R.ok();
    }
    /**
     * 删除d单个角色
     *
     * @param ids 唯一ID列表
     * @return R 返回类型
     */
    @RequestMapping(value = "/deleteRole/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_DELETE"})
    public R delete(@PathVariable String id) {
        roleService.deleteById(id);
        return R.ok();
    }
    /**
     * save 保存对象
     *
     * @param role
     * @return R返回类型
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_NEW", "GECKO_SYSTEM_ROLES_EDIT"})
    public R save(@RequestBody Role role) {
        R r = R.ok();
        if (null != role.getId() && StringUtils.isNoneBlank(String.valueOf(role.getId()))) {
            roleService.update(role);
        } else {

            r.put(roleService.save(role));
        }

        return r;
    }

    /**
     * batchSaveAccountRole 批量给角色添加用户
     *
     * @param role
     * @return R返回类型
     */
    @RequestMapping(value = "/batchSaveAccountRole", method = RequestMethod.PUT)
    @ResponseBody
    public R batchSaveAccountRole(@RequestBody List<RoleAccount> roleAccountList) {
        R r = R.ok();
        if (roleAccountList != null) {
            int row = roleService.batchSaveAccountRole(roleAccountList);
            r = R.ok(row + "");
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
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_EXPORT"})
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
    /**
     * 根据角色批量删除用户
     *
     * @param ids 唯一ID列表
     * @return R 返回类型
     */
    @RequestMapping(value = "/batchDeleteAccount2Role", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_ROLES_DELETE"})
    public R batchDeleteAccount2Role(@RequestBody List<RoleAccount> roleAccountList) {
    	 R r = R.ok();
         if (roleAccountList != null) {
             int row = roleService.batchDeleteAccount2Role(roleAccountList);
             r = R.ok(row + "");
         }
         return r;
    }

}
