package org.gecko.framework.ent.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.ent.entity.EntEntbasic;
import org.gecko.framework.ent.entity.enums.AuditingStatus;
import org.gecko.framework.ent.entity.enums.EntType;
import org.gecko.framework.ent.service.EntEntbasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/**
 * ENT_ENTBASIC控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 16:26:47
 *
 */
@Controller
@RequestMapping("/ent/ententbasic")
public class EntEntbasicController extends BaseController<EntEntbasic> {

	@Autowired
	public EntEntbasicService service;

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
	 *查询销售企业
	 */
	@RequestMapping(value = "/businessEntList", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_ENT_ENT_ENTBASIC_QUERY"})
	public List<EntEntbasic> businessEntList() {
		EntEntbasic entBasic = new EntEntbasic();
		//审核通过
		entBasic.setStatus(AuditingStatus.ON);
		//经销企业
		entBasic.setEnttype(EntType.BU);
		List<EntEntbasic> entBasics = service.find(entBasic);
		return entBasics;
	}
	/**
	 *查询当前登录的企业信息
	 */
	@RequestMapping(value = "/currentEntBasicInfo", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_ENT_ENT_ENTBASIC_QUERY"})
	public ModelAndView currentEntBasicInfo(HttpSession session) {
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		String entId = account.getPrincipal();
		EntEntbasic entBasic = service.get(entId);
		ModelAndView mad = new ModelAndView("/views/ent/ententbasic/ententbasic.jsp");
		String[] permissUrl = new String[4];
		if(!org.springframework.util.StringUtils.isEmpty(entBasic.getBusinesspermissionurl())){
			permissUrl[0]=entBasic.getBusinesspermissionurl();
		}
		if(!org.springframework.util.StringUtils.isEmpty(entBasic.getProducepermissionurl())){
			permissUrl[1]=entBasic.getProducepermissionurl();
		}
		if(!org.springframework.util.StringUtils.isEmpty(entBasic.getImportpermissionurl())){
			permissUrl[2]=entBasic.getImportpermissionurl();
		}
		if(!org.springframework.util.StringUtils.isEmpty(entBasic.getSellpermissionurl())){
			permissUrl[3]=entBasic.getSellpermissionurl();
		}
		mad.addObject("entBasic", entBasic);
		mad.addObject("permissUrl", permissUrl);
		return mad;
	}
	
}
