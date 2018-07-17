package org.gecko.framework.notice.controller;


import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.notice.entity.MgNotice;
import org.gecko.framework.notice.service.MgNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 * MG_NOTICE控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-12-21 16:18:51
 *
 */
@Controller
@RequestMapping("/notice/mgnotice")
public class MgNoticeController extends BaseController<MgNotice> {

	@Autowired
	public MgNoticeService service;

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
	 * 备忘录的页面展示

	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/noticeListView")
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_QUERY"})
	public ModelAndView noticeListView(){
		ModelAndView mad = new ModelAndView("/views/notice/mgnotice/mgnotice.jsp");

		return mad;
	}

	/**
	 * 公告主页面专用

	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/noticeListView4Home")
	@ResponseBody
	public Page<MgNotice> noticeListView4Home(){

		Page<MgNotice> page = new Page<MgNotice>();
		MgNotice param = new MgNotice();
		//param.setUserid("%" + page.getSearch() + "%");

		page = service.likeByPage(param, page);

		return page;
	}

	/**
	 * 备忘录的页面展示

	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/noticeAdd")
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_NEW", "GECKO_NOTICE_MG_NOTICE_EDIT"})
	public ModelAndView noticeAddView(){
		ModelAndView mad = new ModelAndView("/views/notice/mgnotice/mgnoticeAdd.jsp");

		return mad;
	}

	/**
	 * 数据列表
	 * @param page 分页设置

	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_QUERY"})
	public Page<MgNotice> list(Page<MgNotice> page,HttpServletRequest request) throws IOException, ParseException{
        MgNotice param = new MgNotice();
		String serial = request.getParameter("serial");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String title = request.getParameter("title");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		/*
		if(!("".equals(startDate))){
			param.setPublicdate(new Date(sdf.parse(startDate).getTime()));
		}
		if(!("".equals(endDate))){
			param.setPublicdate(new Date(sdf.parse(endDate).getTime()));
		}
		*/
		if(!("".equals(serial))){
			param.setSerialno(serial);
		}
		if(!("".equals(title))){
			param.setTitle(title);
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
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_VIEW"})
	public R get(@PathVariable String id) {
		MgNotice mgnotice = service.get(id);
		return R.ok().put(mgnotice);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_EDIT"})
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
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_DELETE"})
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
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_NEW", "GECKO_NOTICE_MG_NOTICE_EDIT"})
	public R save(@RequestBody MgNotice entity) throws Exception{
        R r = new R();
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date acceptedDate = new Date(sdf.parse(sdf.format(new java.util.Date())).getTime());
			System.out.println("acceptedDate--->"+acceptedDate.toString());

			if("1".equals(entity.getIspub())){
				entity.setPublicdate(acceptedDate);
			}
			entity.setLastupdatetime(acceptedDate);
			service.update(entity);
            r = R.ok();
		} else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
				String id = "";
                entity.setId(new java.math.BigDecimal(id));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date acceptedDate = new Date(sdf.parse(sdf.format(new java.util.Date())).getTime());
				System.out.println("acceptedDate--->"+acceptedDate.toString());

				if("1".equals(entity.getIspub())){
					entity.setPublicdate(acceptedDate);
				}else{
					entity.setPublicdate(null);
				}
                entity.setLastupdatetime(acceptedDate);
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
	@GeckoAuthority(codes = {"GECKO_NOTICE_MG_NOTICE_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat timeFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss"); //时间格式
		binder.registerCustomEditor(Date.class, "publicdate", new CustomDateEditor(timeFormat, true));
		binder.registerCustomEditor(Date.class, "lastupdatetime", new CustomDateEditor(timeFormat, false));
	}
}
