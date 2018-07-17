package org.gecko.framework.wineLabels.controller;


import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.wineLabels.entity.AlProduct;
import org.gecko.framework.wineLabels.service.AlProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * 商品表控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:25:28
 *
 */
@Controller
@RequestMapping("/wineLabels/alproduct")
public class AlProductController extends BaseController<AlProduct> {

	@Autowired
	public AlProductService service;

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
	 * @param search 查询参数
	 * @param order 排序
	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public Page<AlProduct> list(Page<AlProduct> page) {
        AlProduct param = new AlProduct();
        if(page.getSearch()!=null){
        param.setTemp4("%" + page.getSearch() + "%");
param.setTemp3("%" + page.getSearch() + "%");
param.setTemp2("%" + page.getSearch() + "%");
param.setTemp1("%" + page.getSearch() + "%");
//param.setLastupdatetime("%" + page.getSearch() + "%");
param.setBatch("%" + page.getSearch() + "%");
//param.setCreatedate("%" + page.getSearch() + "%");
param.setCreator("%" + page.getSearch() + "%");
/*param.setCollectiontype("%" + page.getSearch() + "%");
param.setProducttype("%" + page.getSearch() + "%");*/
param.setSpec("%" + page.getSearch() + "%");
param.setProductname("%" + page.getSearch() + "%");
param.setProductlineid("%" + page.getSearch() + "%");
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_VIEW"})
	public R get(@PathVariable String id) {
		AlProduct alproduct = service.get(id);
		return R.ok().put(alproduct);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_EDIT"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_NEW", "GECKO_WINELABELS_AL_PRODUCT_EDIT"})
	public R save(@RequestBody AlProduct entity) {
        R r = new R();
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
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

	/**
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
}
