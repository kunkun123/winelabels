package org.gecko.framework.system.controller;

import org.gecko.common.utils.GeckoProperties;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.service.AccountService;
import org.gecko.framework.system.service.ResourceService;
import org.gecko.framework.system.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    Logger logger = LoggerFactory.getLogger("");

    @Autowired
    private AccountService accountService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login(@ModelAttribute("account") Account account,
                              HttpServletRequest request, HttpServletResponse response) {
    	logger.info("------------------------------------------ghjlkdsaffffffffadsffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
        HttpSession session = request.getSession();
        account.setGender("null");
        // set accountEntity, userAuthorities
        ModelAndView view = new ModelAndView(GeckoProperties.loginPath());
        logger.debug(account.toString());
        Account accountEntity;
        try {
			accountEntity = accountService.login(account);
			if (accountEntity != null) {
                view = new ModelAndView("redirect:/mainpage/list");
                session.setAttribute(GeckoProperties.SESSION_KEY, accountEntity);
			}else{
				view.addObject("msg", "用户名或密码错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return view;
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:" + GeckoProperties.loginPath());
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView index = new ModelAndView("/views/index.jsp");
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
        index.addObject("menuList", resourceService.menuList(account.getId()));
        index.addObject("roleList", roleService.getRoles(account.getId()));
        return index;
    }
}
