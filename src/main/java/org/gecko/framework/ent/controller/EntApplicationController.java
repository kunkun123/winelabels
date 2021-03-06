package org.gecko.framework.ent.controller;


import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.ent.entity.enums.ApplicationType;
import org.gecko.framework.ent.entity.enums.AuditingStatus;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.framework.model.R;
import org.gecko.framework.ent.entity.EntApplication;
import org.gecko.framework.ent.service.EntApplicationService;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.service.AccountService;
import org.gecko.framework.utils.GenerateIdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * 酒标申请记录控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 20:31:34
 *
 */
@Controller
@RequestMapping("/ent/entapplication")
public class EntApplicationController extends BaseController<EntApplication> {

	@Autowired
	public EntApplicationService service;
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
	 * 酒标申领的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/labelApplyView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView labelApplyView() {
		ModelAndView mad = new ModelAndView("/views/wineLabels/alalcohollable/labelApply.jsp");
		return mad;
	}
	/**
	 * 酒标申领的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/labelManagerView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView labelManagerView() {
		ModelAndView mad = new ModelAndView("/views/wineLabels/alalcohollable/labelManager.jsp");
		return mad;
	}
	/**
	 * 酒标申领查询列表
	 */
	@RequestMapping(value = "/applyList" ,method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<EntApplication> lableApplyList(Page<EntApplication> page,HttpServletRequest request,HttpSession session) throws ParseException {
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		page.setLimit(1000);
		EntApplication param = new EntApplication();
		String startDateSearch = request.getParameter("startDateSearch");
		String endDateSearch = request.getParameter("endDateSearch");
		String auditStatusSearch = request.getParameter("auditStatusSearch");
		
		if(!org.springframework.util.StringUtils.isEmpty(auditStatusSearch)){
			if(auditStatusSearch.equals("UN")){
				param.setAuditingstatus(AuditingStatus.UN);
			}
			else if(auditStatusSearch.equals("ON")){
				param.setAuditingstatus(AuditingStatus.ON);
			}
			else if(auditStatusSearch.equals("NE")){
				param.setAuditingstatus(AuditingStatus.NE);
			}
		}
		if(null!=account){
			param.setApplicant(account.getId());
		}
		List<EntApplication> entApplications = service.find(param);
		if(!org.springframework.util.StringUtils.isEmpty(startDateSearch) 
				&& org.springframework.util.StringUtils.isEmpty(endDateSearch)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = simpleDateFormat.parse(startDateSearch);
			for (Iterator iterator = entApplications.iterator(); iterator.hasNext();) {
				EntApplication entApplication = (EntApplication) iterator.next();
				java.util.Date applicanDate = entApplication.getApplicandate();
				if(applicanDate.before(date)){
					iterator.remove();
				}
			}
		}
		if(!org.springframework.util.StringUtils.isEmpty(endDateSearch) 
				&& org.springframework.util.StringUtils.isEmpty(startDateSearch)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = simpleDateFormat.parse(endDateSearch);
			for (Iterator iterator = entApplications.iterator(); iterator.hasNext();) {
				EntApplication entApplication = (EntApplication) iterator.next();
				java.util.Date applicanDate = entApplication.getApplicandate();
				if(applicanDate.after(date)){
					iterator.remove();
				}
			}
		}
		if(!org.springframework.util.StringUtils.isEmpty(endDateSearch) 
				&& !org.springframework.util.StringUtils.isEmpty(startDateSearch)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date endDate = simpleDateFormat.parse(endDateSearch);
			java.util.Date startDate = simpleDateFormat.parse(startDateSearch);
			for (Iterator iterator = entApplications.iterator(); iterator.hasNext();) {
				EntApplication entApplication = (EntApplication) iterator.next();
				java.util.Date applicanDate = entApplication.getApplicandate();
				if(applicanDate.before(startDate)||applicanDate.after(endDate)){
					iterator.remove();
				}
			}
		}
		List<EntApplication> appplyList = new ArrayList<EntApplication>();
		for(Iterator iterator = entApplications.iterator();iterator.hasNext();){
			EntApplication entApplication = (EntApplication) iterator.next();
			EntApplication showList = new EntApplication();
			showList.setId(entApplication.getId());
			showList.setApplicandate(entApplication.getApplicandate());
			ProductType productType = entApplication.getProducttype();
			if(productType!=null){
				showList.setTemp1(productType.getValue());
			}
			showList.setProductnumber(entApplication.getProductnumber());
			showList.setTemp2(entApplication.getAuditingstatus().getValue());
			showList.setReason(entApplication.getReason());
			showList.setAuditdate(entApplication.getAuditdate());
			if(entApplication.getAuditingstatus().getKey()==3){
				showList.setAuditdate(null);
			}
			String application = entApplication.getAuditor();
			Account account1  = accountService.get(application);
			if(account1!=null){
				showList.setAuditor(account1.getRealName());
			}
			
			
			appplyList.add(showList);
		}

		return appplyList;
	}
	/**
	 *
	 * @param @param id 唯一ID
	 * @param id 唯一ID
	 * @return R  返回类型
	 */
	@RequestMapping(value = "/get/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_ENT_ENT_APPLICATION_VIEW"})
	public R get(@PathVariable String id) {
		EntApplication entapplication = service.get(id);
		return R.ok().put(entapplication);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_ENT_ENT_APPLICATION_EDIT"})
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
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_ENT_ENT_APPLICATION_DELETE"})
	public ModelAndView delete(@RequestBody  String[] ids) {
    	ModelAndView mad = new ModelAndView("/ent/entapplication/labelApplyView");
		service.batchDelete(ids);
		return mad;
	}

	/**
     * save 保存对象
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/save", method = {RequestMethod.PUT, RequestMethod.GET ,RequestMethod.POST})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_ENT_ENT_APPLICATION_NEW", "GECKO_ENT_ENT_APPLICATION_EDIT"})
	public ModelAndView save(EntApplication entity , HttpSession session) {
		Account account = (Account)session.getAttribute(GeckoProperties.SESSION_KEY);
        R r = new R();
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			service.update(entity);
            r = R.ok();
		} else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
                entity.setId(GenerateIdUtils.generateId32());
                entity.setApplicant(account.getId());
				entity.setCreator(account.getId());
				entity.setAduittype(ApplicationType.WINELABELS);
				entity.setAuditingstatus(AuditingStatus.NE);
				java.util.Date date = new java.util.Date();
                entity.setApplicandate(new Date(date.getTime()));
                entity.setAuditdate(null);
                ReflectUtil.fillsProperty(entity);
            }
			r.put(service.save(entity));
		}
		ModelAndView mav = new ModelAndView("/ent/entapplication/labelApplyView");
		return mav;
	}

	/**
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_ENT_ENT_APPLICATION_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
}
