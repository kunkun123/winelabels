package org.gecko.framework.tax.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.spi.LoggerFactory;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.base.BaseGeckoService;
import org.gecko.framework.ent.entity.EntApplication;
import org.gecko.framework.ent.entity.enums.EntType;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.framework.message.SocketListener;
import org.gecko.framework.message.SocketWebsocketListener;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.service.AccountService;
import org.gecko.framework.utils.GenerateIdUtils;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;
import org.gecko.framework.wineLabels.entity.AlAlcohollable;
import org.gecko.framework.wineLabels.entity.AlCirculation;
import org.gecko.framework.wineLabels.entity.AlProduct;
import org.gecko.framework.wineLabels.entity.enums.WineLablesStatus;
import org.gecko.framework.wineLabels.entity.enums.WineLablesType;
import org.gecko.framework.wineLabels.service.AlAlcoholflowService;
import org.gecko.framework.wineLabels.service.AlAlcohollableService;
import org.gecko.framework.wineLabels.service.AlProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import oracle.sql.DATE;


/**
 * 商品表控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:25:28
 *
 */
@Controller
@RequestMapping("/tax/alproduct")
public class TagAlProductController extends BaseController<AlProduct> {
	@Autowired
	public AlProductService service;
	@Autowired
	public AccountService accountService;
	
	
	@Autowired
	private AlAlcohollableService  alcohollableService;
	@Autowired
	private AlProductService alProductService;
	@Autowired
	private AlAlcoholflowService alcoholflowService;
	
	
	/**
	 * 生产采集的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/productionCollectionView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productionCollectionView() {
		ModelAndView mad = new ModelAndView("/views/tax/productCollecting.jsp");
		return mad;
	}
	/**
	 * 生产采集任务的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/productionTaskView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productionTaskView() {
		ModelAndView mad = new ModelAndView("/views/tax/productionTask.jsp");
		return mad;
	}
	/**
     * 添加生产任务
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/addTask", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView save(final AlProduct entity,HttpSession session) {
		ModelAndView mad = new ModelAndView("/tax/alproduct/productionTaskView");
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			 Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
             entity.setCreator(acct.getId());
             Date now = new Date(); 
             entity.setCreatedate(new java.sql.Date(now.getTime()));
             entity.setCollectiontype(WineLablesType.BOX);
             entity.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
             String specStr = entity.getSpec();
             int spec = 0;
             if(!org.springframework.util.StringUtils.isEmpty(specStr)){
             	spec = Integer.parseInt(specStr);
             	entity.setSpec(specStr);
             	if(spec==1){
             		entity.setCollectiontype(WineLablesType.BOTTLE);
             	}else if(spec>1){
             		entity.setCollectiontype(WineLablesType.BOX);
             	}else{
             		entity.setCollectiontype(WineLablesType.NONE);
             	}
             }
             //未进行生产采集
             entity.setTemp1("0");
			service.update(entity);
		} else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
            	entity.setId(GenerateIdUtils.generateId32());
                /**
                 * 创建者和创建日期
                 */
            	 Account acct = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
                 entity.setCreator(acct.getId());
                 Date now = new Date(); 
                 entity.setCreatedate(new java.sql.Date(now.getTime()));
                 entity.setCollectiontype(WineLablesType.BOX);
                 entity.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
                 String specStr = entity.getSpec();
                 int spec = 0;
                 if(!org.springframework.util.StringUtils.isEmpty(specStr)){
                 	spec = Integer.parseInt(specStr);
                 	entity.setSpec(specStr);
                 	if(spec==1){
                 		entity.setCollectiontype(WineLablesType.BOTTLE);
                 	}else if(spec>1){
                 		entity.setCollectiontype(WineLablesType.BOX);
                 	}else{
                 		entity.setCollectiontype(WineLablesType.NONE);
                 	}
                 }
                 //未进行生产采集
                 entity.setTemp1("0");
                service.save(entity);
            }
		}
		return mad;
	}
	/**
     * save 保存对象
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/editTask", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView edit(AlProduct entity,HttpSession session) {
		ModelAndView mad = save(entity,session);
		return mad;
	}
	/**
	 * 数据列表
	 * @param page 分页设置
	 * @param search 查询参数
	 * @param order 排序
	 * @return R返回类型
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public List<AlProduct> list(HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
		String productName = request.getParameter("productname");
		if(!org.springframework.util.StringUtils.isEmpty(productName)){
			productName = new String(productName.getBytes("iso-8859-1"),"utf-8");
		}
		 
		String producttype = request.getParameter("producttype");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
        List<AlProduct> alProductListShow = new ArrayList<AlProduct>(); 
        if(null!=account){
        	AlProduct param = new AlProduct();
        	param.setCreator(account.getId());
        	if(!org.springframework.util.StringUtils.isEmpty(productName)){
        		param.setProductname(productName);
        	}
        	if(!org.springframework.util.StringUtils.isEmpty(producttype)){
        		if("1".equals(producttype)){
        			param.setProducttype(ProductType.SPIRIT);
        		}else if("2".equals(producttype)){
        			param.setProducttype(ProductType.BEER);
        		}else if("3".equals(producttype)){
        			param.setProducttype(ProductType.YELLOWWINE);
        		}else if("4".equals(producttype)){
        			param.setProducttype(ProductType.OTHERS);
        		}
        	}
        	//未进行生产采集
        	//param.setTemp1("0");
        	List<AlProduct> alProductList = service.find(param);
        	if(!org.springframework.util.StringUtils.isEmpty(startDate) 
    				&& org.springframework.util.StringUtils.isEmpty(endDate)){
    			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    			java.util.Date date = simpleDateFormat.parse(startDate);
    			for (Iterator iterator = alProductList.iterator(); iterator.hasNext();) {
    				AlProduct entApplication = (AlProduct) iterator.next();
    				java.util.Date applicanDate = entApplication.getCreatedate();
    				if(applicanDate.before(date)){
    					iterator.remove();
    				}
    			}
    		}
    		if(!org.springframework.util.StringUtils.isEmpty(endDate) 
    				&& org.springframework.util.StringUtils.isEmpty(startDate)){
    			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    			java.util.Date date = simpleDateFormat.parse(endDate);
    			for (Iterator iterator = alProductList.iterator(); iterator.hasNext();) {
    				AlProduct entApplication = (AlProduct) iterator.next();
    				java.util.Date applicanDate = entApplication.getCreatedate();
    				if(applicanDate.after(date)){
    					iterator.remove();
    				}
    			}
    		}
    		if(!org.springframework.util.StringUtils.isEmpty(endDate) 
    				&& !org.springframework.util.StringUtils.isEmpty(startDate)){
    			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    			java.util.Date endDate1 = simpleDateFormat.parse(endDate);
    			java.util.Date startDate1 = simpleDateFormat.parse(startDate);
    			for (Iterator iterator = alProductList.iterator(); iterator.hasNext();) {
    				AlProduct entApplication = (AlProduct) iterator.next();
    				java.util.Date applicanDate = entApplication.getCreatedate();
    				if(applicanDate.before(startDate1)||applicanDate.after(endDate1)){
    					iterator.remove();
    				}
    			}
    		}
        	for (Iterator iterator = alProductList.iterator(); iterator.hasNext();) {
    			AlProduct alProduct = (AlProduct) iterator.next();
    			String accountId = alProduct.getCreator();
    			if(!org.springframework.util.StringUtils.isEmpty(accountId)){
    				Account acc = accountService.get(accountId);
    				alProduct.setCreator(acc.getRealName());
    			}
    			ProductType productType = alProduct.getProducttype();
    			if(null!=productType){
    				//商品种类
    				alProduct.setTemp1(productType.getValue());
    			}
    			alProductListShow.add(alProduct);
    		}
        }
		return alProductListShow;
	}
	/**
	 * 根据ID列表批量删除对象
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/delete", method = {RequestMethod.DELETE,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
	public ModelAndView delete(@RequestParam("ids")String[] ids) {
    	ModelAndView mad = new ModelAndView("/tax/alproduct/productionTaskView");
		service.batchDelete(ids);
		return mad;
	}
    /**
	 * 根据ID列表批量删除对象
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/info", method = {RequestMethod.DELETE,RequestMethod.GET})
	//@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
	public String info() {
    	 String a  = SocketListener.getInfo();
    	 System.out.println(a);
		return a;
	}
    /**
     * 生产采集demo
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/productCollectionDemo", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView productCollectionDemo(@RequestBody String[] checkedIds, HttpSession session,HttpServletRequest request) {
		ModelAndView mad = new ModelAndView("/tax/alproduct/productionCollectionView");
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		final String accountId = account.getId();
		for (int i = 0; i < checkedIds.length; i++) {
			final String taskId = checkedIds[i];
			/**生产任务入队**/
			collect(taskId,account.getId());
		}

		return mad;
	}
	 
	/**
	 * 生产采集的实时采集页面跳转
	 * @return
	 */
	@RequestMapping(value = "/productCollection", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productCollection(HttpServletRequest request,HttpSession session) {
		String row = request.getParameter("row");
		String batchNum = request.getParameter("batchNum");
		String room = request.getParameter("room");
		String class1 = request.getParameter("class1");
		String transaction = request.getParameter("transaction");
		//session.setAttribute("productInfo", row);
		ModelAndView mad = new ModelAndView("/tax/alproduct/productCollectingView?productId="+row+"&batchNum="+batchNum+"&transaction="
				+transaction+"&class1="+class1+"&room="+room);
		
        //System.out.println("服务器启动...\n");    
        return mad;
	}
	/**
	 * 生产采集的实时采集页面跳转
	 * @return
	 */
	@RequestMapping(value = "/productCollectingView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productCollectingView(HttpServletRequest request) {
		String productId = request.getParameter("productId");
		String batchNum = request.getParameter("batchNum");
		String room = request.getParameter("room");
		String class1 = request.getParameter("class1");
		String transaction = request.getParameter("transaction");
		ModelAndView mad = new ModelAndView("/views/tax/productCollecting.jsp");
		AlProduct alProduct = alProductService.get(productId);
		if(alProduct!=null){
			mad.addObject("alProduct",alProduct);
		}
		mad.addObject("batchNum",batchNum);
		mad.addObject("room",room);
		mad.addObject("class1",class1);
		mad.addObject("transaction",transaction);
		return mad;
	}
	/**
     * 开启线程初始化socket，并接受摄像机数据
     * @param entity
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/reciveDate", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public void reciveDate(HttpServletRequest request,HttpSession session) throws IOException {
		SocketListener server = new SocketListener();
        server.init();
	}
	/**
     * 开启线程初始化socket，并接受摄像机数据
     * @param entity
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/reciveWebsocketDate", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public void reciveWebsocketDate(HttpServletRequest request,HttpSession session) throws IOException {
		SocketWebsocketListener server = new SocketWebsocketListener();
        server.init();
	}
	 /**
     * 生产采集接生产线的
     * @param entity
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/stopCollection", method = {RequestMethod.POST,RequestMethod.GET})
	//@ResponseBody
	public ModelAndView stopCollection(HttpSession session,HttpServletRequest request) throws IOException {
		ModelAndView mad = new ModelAndView("/tax/alproduct/productCollectResultView");
		SocketListener server = new SocketListener();
		
		System.out.println("socket结束...\n");  
		server.stop();
		return mad;
	}
	/**
     * 获得酒标数据，并做处理http://192.168.0.100/F?C=N4F2N124351573811953335c0
     * @param entity
	 * @return 
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/showDate", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<String> showDate(HttpServletRequest request,HttpSession session) throws IOException {
		//SocketListener server = new SocketListener();
		String spec = "1";
		spec = request.getParameter("spec");
		String productId = request.getParameter("productId");
		/**获得酒标信息**/
		String info = SocketListener.getInfo();
		/**处理酒标信息，整理成List**/
		ArrayList<String> collectList = toWinelabelList(info);
        int specInt = Integer.parseInt(spec);
        int size = collectList.size();
        String boxlable = "";
       
        /**建立生产采集关系**/
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		String accountId = account.getId();
        /**1.获取生产任务中的产品信息**/
        AlProduct alproduct = alProductService.get(productId);
        /**2.判断采集的类型**/
        WineLablesType type = alproduct.getCollectiontype();
        //单瓶采集
		if(type==WineLablesType.BOTTLE){
			 List<String> collectNew = collectList.subList(size-specInt,size);
			String alcohollableBottle = collectNew.get(0);
			if(!org.springframework.util.StringUtils.isEmpty(alcohollableBottle)){
				alcohollableBottle = alcohollableBottle.split("@")[0];
			AlAlcohollable alcohollable = new AlAlcohollable();
			alcohollable.setSerial(alcohollableBottle);
			List<AlAlcohollable> alcohollableUsings = alcohollableService.find(alcohollable);
			if(alcohollableUsings.size()>0){
				AlAlcohollable alcohollableUsing = alcohollableUsings.get(0);
				/** 3.建立酒标与商品的关系并更改酒标的状态**/
				alcohollableUsing.setType(WineLablesType.BOTTLE);
				alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
				alcohollableUsing.setProductid(alproduct.getId());
				alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
				alcohollableService.update(alcohollableUsing);
				/**酒标流程表增加记录**/
				flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
			}
		}
		//整箱采集	
		}else if(type==WineLablesType.BOX){
			 List<String> collectNew = collectList.subList(size-specInt-1,size);
			for (int i = 0; i < collectNew.size(); i++) {
				String winelable = collectNew.get(i);
				if(!org.springframework.util.StringUtils.isEmpty(winelable)){
					winelable = winelable.split("@")[0];
					AlAlcohollable alcohollable = new AlAlcohollable();
					alcohollable.setSerial(winelable);
					List<AlAlcohollable> alcohollableUsings = alcohollableService.find(alcohollable);
					if(alcohollableUsings.size()>0){
						AlAlcohollable alcohollableUsing = alcohollableUsings.get(0);
						if(i==0){
							/**箱标,暂定数组中第一条记录是箱标**/
							boxlable = alcohollableUsing.getSerial();
							alcohollableUsing.setBoxlable("");
							alcohollableUsing.setType(WineLablesType.BOX);
							alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
							alcohollableUsing.setProductid(alproduct.getId());
							alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
							alcohollableService.update(alcohollableUsing);
							/**酒标流程表增加数据**/
							flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
						}else{
							/**4.建立酒标与商品的关系并更改酒标的状态**/
							alcohollableUsing.setType(WineLablesType.BOTTLE);
							alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
							alcohollableUsing.setProductid(alproduct.getId());
							alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
							alcohollableUsing.setBoxlable(boxlable);
							alcohollableService.update(alcohollableUsing);
							/**酒标流程表增加数据**/
							flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
						}
					}
				}
				
			}
		}
		/**5.已经进行生产采集的状态**/
		//alproduct.setTemp1("1");
		//alProductService.update(alproduct);
        return collectList;
	}
	/**
     * 获得酒标数据，并做处理http://192.168.0.100/F?C=N4F2N124351573811953335c0
     * @param entity
	 * @return 
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/deleteCollection", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView deleteCollection(HttpServletRequest request,HttpSession session) throws IOException {
		String winelable = request.getParameter("winelable");
		AlAlcohollable alcohollable = new AlAlcohollable();
		alcohollable.setSerial(winelable);
		List<AlAlcohollable> alcohollableUsings = alcohollableService.find(alcohollable);
		if(alcohollableUsings.size()>0){
			AlAlcohollable alcohollableUsing = alcohollableUsings.get(0);
			alcohollableUsing.setStatus(WineLablesStatus.UNUSERD);
			alcohollableUsing.setProductid(null);
			alcohollableUsing.setType(null);
			alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
			alcohollableService.update(alcohollableUsing);
			/**删除流程记录**/
			AlAlcoholflow alcoholflow = new AlAlcoholflow();
				alcoholflow.setFlowname("生产采集");
				alcoholflow.setSerial(winelable);
				List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
			if(alcoholflows.size()>0){
				String flowId = alcoholflows.get(0).getId();
				alcoholflowService.deleteById(flowId);
			}
			/**删除设备传来的酒标信息**/
			String[] collectArr = SocketListener.info.split(",");
			ArrayList<String> collectArrList = new ArrayList<String>();
			for (int i = 0; i < collectArr.length; i++) {
				collectArrList.add(collectArr[i]);
			}
			 Iterator<String> it = collectArrList.iterator();
			    while (it.hasNext()) {
			        String s = it.next();
			        if (s.contains(winelable)) {
			            it.remove();
			        }
			    }
			 SocketListener.info = StringUtils.strip(collectArrList.toString(),"[]");
		}
		/**关联的瓶标删除**/
		AlAlcohollable alcohollableBottle = new AlAlcohollable();
		alcohollableBottle.setBoxlable(winelable);
		List<AlAlcohollable> alcohollableBottles = alcohollableService.find(alcohollableBottle);
		for (Iterator iterator = alcohollableBottles.iterator(); iterator.hasNext();) {
			AlAlcohollable alAlcohollable = (AlAlcohollable) iterator.next();
			alAlcohollable.setStatus(WineLablesStatus.UNUSERD);
			alAlcohollable.setProductid(null);
			alAlcohollable.setType(null);
			alAlcohollable.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
			alcohollableService.update(alAlcohollable);
			/**删除流程记录**/
			AlAlcoholflow alcoholflow = new AlAlcoholflow();
				alcoholflow.setFlowname("生产采集");
				alcoholflow.setSerial(alAlcohollable.getSerial());
				List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
			if(alcoholflows.size()>0){
				String flowId = alcoholflows.get(0).getId();
				alcoholflowService.deleteById(flowId);
			}
			/**删除设备传来的酒标信息**/
			/**删除设备传来的酒标信息**/
			String[] collectArr = SocketListener.info.split(",");
			ArrayList<String> collectArrList = new ArrayList<String>();
			for (int i = 0; i < collectArr.length; i++) {
				collectArrList.add(collectArr[i]);
			}
			 Iterator<String> it = collectArrList.iterator();
			    while (it.hasNext()) {
			        String s = it.next();
			        if (s.contains(alAlcohollable.getSerial())) {
			            it.remove();
			        }
			    }
			 SocketListener.info = StringUtils.strip(collectArrList.toString(),"[]");
		}
		System.out.println("------------------------"+SocketListener.info);
		return new ModelAndView("/views/tax/productCollectingShow.jsp");
	}
	private ArrayList<String> toWinelabelList(String info) {
		/**http://192.168.0.100/F?C=892NMJH235157381309979841,
			http://192.168.0.100/F?C=SHD8123NM5157376872018701,
			http://192.168.0.100/F?C=892NMJH2351573813100148c0,
			http://192.168.0.100/F?C=N4F2N12435157381195266600,
			http://192.168.0.100/F?C=N4F2N124351573811953335c0_,**/
		ArrayList<String> collect = new ArrayList<String>();
		String[] collectArr = info.split(",");
		int k = 0;
		
		for (int i = 0; i < collectArr.length; i++) {
			String[] winelabelArr = collectArr[i].split("=");
			//调整顺序，将带"_"为箱标，调整到第一位。
			if(winelabelArr[1].contains("_")){
				collect.add(k, winelabelArr[1].replace("_", "")+"@"+ winelabelArr[2]);
				k+=5;
			}else{
				collect.add(winelabelArr[1]+"@"+ winelabelArr[2]);
			}
		}
		return collect;
	}
	/** 1.建立酒标与商品的关系，并更改酒标的状态，酒标流程表添加记录  **/
	private void collect(String taskId, String accountId){
		//根据产品表的id获得产品
		AlProduct alproduct = alProductService.get(taskId);
		WineLablesType type = alproduct.getCollectiontype();
		if(type==WineLablesType.BOTTLE){
			/**1.查询该企业、该产品类型、未使用的酒标数量是否足够**/
			AlAlcohollable alcohollable = new AlAlcohollable();
			alcohollable.setOwner(accountId);
			alcohollable.setAltype(alproduct.getProducttype());
			alcohollable.setStatus(WineLablesStatus.UNUSERD);
			List<AlAlcohollable> alcohollables = alcohollableService.find(alcohollable);
			if(alcohollables.size()>0){
				AlAlcohollable alcohollableUsing = alcohollables.get(0);
				/** 2.建立酒标与商品的关系并更改酒标的状态**/
				alcohollableUsing.setType(WineLablesType.BOTTLE);
				alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
				alcohollableUsing.setProductid(alproduct.getId());
				alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
				alcohollableService.update(alcohollableUsing);
				/**酒标流程表增加记录**/
				flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
			}else{
				System.out.println("酒标不足请申请！");
				return;
			}
		}else if(type==WineLablesType.BOX){
			/**箱装，获得各瓶；**/
			String specStr = alproduct.getSpec();
			int spec = 0;
			if(!org.springframework.util.StringUtils.isEmpty(specStr)){
				/**1.查询该企业、该产品类型、未使用的酒标数量是否足够**/
				spec = Integer.parseInt(specStr);
				AlAlcohollable alcohollable = new AlAlcohollable();
				alcohollable.setOwner(accountId);
				alcohollable.setAltype(alproduct.getProducttype());
				alcohollable.setStatus(WineLablesStatus.UNUSERD);
				List<AlAlcohollable> alcohollables = alcohollableService.find(alcohollable);
				if(alcohollables.size() > spec){
					String boxlable = "";
					for (int i = 0; i < spec+1; i++) {
						AlAlcohollable alcohollableUsing = alcohollables.get(i);
						
						if(i==0){
							/**箱标**/
							boxlable = alcohollableUsing.getSerial();
							alcohollableUsing.setType(WineLablesType.BOX);
							alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
							alcohollableUsing.setProductid(alproduct.getId());
							alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
							alcohollableService.update(alcohollableUsing);
							/**酒标流程表增加数据**/
							flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
						}else{
							/** 2.建立酒标与商品的关系并更改酒标的状态**/
							alcohollableUsing.setType(WineLablesType.BOTTLE);
							alcohollableUsing.setStatus(WineLablesStatus.UNCIRCULATION);
							alcohollableUsing.setProductid(alproduct.getId());
							alcohollableUsing.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
							alcohollableUsing.setBoxlable(boxlable);
							alcohollableService.update(alcohollableUsing);
							/**酒标流程表增加数据**/
							flowAccount(alcohollableUsing.getSerial(),"生产采集",accountId);
						}
					}
				}
			}
			
		}
		//已经进行生产采集的状态
		alproduct.setTemp1("1");
		alProductService.update(alproduct);
	}
	private void flowAccount(String serial, String flowname, String accountId) {
		/**生产采集反复采集只记录一次数据**/
		if("生产采集".equals(flowname)){
			AlAlcoholflow alcoholflow = new AlAlcoholflow();
			alcoholflow.setFlowname("生产采集");
			alcoholflow.setSerial(serial);
			if(alcoholflowService.find(alcoholflow).size()>0)	
				return;
		}
		AlAlcoholflow alcoholflow = new AlAlcoholflow();
		alcoholflow.setFlowname(flowname);
		alcoholflow.setId(GenerateIdUtils.generateId32());
		alcoholflow.setSerial(serial);
		alcoholflow.setCreator(accountId);
		alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
		alcoholflowService.save(alcoholflow);
	}
	/**
     * 采集结果页面跳转
     * @param entity
     * @return R返回类型
	 * @throws IOException 
     */
	@RequestMapping(value = "/productCollectResultView", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView productCollectResultView(HttpServletRequest request,HttpSession session) throws IOException {
		ModelAndView mad = new ModelAndView("/views/tax/prodcuctResult.jsp");
		return mad;
	}
	/**
	 * 采集结果查询列表
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/productCollectResult", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
		public List<AlAlcohollable> labelManagerList(Page<AlAlcohollable> page ,HttpServletRequest request,HttpSession session) throws ParseException, UnsupportedEncodingException{
		page.setLimit(1000);
		//页面table显示
		List<AlAlcohollable> managerList = new ArrayList<AlAlcohollable>();
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		AlAlcohollable param = new AlAlcohollable();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String winelabelCode = request.getParameter("winelabelCode");
		String productidSearch = new String(request.getParameter("productname").getBytes("iso-8859-1"),"utf-8");
		String equipmentId = request.getParameter("equipmentId");
		String statusSearch = request.getParameter("statusSearch");
		String winelabeltype = request.getParameter("winelabeltype");
		String producttype = request.getParameter("producttype");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		/**只考虑 酒标状态是未流转 的酒标，销售出库状态则改为 流转中**/
		//param.setStatus(WineLablesStatus.UNCIRCULATION);
		//查询条件
		
		if(!org.springframework.util.StringUtils.isEmpty(equipmentId)){
			if(!"hikvision201711234323".equals(equipmentId)){
				return managerList;
			}
		}
		if(!org.springframework.util.StringUtils.isEmpty(winelabelCode)){
			param.setSerial(winelabelCode);
		}
		if(!org.springframework.util.StringUtils.isEmpty(statusSearch)){
			if(statusSearch.equals("UNUSERD")) {
				param.setStatus(WineLablesStatus.UNUSERD);
			}
			else if(statusSearch.equals("UNCIRCULATION")){
				param.setStatus(WineLablesStatus.UNCIRCULATION);
			}
			else if(statusSearch.equals("CIRCULATIONING")){
				param.setStatus(WineLablesStatus.CIRCULATIONING);
			}
			else if(statusSearch.equals("WRITTENOFF")){
				param.setStatus(WineLablesStatus.WRITTENOFF);
			}
		}
		if(!org.springframework.util.StringUtils.isEmpty(winelabeltype)){
			if(winelabeltype.equals("BOX")) {
				param.setType(WineLablesType.BOX);
			}
			else if(winelabeltype.equals("BOTTLE")){
				param.setType(WineLablesType.BOTTLE);
			}
		}
		
		if(account!=null){
			param.setApplicant(account.getId());
			List<AlAlcohollable> alAlcohollables = alcohollableService.find(param);
			
	        	for (Iterator iterator = alAlcohollables.iterator(); iterator.hasNext();) {
	        		AlAlcohollable alcohollable = (AlAlcohollable) iterator.next();
	        		if(!org.springframework.util.StringUtils.isEmpty(productidSearch)){
	        			String alproductId = alcohollable.getProductid();
						if(org.springframework.util.StringUtils.isEmpty(alproductId)){
							continue;
						}
						AlProduct alproduct = alProductService.get(alproductId);
						if(!productidSearch.equals(alproduct.getProductname())){
							iterator.remove();
						}
						
					}
	        		if(!org.springframework.util.StringUtils.isEmpty(producttype)){
	        			String alproductId = alcohollable.getProductid();
						if(org.springframework.util.StringUtils.isEmpty(alproductId)){
							continue;
						}
						AlProduct alproduct = alProductService.get(alproductId);
						if(!producttype.equals(alproduct.getProducttype().toString())){
							iterator.remove();
						}
						
					}
	        		WineLablesStatus status = alcohollable.getStatus();
	        		if(status.getKey()==4){
	        			iterator.remove();
	        		}
				}
	        
			for(Iterator iterator = alAlcohollables.iterator();iterator.hasNext();){
				AlAlcohollable alAlcohollable = (AlAlcohollable) iterator.next();
					if(org.springframework.util.StringUtils.isEmpty(alAlcohollable.getProductid())){
						continue;
					}
					AlAlcohollable showList = new AlAlcohollable();
					showList.setSerial(alAlcohollable.getSerial());
					showList.setStatus(alAlcohollable.getStatus());
					showList.setApplicanid(alAlcohollable.getStatus().getValue());
					showList.setBoxlable(alAlcohollable.getBoxlable());
					//设备编号，暂时写死
					showList.setTemp1("hikvision201711234323");
					String serial = alAlcohollable.getSerial();
					AlAlcoholflow alcoholflow = new AlAlcoholflow();
					alcoholflow.setSerial(serial);
					alcoholflow.setFlowname("生产采集");
					alcoholflow.setCreator(account.getId());
					List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
					if(alcoholflows.size()>0){
						showList.setLastupdatetime(alcoholflows.get(0).getLastupdatetime());
						
					}else{
						showList.setLastupdatetime(alAlcohollable.getLastupdatetime());
					}
					
					//酒标类型
					WineLablesType winelabelsType = alAlcohollable.getType();
					if(winelabelsType!=null){
						showList.setTemp2(winelabelsType.getValue());
					}
					//商品种类
					showList.setTemp3(alAlcohollable.getAltype().getValue());
				//获取商品名称
				AlProduct alProduct = new AlProduct();
				 alProduct.setId(alAlcohollable.getProductid());
				 //alProduct.setBatch("");
				List<AlProduct> alProducts = alProductService.find(alProduct);
				if(alProducts.size() > 0) {
					alProduct = alProducts.get(0);
					showList.setProductid(alProduct.getProductname());
					
				}
				managerList.add(showList);
			}
		}
		return managerList;
	}
}	 
