package org.gecko.core.security.interceptor;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.JsonUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.cache.GeckoCache;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.entity.enums.RoleType;
import org.gecko.framework.system.service.AuthorityService;
import org.gecko.framework.system.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static org.gecko.common.utils.GeckoProperties.SESSION_KEY;

/**
 * 权限和用户
 *
 * @author NiuPanfeng
 */
@Component
public class SecurityInterceptor extends HandlerInterceptorAdapter {
    private final Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);

    @Autowired
    private final AuthorityService authorityService;

    @Autowired
    private final RoleService roleService;

    @Autowired
    public SecurityInterceptor(AuthorityService authorityService, RoleService roleService) {
        this.authorityService = authorityService;
        this.roleService = roleService;
    }

    @Override
    public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler)
            throws Exception {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        // 是否开启安全拦截
        if (!GeckoProperties.isEnableSecurity()) {
            // 在session中加入一个临时账户
            if (request.getSession().getAttribute(SESSION_KEY) == null) {
                request.getSession().setAttribute(SESSION_KEY, createTempAccount());
            }
            return true;
        }

        String requestPath = request.getServletPath();
        logger.debug(Arrays.toString(GeckoProperties.ignorePaths().toArray()));
        // 跳过忽略路径的判断
        for (String path : GeckoProperties.ignorePaths()) {
            if (new AntPathMatcher().match(path, requestPath)) {
                logger.trace("忽略路径:{} ", requestPath);
                return true;
            }
        }

        // 根据用户判断
        Account accountEntity = getSessionUser(request, SESSION_KEY);

        if (null == accountEntity) {
            final String login_path = GeckoProperties.getString(GeckoProperties.LOGIN_PATH);
            logger.debug("请求路径：{}被拒绝，账户未登录，跳转到登录页面：{}", requestPath, login_path);
            response.sendRedirect(login_path);
            return false;
        }

        // 开启高级特性，增加对操作的权限判断
        if (GeckoProperties.isAdvancedSecurity()) {
            if (SAFETY_ROOT.equals(requestPath)) {
                logger.debug("加载用户{}的权限至缓存", accountEntity.getPrincipal());
                cacheCurUserAuthority(accountEntity);
            }

            GeckoAuthority geckoAuthority = null;
            if (handler instanceof HandlerMethod) {
                geckoAuthority = ((HandlerMethod) handler).getMethodAnnotation(GeckoAuthority.class);
                if (null == geckoAuthority) {
                    // 没有声明权限,放行
                    return true;
                }
            } else {
                return true;
            }

            List<Integer> roleTypes = roleService.roleType(accountEntity.getId()) ;
            for (@SuppressWarnings("rawtypes")
			Iterator iterator = roleTypes.iterator(); iterator.hasNext();) {
				Integer roleType = (Integer) iterator.next();
				if(roleType!=null){
					 if (roleType == RoleType.ADMIN.getKey()) {//管理员，放行
			                return true;
			         }
				}
			}
	           
            //Map<String, String> userAuthorities = (Map<String, String>) GeckoCache.get(CACHE_KEY_AUTHORITY, accountEntity.getId());
            Map<String, String> userAuthorities = authorityService.getAuthMapByAccountId(accountEntity.getId());
            for (String authCode : geckoAuthority.codes()) {
                if (userAuthorities != null && userAuthorities.containsKey(authCode))
                    return true;
            }
            logger.error("禁止用户{}:{}访问路径{},因为未赋予{}权限", accountEntity.getId(), accountEntity.getPrincipal(), requestPath, geckoAuthority.codes());

            StringBuilder errorMsg = new StringBuilder();
            for (String code : geckoAuthority.codes()) {
                errorMsg.append("或").append(code);
            }

//            JsonUtil.writeObject(response.getWriter(), R.error(
//                    "访问被拒绝,未授权。需要:" + errorMsg.toString().replaceFirst("或", "")));
            final String no_authority = GeckoProperties.getString("security.no_authority");
            response.sendRedirect(no_authority);

            return false;
        } else {
            return true;
        }
    }

    /**
     * 将当前用户权限加载至缓存
     *
     * @param user 账号
     */
    private void cacheCurUserAuthority(Account user) {
        Map<String, Map<String, String>> userAuthority = new HashMap<>(1);
        //权限
        userAuthority.put(user.getId(), authorityService.getAuthMapByAccountId(user.getId()));
        GeckoCache.set(CACHE_KEY_AUTHORITY, userAuthority);
    }

    /**
     * 创建一个包含所有访问权限的临时账户，在安全设置关闭的情况下使用.
     *
     * @return 临时账户
     */
    private Account createTempAccount() {
        Account account = new Account();
        account.setId("tmp-" + RandomUtils.nextInt());
        account.setPrincipal("tmp-" + RandomStringUtils.random(3));
        return account;
    }

    /**
     * 从HttpSession中获取账户信息.
     */
    private Account getSessionUser(final HttpServletRequest httpServletRequest, final String sessionKey) {
        return (Account) httpServletRequest.getSession().getAttribute(sessionKey);
    }

    // 默认参数
    private static final String SAFETY_ROOT = "/";
    private static final String CACHE_KEY_AUTHORITY = "cache_key_authority";

}
