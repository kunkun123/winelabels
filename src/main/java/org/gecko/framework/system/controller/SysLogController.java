package org.gecko.framework.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.SysLog;
import org.gecko.framework.system.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 日志控制器
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 15:11:01
 */
@Controller
@RequestMapping("/system/sysLog")
public class SysLogController extends BaseController<SysLog> {

    @Autowired
    public SysLogService sysLogService;

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
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_QUERY"})
    public Page<SysLog> list(Page<SysLog> page, String search, String order) {
        SysLog sysLog = new SysLog();
        page = sysLogService.likeByPage(sysLog, page);
        return page;
    }

    /**
     * @param @param id 唯一ID
     * @param id     唯一ID
     * @return R  返回类型
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_VIEW"})
    public R get(@PathVariable String id) {
        SysLog sysLog = sysLogService.get(id);
        return R.ok().put(sysLog);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_EDIT"})
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (sysLogService.updateField(name, value, pk) > 0) {
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
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_DELETE"})
    public R delete(@RequestBody String[] ids) {
        sysLogService.batchDelete(ids);
        return R.ok();
    }

    /**
     * save 保存对象
     *
     * @param sysLog
     * @return R返回类型
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_NEW", "GECKO_SYSTEM_SYS_LOGS_EDIT"})
    public R save(@RequestBody SysLog sysLog) {
        R r = R.ok();
        if (null != sysLog.getId() && StringUtils.isNoneBlank(String.valueOf(sysLog.getId()))) {
            sysLogService.update(sysLog);
        } else {
            r.put(sysLogService.save(sysLog));
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
    @GeckoAuthority(codes = {"GECKO_SYSTEM_SYS_LOGS_EXPORT"})
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
}
