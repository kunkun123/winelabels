package org.gecko.framework.pubdata.controller;


import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.pubdata.entity.PubBaseinfoSyspost;
import org.gecko.framework.pubdata.service.PubBaseinfoSyspostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * 职务管理控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-13 11:35:37
 *
 */
@Controller
@RequestMapping("/pubdata/pubbaseinfosyspost")
public class PubBaseinfoSyspostController extends BaseController<PubBaseinfoSyspost> {

	@Autowired
	public PubBaseinfoSyspostService service;

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
	// * @param search 查询参数
	// * @param order 排序
	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_QUERY"})
	public Page<PubBaseinfoSyspost> list(Page<PubBaseinfoSyspost> page) {
        PubBaseinfoSyspost param = new PubBaseinfoSyspost();
        if(page.getSearch()!=null){
       // param.setIsleader("%" + page.getSearch() + "%");
param.setSourceid("%" + page.getSearch() + "%");
//param.setUnitnum("%" + page.getSearch() + "%");
//param.setPostdesc("%" + page.getSearch() + "%");
param.setPostnum("%" + page.getSearch() + "%");
param.setPostname("%" + page.getSearch() + "%");
        }
		page = service.likeByPage(param, page);
		return page;
	}

	/**
	 *
	 * @param @param id 唯一ID
	 * @param id 唯一ID
	 * @return R  返回类型
	 */
	@RequestMapping(value = "/get/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_VIEW"})
	public R get(@PathVariable String id) {
		PubBaseinfoSyspost pubbaseinfosyspost = service.get(id);
		return R.ok().put(pubbaseinfosyspost);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_EDIT"})
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (service.updateField(name, value, pk) > 0) {
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
	@GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_DELETE"})
	public R delete(@RequestBody String[] ids) {
		service.batchDelete(ids);
		return R.ok();
	}

	/**
     * save 保存对象
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/save", method = RequestMethod.PUT)
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_NEW", "GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_EDIT"})
	public R save(@RequestBody PubBaseinfoSyspost entity) {
        R r = new R();
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			service.update(entity);
            r = R.ok();
		} else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
                entity.setId(new java.math.BigDecimal(UuidUtil.get32UUID()));
                ReflectUtil.fillsProperty(entity);
            }
			r.put(service.save(entity));
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
	@GeckoAuthority(codes = {"GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
}
