package org.gecko.framework.test.pubdata;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import java.util.List;
import java.util.Random;

import org.gecko.core.test.GeckoTestCase;
import org.gecko.framework.pubdata.entity.PubBaseinfoSysarea;
import org.gecko.framework.pubdata.service.PubBaseinfoSysareaService;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.mybatis.page.Page;
import org.gecko.common.utils.ReflectUtil;
import org.junit.Test;
import org.junit.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.web.context.WebApplicationContext;



/**
 *
 * TestPubBaseinfoSysareaCase
 * PubBaseinfoSysarea测试用例
 * @author Gecko.Platform
 *
 */
public class TestPubBaseinfoSysareaCase extends GeckoTestCase {
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @javax.annotation.Resource
    protected PubBaseinfoSysareaService service;

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    private static PubBaseinfoSysarea mod =new PubBaseinfoSysarea();

    private static final java.math.BigDecimal id = new java.math.BigDecimal(new Random().nextInt());
    @Before
    public void setUp() {
        this.mockMvc = webAppContextSetup(this.wac).build();

        //TODO set primay key value,设置一个随机主键值
        mod.setId(id);
        //TODO 设置几个属性值
        ReflectUtil.fillsProperty(mod);
    }

    @Test
    public void testAControllers() throws Exception {
        MockHttpServletRequestBuilder requestBuilder = post("/pubdata/pubbaseinfosysarea/index")
                .param("test", "test");//TODO change yourself
        mockMvc.perform(requestBuilder)
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testASave() {
        logger.info("save object: " + mod.getId());
        assertTrue(service.save(mod) != null);
    }

    @Test
    public void testBGet() {
        logger.info("get object with: " + id);
                    PubBaseinfoSysarea m2 = service.get(String.valueOf(id));
                assertTrue(m2 != null && m2.getId().equals(id));
    }

    @Test
    public void testCfindByPage() {
        Page<PubBaseinfoSysarea> page = new Page<>();
        PubBaseinfoSysarea m1 = new PubBaseinfoSysarea();
        page = service.findByPage(m1, page);
        assertTrue(page.getRows().size() > 0);


        m1.setId(id);
        page = service.findByPage(m1, page);
        assertTrue(page.getRows().size() == 1);
    }

    @Test
    public void testEfind() {
        PubBaseinfoSysarea m1 = new PubBaseinfoSysarea();
        List<PubBaseinfoSysarea> list = service.find(m1);
        assertTrue(list != null && list.size() > 0);
        logger.info("find " + m1.getClass().getSimpleName() + " count: " + list.size());

        m1.setId(id);
        list = service.find(m1);
        assertTrue(list != null && list.size() > 0);
        logger.info("find " + m1.getClass().getSimpleName() + " " + id + ", " + list.size());
    }

    @Test
    public void testFcount() {
        PubBaseinfoSysarea m1 = new PubBaseinfoSysarea();
        int count = service.count(m1);
        assertTrue(count > 0);
        logger.info("count size: " + count);
    }

    @Test
    public void testGupdate() {
        PubBaseinfoSysarea m1 = service.get(String.valueOf(id));
        logger.info("update before: " + id + ", " + m1.getClass().getSimpleName() + ", " + m1.toString());
        assertTrue(service.update(m1) != null);
        logger.info("update after: " + id + ", " + m1.getClass().getSimpleName() + ", " + m1.toString());
    }

    @Test
    public void testZDetete() {
        logger.info("delete object by object: " + id);
        service.save(mod);
        assertTrue(service.delete(mod) == 1);
    }

    @Test
    public void testZDeteteById() {
        logger.info("delete object by: " + id);
        assertTrue(service.deleteById(String.valueOf(id)) == 0);
        logger.info("delete " + mod.getClass().getSimpleName() + ", " + id);
    }
}

