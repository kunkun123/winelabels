package org.gecko.framework.demo.controller;


import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.demo.entity.PubEnttype;
import org.gecko.framework.demo.service.PubEnttypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * PUB_ENTTYPE控制器
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-09-08 21:51:45
 */
@Controller
@RequestMapping("/demo/pubenttype")
public class PubEnttypeController extends BaseController<PubEnttype> {

    @Autowired
    public PubEnttypeService service;

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
     * @return R返回类型
     */
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_QUERY"})
    public Page<PubEnttype> list(Page<PubEnttype> page) {
        PubEnttype param = new PubEnttype();
        if (page.getSearch() != null) {
            param.setEnttypenum("%" + page.getSearch() + "%");
            param.setSourceid("%" + page.getSearch() + "%");
            param.setEnttypename("%" + page.getSearch() + "%");
        }
        page = service.likeByPage(param, page);
        return page;
    }

    /**
     * @param @param id 唯一ID
     * @param id     唯一ID
     * @return R  返回类型
     */
    @RequestMapping(value = "/get/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_VIEW"})
    public R get(@PathVariable String id) {
        PubEnttype pubenttype = service.get(id);
        return R.ok().put(pubenttype);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_EDIT"})
    public R updateField(@RequestParam("name") String name, @RequestParam("value") String value, @RequestParam("pk") String pk) {
        R r = R.error();
        if (service.updateField(name, value, pk) > 0) {
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
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_DELETE"})
    public R delete(@RequestBody String[] ids) {
        service.batchDelete(ids);
        return R.ok();
    }

    /**
     * save 保存对象
     *
     * @param entity
     * @return R返回类型
     */
    @RequestMapping(value = "/save", method = RequestMethod.PUT)
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_NEW", "GECKO_DEMO_PUB_ENTTYPE_EDIT"})
    public R save(@RequestBody PubEnttype entity) {
        R r = new R();
        if (null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
            service.update(entity);
            r = R.ok();
        } else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {

                java.util.Random randomNum=new java.util.Random(); //凑数用的随机数

                entity.setId(new java.math.BigDecimal(randomNum.nextInt()));
                ReflectUtil.fillsProperty(entity);
            }
            r.put(service.save(entity));
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
    @GeckoAuthority(codes = {"GECKO_DEMO_PUB_ENTTYPE_EXPORT"})
    public R export(@PathVariable String[] ids) {
        return R.ok();
    }
}
