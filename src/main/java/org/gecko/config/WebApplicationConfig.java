package org.gecko.config;

import org.gecko.core.security.interceptor.SecurityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Gecko Framework 的所有固定配置在代码设定，尽可能的减少
 * XML配置，简化使用
 * 下一个版本中开发并测试
 * 暂停, 20170831
 */
//@Configuration
//@EnableWebMvc
//@ComponentScan(value = {"org.gecko.framework", "org.gecko.core.interceptors", "org.gecko.core.aspect"})
public class WebApplicationConfig extends WebMvcConfigurerAdapter {
    @Autowired
    SecurityInterceptor interceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor);
        super.addInterceptors(registry);
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/", ".jsp");
        super.configureViewResolvers(registry);
    }

}
