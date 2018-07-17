package org.gecko.framework.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Duty;
import org.gecko.framework.system.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 职务控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-17 10:33:32
 *
 */
@Controller
@RequestMapping("/system/duty")
public class DutyController extends BaseController<Duty> {

	@Autowired
	public DutyService dutyService;
	
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
	 * @param duty
	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_SYSTEM_DUTIES_QUERY"})
	public R list(Page<Duty> page, String search, String order) {
	    Duty duty = new Duty();
		Page<Duty> result = dutyService.likeByPage(duty, page);
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
	@GeckoAuthority(codes = {"GECKO_SYSTEM_DUTIES_VIEW"})
	public R get(@PathVariable String id) {
		Duty duty = dutyService.get(id);
		return R.ok().put(duty);
	}
	
	/**
	 * 根据ID列表批量删除对象
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_SYSTEM_DUTIES_DELETE"})
	public R delete(@RequestBody String[] ids) {
		dutyService.batchDelete(ids);
		return R.ok();
	}
	
	/**
     * save 保存对象
     * @param duty
     * @return R返回类型
     */
	@RequestMapping(value = "/save", method = RequestMethod.PUT)
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_SYSTEM_DUTIES_NEW", "GECKO_SYSTEM_DUTIES_EDIT"})
	public R save(@RequestBody Duty duty) {
		if(null != duty.getId() && StringUtils.isNoneBlank(String.valueOf(duty.getId()))) {
			dutyService.update(duty);
		} else {
			dutyService.save(duty);
		}
		
		return R.ok();
	}
	
	/**
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_SYSTEM_DUTIES_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
}
