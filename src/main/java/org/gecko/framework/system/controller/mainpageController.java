package org.gecko.framework.system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gecko.common.utils.GeckoProperties;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.notice.controller.MgNoticeController;
import org.gecko.framework.notice.entity.MgNotice;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonBeanProcessor;

/**
 * 跳转 主页的controller
 * 
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2017年12月25日
 */
@Controller
@RequestMapping("/mainpage")
public class mainpageController {
	
	 
	 @Autowired
	public MgNoticeController mgNoticeController;
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mad1 = new ModelAndView("/views/index.jsp");
		Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		@SuppressWarnings("unchecked")
		List<Role> roleList = (List<Role>) request.getAttribute("roleList");
		
		StringBuilder roleName = new StringBuilder();
		if (acct != null) {
			if (roleList != null)
				for (Role r : roleList) {
					roleName.append(r.getRoleName()).append(", ");
				}
			roleName = new StringBuilder("未指定角色");
		} else {
			ModelAndView mad2 = new ModelAndView("/views/system/login.jsp");
			return mad2;
		}
		
		
		return mad1;
	}
}
