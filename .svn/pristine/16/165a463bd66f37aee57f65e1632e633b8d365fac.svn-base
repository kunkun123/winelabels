package org.gecko.framework.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Authority;
import org.gecko.framework.system.entity.RoleAuthority;
import org.gecko.framework.system.entity.enums.AuthorityType;
import org.gecko.framework.system.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 权限控制器
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-17 10:33:32
 */
@Controller
@RequestMapping("/system/authority")
public class AuthorityController extends BaseController<Authority> {

    @Autowired
    public AuthorityService authorityService;


    @RequestMapping("/roleAuth")
    @ResponseBody
   
    public R roleAuth(@RequestParam("roleId") String roleId) {
        R r = R.ok();
        List<Authority> authorities = authorityService.roleAuth(roleId);
        if (authorities != null) {
            r.put(authorities);
        } else {
            r = R.error("无数据");
        }
        return r;
    }

    @RequestMapping("/saveRoleAuth/{roleId}")
    @ResponseBody
    public R saveRoleAuth(@RequestBody List<RoleAuthority> roleAuthList,@PathVariable String roleId) {
        R r = R.error();
        if (roleAuthList.size()>0) {
            int row = authorityService.saveRoleAuth(roleAuthList);
            r = R.ok(row + "");
        }else{
        	authorityService.deleteRoleAuthByRoleId(roleId);
        	r = R.ok();
        }
        return r;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (authorityService.updateField(name, value, pk) > 0) {
            r = R.ok();
        }
        return r;
    }

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
     * @param @param  page
     * @param @param  authority
     * @param @return 设定文件
     * @return R    返回类型
     * @throws
     * @Title treeData
     * 数据列表
     */
    @RequestMapping(value = "/tableData", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_AUTHORITY_QUERY"})
    public Page<Authority> tableData(Page<Authority> page) {
//        List<Authority> result = authorityService.tree(search, page);
        //page.setRows(result);
        page = authorityService.tableData(page);
        return page;
    }

    /**
     * 数据列表
     *
     * @return R返回类型
     */
    @RequestMapping(value = "/all", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_AUTHORITY_QUERY"})
    public R all() {
        List<Authority> result = authorityService.find(new Authority());
        return R.ok().put(result);
    }

    /**
     * 数据列表
     *
     * @param search
     * @param order
     * @return R返回类型
     */
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Page<Authority> list(Page<Authority> page, String search, String order) {
        Authority authority = new Authority();
//        authority.setAuthorityName("%"+search+"%");
//        authority.setAuthorityCode("%"+search+"%");
//        authority.setResource("%"+search+"%");
        Page<Authority> result = authorityService.likeByPage(authority, page);
        return result;
    }

    /**
     * @param @param id 唯一ID
     * @param id     唯一ID
     * @return R  返回类型
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public R get(@PathVariable String id) {
        Authority authority = authorityService.get(id);
        return R.ok().put(authority);
    }

    /**
     * 根据ID列表批量删除对象
     *
     * @param ids 唯一ID列表
     * @return R 返回类型
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public R delete(@RequestBody String[] ids) {
        authorityService.batchDelete(ids);
        return R.ok();
    }


    /**
     * save 保存对象
     *
     * @param authority
     * @return R返回类型
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    public R save(@RequestBody Authority authority) {
        R r = new R();
        if (null != authority.getId() && StringUtils.isNoneBlank(String.valueOf(authority.getId()))) {
            authorityService.update(authority);
            r = R.ok();
        } else {
            authority = authorityService.newAuthority(authority);
            r.put(authority);
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
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
    /**
     * save 保存对象
     *
     * @param authority
     * @return R返回类型
     */
    @RequestMapping(value = "/add", method = RequestMethod.PUT)
    @ResponseBody
    public R add() {
        R r = new R();
        Authority authority = new Authority();
        String maxId = authorityService.getMaxId();
        int id = Integer.parseInt(maxId)+1;
        authority.setId(id+"");
        authority.setAuthorityType(AuthorityType.CUSTOM);
        authority.setAuthorityCode("NULL");
        authority.setAuthorityName("NULL");
        authority.setSortIndex(1.0);
        authorityService.save(authority);
        return r;
    }
}
