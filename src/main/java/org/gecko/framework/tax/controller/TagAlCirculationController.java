package org.gecko.framework.tax.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.spi.LoggerFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.ent.entity.EntApplication;
import org.gecko.framework.ent.entity.EntEntbasic;
import org.gecko.framework.ent.entity.enums.EntType;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.framework.ent.service.EntEntbasicService;
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
import org.gecko.framework.wineLabels.service.AlCirculationService;
import org.gecko.framework.wineLabels.service.AlProductService;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import oracle.sql.DATE;


/**
 * 商品表控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:25:28
 *
 */
@Controller
@RequestMapping("/tax/alcirculation")
public class TagAlCirculationController extends BaseController<AlProduct> {
	
	@Autowired
	public AlCirculationService service;
	@Autowired
	public AccountService accountService;
	@Autowired
	public AlAlcoholflowService alcoholflowService;
	@Autowired
	public AlAlcohollableService alcohollabelService;
	@Autowired
	public AlProductService alProductService;
	@Autowired
	public EntEntbasicService entbasicService;
	@Autowired
	public AlAlcohollableService alcohollableService;
	@Autowired
	public AlCirculationService alCirculationService;
	
	/**
	 * 销售采集的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/sellCollectionView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productionCollectionView() {
		ModelAndView mad = new ModelAndView("/views/tax/sellCollecting.jsp");
		return mad;
	}
	/**
	 * 应税确认的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/taxConfirmView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView taxConfirmView() {
		ModelAndView mad = new ModelAndView("/views/tax/taxConfirm.jsp");
		return mad;
	}
	/**
	 * 纳税申报的页面跳转
	 * @return
	 */
	@RequestMapping(value = "/taxDeclareView", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView taxDeclareView() {
		ModelAndView mad = new ModelAndView("/views/tax/taxDeclare.jsp");
		return mad;
	}
	/**
     * save 保存对象
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/addTask", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView save(AlProduct entity,HttpSession session) {
		ModelAndView mad = new ModelAndView("/tax/alproduct/productionCollectionView");
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			//service.update(entity);
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
	 * 销售采集的历史信息的列表展示
	 */
	@RequestMapping(value = "/hisCollectionList", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public List<AlCirculation> hisCollectionList(HttpServletRequest request,HttpSession session) throws ParseException {
        AlCirculation param = new AlCirculation();
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
        //用于前台展示的list
        List<AlCirculation> alCirculationsShow = new ArrayList<AlCirculation>();
        if(account!=null){
        	 String principal = account.getId();
             String winelabelCode = request.getParameter("winelabelCode");
             String winelabeltype = request.getParameter("winelabeltype");
             String productname = request.getParameter("productname");
             String prodcttype = request.getParameter("producttype");
             String belowEntId = request.getParameter("belowent");
             String startDate = request.getParameter("startDate");
             String endDate = request.getParameter("endDate");
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String taxConfirm = request.getParameter("taxConfirm");
             if(!org.springframework.util.StringUtils.isEmpty(winelabelCode)){
             	//酒标编号
             	param.setTemp1(winelabelCode);
             }
             if(!org.springframework.util.StringUtils.isEmpty(winelabeltype)){
             	//酒标类型
             	//param.setTemp2(winelabeltype);
             }
             if(!org.springframework.util.StringUtils.isEmpty(productname)){
             	//对应商品名称
             	param.setTemp3(productname);
             }
             if(!org.springframework.util.StringUtils.isEmpty(prodcttype)){
             	//对应商品种类
             	param.setTemp4(prodcttype);
             }
             if(!org.springframework.util.StringUtils.isEmpty(belowEntId)){
             	param.setBelowentid(belowEntId);
             }
             if(!org.springframework.util.StringUtils.isEmpty(startDate)){
             	Date date = sdf.parse(startDate);
             	param.setStarttime(new java.sql.Date(date.getTime()));
             }
             if(!org.springframework.util.StringUtils.isEmpty(endDate)){
             	Date date = sdf.parse(endDate);
             	param.setStarttime(new java.sql.Date(date.getTime()));
             }
             List<AlCirculation> alCirculations = service.findHisAlCirculationByParam(param);
             
             for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
     			AlCirculation alCirculation = (AlCirculation) iterator.next();
     			String saleLinkId = alCirculation.getId();
     			if(!org.springframework.util.StringUtils.isEmpty(saleLinkId)){
     				AlAlcoholflow alcoholflow = new AlAlcoholflow();
     				alcoholflow.setSalelinkid(saleLinkId);
     				List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
     				for (Iterator iterator2 = alcoholflows.iterator(); iterator2.hasNext();) {
     					AlAlcoholflow alAlcoholflow = (AlAlcoholflow) iterator2.next();
     					AlCirculation alCirculationShow = new AlCirculation();
     					String belowEntId1 = alCirculation.getBelowentid();
     					//EntEntbasic entBasic = entbasicService.get(belowEntId1);
     					Account belowEnt = accountService.get(belowEntId1);
     					if(null!=belowEnt){
     						alCirculationShow.setBelowentid(belowEnt.getRealName());
     					}
     					alCirculationShow.setEndtime(alCirculation.getEndtime());
     					alCirculationShow.setStarttime(alCirculation.getStarttime());
     					alCirculationShow.setProductnum(alCirculation.getProductnum());
     					//酒标编号
     					alCirculationShow.setTemp1(alAlcoholflow.getSerial());
     					AlAlcohollable alcohollable = new AlAlcohollable();
     					alcohollable.setSerial(alAlcoholflow.getSerial());
     					alcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
     					List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
     					if(alcohollables.size()==0 && "true".equals(taxConfirm)){
     						continue;
     					}
     					if(alcohollables.size()>0){
     						alcohollable = alcohollables.get(0);
     						//酒标类型
     						alCirculationShow.setTemp2(alcohollable.getType().getValue());
     						WineLablesStatus status = alcohollable.getStatus();
     						if(status!=null){
     							//酒标状态
     							alCirculationShow.setProductnum(status.getValue());
     						}	
     						/**应税确认列表中的酒标当前持有人为销售上游企业**/
     						String topEntId = alCirculation.getTopentid();
     						String owner = alcohollable.getOwner();
     						if(((!principal.equals(belowEntId1))||(principal.equals(owner))||(!topEntId.equals(owner))) && "true".equals(taxConfirm)){
     							continue;
     						}else if("false".equals(taxConfirm) && (!principal.equals(owner))){
     							continue;
     						}
     						AlProduct alproduct = new AlProduct();
     						alproduct.setId(alcohollable.getProductid());
     						List<AlProduct> alproducts = alProductService.find(alproduct);
     						if(alproducts.size()>0){
     							alproduct = alproducts.get(0);
     							//商品名称
     							alCirculationShow.setTemp3(alproduct.getProductname());
     							//商品类型
     							alCirculationShow.setTemp4(alproduct.getProducttype().getValue());
     							
     						alCirculationsShow.add(alCirculationShow);
     					}
     				}
     			}
     		}
            
     	}
        }
        return alCirculationsShow;
}      
	/**
	 * 应税确认和纳税申报的列表展示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/taxConfirmList", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public List<AlCirculation> taxConfirmList(HttpServletRequest request,HttpSession session) throws ParseException, UnsupportedEncodingException {
        AlCirculation param = new AlCirculation();
        Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
        //用于前台展示的list
        List<AlCirculation> alCirculationsShow = new ArrayList<AlCirculation>();
        List<AlCirculation> list1= new ArrayList<AlCirculation>();
		   
        if(account!=null){
        	 String principal = account.getId();
             String winelabelCode = request.getParameter("winelabelCode");
             String winelabeltype = request.getParameter("winelabeltype");
             String productname = new String(request.getParameter("productname").getBytes("iso-8859-1"),"utf-8");
             String prodcttype = request.getParameter("producttype");
             String belowEntId = request.getParameter("belowent");
             String startDate = request.getParameter("startDate");
             String endDate = request.getParameter("endDate");
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String taxConfirm = request.getParameter("taxConfirm");
             if(!org.springframework.util.StringUtils.isEmpty(winelabelCode)){
             	//酒标编号
             	param.setTemp1(winelabelCode);
             }
            
             	//酒标类型
             //	param.setTemp2(WineLablesType.BOTTLE.toString());
             
             if(!org.springframework.util.StringUtils.isEmpty(productname)){
             	//对应商品名称
             	param.setTemp3(productname);
             }
             if(!org.springframework.util.StringUtils.isEmpty(prodcttype)){
             	//对应商品种类
             	param.setTemp4(prodcttype);
             }
             if(!org.springframework.util.StringUtils.isEmpty(belowEntId)){
             	param.setBelowentid(belowEntId);
             }
            
            
             List<AlCirculation> alCirculations = service.findHisAlCirculationByParam(param);
             if(!org.springframework.util.StringUtils.isEmpty(productname)){
             	for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
     				AlCirculation alCirculation = (AlCirculation) iterator.next();
     				String serial = alCirculation.getTemp1();
     				AlAlcohollable alcohollable = new AlAlcohollable();
     				alcohollable.setSerial(serial);
     				List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
     				if(alcohollables.size()>0){
     					String alproductId = alcohollables.get(0).getProductid();
     					AlProduct alproduct = alProductService.get(alproductId);
     					if(!productname.equals(alproduct.getProductname())){
     						iterator.remove();
     					}
     				}
     			}
             }
            if((!org.springframework.util.StringUtils.isEmpty(startDate))
     				&&(!org.springframework.util.StringUtils.isEmpty(endDate))){
     			Iterator<AlCirculation> it = alCirculations.iterator();
     			while(it.hasNext()){
     				AlCirculation alCirculation = (AlCirculation) it.next();
     				Date collectDate = alCirculation.getStarttime();
     				Date startdate = sdf.parse(startDate);
     				Date enddate = sdf.parse(endDate);
     				if(collectDate.after(enddate) || collectDate.before(startdate)){
     					it.remove();
     				}
     			}
     		}else
     		//查询开始时间不为空
     		if(!org.springframework.util.StringUtils.isEmpty(startDate)){
     			Iterator<AlCirculation> it = alCirculations.iterator();
     			while(it.hasNext()){
     				AlCirculation alCirculation = (AlCirculation) it.next();
     				Date collectDate = alCirculation.getStarttime();
     				Date startdate = sdf.parse(startDate);
     				if(collectDate.before(startdate)){
     					it.remove();
     				}
     			}
     		}else
     		//查询结束时间不为空
     		if(!org.springframework.util.StringUtils.isEmpty(endDate)){
     			Iterator<AlCirculation> it = alCirculations.iterator();
     			while(it.hasNext()){
     				AlCirculation alCirculation = (AlCirculation) it.next();
     				Date collectDate = alCirculation.getStarttime();
     				Date enddate = sdf.parse(endDate);
     				if(collectDate.after(enddate)){
     					it.remove();
     				}
     			}
     		}
             if(!org.springframework.util.StringUtils.isEmpty(winelabeltype)){
             	for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
     				AlCirculation alCirculation = (AlCirculation) iterator.next();
     				String serial = alCirculation.getTemp1();
     				AlAlcohollable alcohollable = new AlAlcohollable();
     				alcohollable.setSerial(serial);
     				List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
     				if(alcohollables.size()>0){
     					if(!winelabeltype.equals(alcohollables.get(0).getType().toString())){
     						iterator.remove();
     					}
     				}
     			}
             }
            for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
				AlCirculation alCirculation = (AlCirculation) iterator.next();
				 if("false".equals(taxConfirm)){
					 String serial = alCirculation.getTemp1();
					 AlAlcohollable label = new AlAlcohollable();
					 label.setSerial(serial);
					 List<AlAlcohollable> alcohollables = alcohollabelService.find(label);
   					 String owner = alcohollables.get(0).getOwner();
   					 if(!owner.equals(account.getId())){
   						 continue;
   					 }
	             }
            	 String saleLinkId = alCirculation.getId();
      			 if(!org.springframework.util.StringUtils.isEmpty(saleLinkId)){
      				AlAlcoholflow alcoholflow = new AlAlcoholflow();
      				alcoholflow.setSalelinkid(saleLinkId);
      				AlCirculation alCirculationShow = new AlCirculation();
      					String belowEntId1 = alCirculation.getBelowentid();
      					//EntEntbasic entBasic = entbasicService.get(belowEntId1);
      					Account belowEnt = accountService.get(belowEntId1);
      					if(null!=belowEnt){
      						alCirculationShow.setBelowentid(belowEnt.getRealName());
      					}
      					alCirculationShow.setEndtime(alCirculation.getEndtime());
      					alCirculationShow.setStarttime(alCirculation.getStarttime());
      					alCirculationShow.setProductnum(alCirculation.getProductnum());
      					//酒标编号
      					alCirculationShow.setTemp1(alCirculation.getTemp1());
      					AlAlcohollable alcohollable = new AlAlcohollable();
      					alcohollable.setSerial(alCirculation.getTemp1());
      					alcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
      					List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
      					if(alcohollables.size()==0 && "true".equals(taxConfirm)){
      						continue;
      					}
      					if(alcohollables.size()>0){
      						alcohollable = alcohollables.get(0);
      						//酒标类型
      						alCirculationShow.setTemp2(alcohollable.getType().getValue());
      						//酒标类型
      						if(alcohollable.getType().getValue().equals("箱标") && "false".equals(taxConfirm)){
      							continue;
      						}
      						if(alcohollable.getType().getValue().equals("瓶标") && "true".equals(taxConfirm)){
      							if(!org.springframework.util.StringUtils.isEmpty(alcohollable.getBoxlable())){
      								continue;
      							}
      						}
      						WineLablesStatus status = alcohollable.getStatus();
      						if(status!=null){
      							//酒标状态
      							alCirculationShow.setProductnum(status.getValue());
      						}	
      						/**应税确认列表中的酒标当前持有人为销售上游企业**/
      						String topEntId = alCirculation.getTopentid();
      						String owner = alcohollable.getOwner();
      						if(((!principal.equals(belowEntId1))||(principal.equals(owner))||(!topEntId.equals(owner))) && "true".equals(taxConfirm)){
      							continue;
      						}else if("false".equals(taxConfirm) && (!principal.equals(owner))){
      							continue;
      						}
      						AlProduct alproduct = new AlProduct();
      						alproduct.setId(alcohollable.getProductid());
      						List<AlProduct> alproducts = alProductService.find(alproduct);
      						if(alproducts.size()>0){
      							alproduct = alproducts.get(0);
      							//商品名称
      							alCirculationShow.setTemp3(alproduct.getProductname());
      							
      							alCirculationsShow.add(alCirculationShow);
      							//List<AlCirculation> list1= new ArrayList<AlCirculation>();
      						  
      						}
      						//商品类型
  							alCirculationShow.setTemp4(alcohollable.getAltype().getValue());
  							
      					}
      				}
      			}
     		
        }
        Set<String> set=new HashSet<String>();
	       for (AlCirculation user : alCirculationsShow) {
	            if (user == null) {
	                continue;
	            }
	            String  userName = user.getTemp1();
	            if (userName != null) {
	                if (!set.contains(userName)) { //set中不包含重复的
	                	set.add(userName);
	                	list1.add(user);
	                } else {
	                    continue;
	                }
	            }   
	}


	 set.clear();
        return list1;
	}      
	/**
	 * 销售环节的列表展示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/saleLinkList", method ={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	/**winelabelCode : $("#winelabelCode").val(),
			productname : $("#productname").val(),
			winelabeltype : $("#winelabeltype").val(),
			producttype : $("#producttype").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val()**/
	public List<AlAlcohollable> saleLinkList(HttpServletRequest request,HttpSession session) throws ParseException, UnsupportedEncodingException {
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		AlCirculation param = new AlCirculation();
        String belowEntId = request.getParameter("belowent");
        String winelabelCode = request.getParameter("winelabelCode");
        String productname = new String(request.getParameter("productname").getBytes("iso-8859-1"),"utf-8");
        String winelabeltype = new String(request.getParameter("winelabeltype").getBytes("iso-8859-1"),"utf-8");
        String producttype = new String(request.getParameter("producttype").getBytes("iso-8859-1"),"utf-8");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String equipmentId = request.getParameter("equipmentId");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<AlAlcohollable> alCirculationShow = new ArrayList<AlAlcohollable>();
        param.setTopentid(account.getId());
        if(!org.springframework.util.StringUtils.isEmpty(belowEntId)){
        	param.setBelowentid(belowEntId);
        }
        if(!org.springframework.util.StringUtils.isEmpty(winelabelCode)){
        	param.setTemp1(winelabelCode);
        }
        
        	
        
        List<AlCirculation> alCirculations = service.find(param);
        
        
        if(!org.springframework.util.StringUtils.isEmpty(productname)){
        	for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
				AlCirculation alCirculation = (AlCirculation) iterator.next();
				String serial = alCirculation.getTemp1();
				AlAlcohollable alcohollable = new AlAlcohollable();
				alcohollable.setSerial(serial);
				List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
				if(alcohollables.size()>0){
					String alproductId = alcohollables.get(0).getProductid();
					AlProduct alproduct = alProductService.get(alproductId);
					if(!productname.equals(alproduct.getProductname())){
						iterator.remove();
					}
				}
			}
        }
        if(!org.springframework.util.StringUtils.isEmpty(producttype)){
        	for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
				AlCirculation alCirculation = (AlCirculation) iterator.next();
				String serial = alCirculation.getTemp1();
				AlAlcohollable alcohollable = new AlAlcohollable();
				alcohollable.setSerial(serial);
				List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
				if(alcohollables.size()>0){
					String alproductId = alcohollables.get(0).getProductid();
					AlProduct alproduct = alProductService.get(alproductId);
					if(!producttype.equals(alproduct.getProducttype().toString())){
						iterator.remove();
					}
				}
			}
        }
        if(!org.springframework.util.StringUtils.isEmpty(winelabeltype)){
        	for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
				AlCirculation alCirculation = (AlCirculation) iterator.next();
				String serial = alCirculation.getTemp1();
				AlAlcohollable alcohollable = new AlAlcohollable();
				alcohollable.setSerial(serial);
				List<AlAlcohollable> alcohollables = alcohollabelService.find(alcohollable);
				if(alcohollables.size()>0){
					if(!winelabeltype.equals(alcohollables.get(0).getType().toString())){
						iterator.remove();
					}
				}
			}
        }
       
        if((!org.springframework.util.StringUtils.isEmpty(startDate))
				&&(!org.springframework.util.StringUtils.isEmpty(endDate))){
			Iterator<AlCirculation> it = alCirculations.iterator();
			while(it.hasNext()){
				AlCirculation alCirculation = (AlCirculation) it.next();
				Date collectDate = alCirculation.getStarttime();
				Date startdate = sdf.parse(startDate);
				Date enddate = sdf.parse(endDate);
				if(collectDate.after(enddate) || collectDate.before(startdate)){
					it.remove();
				}
			}
		}else
		//查询开始时间不为空
		if(!org.springframework.util.StringUtils.isEmpty(startDate)){
			Iterator<AlCirculation> it = alCirculations.iterator();
			while(it.hasNext()){
				AlCirculation alCirculation = (AlCirculation) it.next();
				Date collectDate = alCirculation.getStarttime();
				Date startdate = sdf.parse(startDate);
				if(collectDate.before(startdate)){
					it.remove();
				}
			}
		}else
		//查询结束时间不为空
		if(!org.springframework.util.StringUtils.isEmpty(endDate)){
			Iterator<AlCirculation> it = alCirculations.iterator();
			while(it.hasNext()){
				AlCirculation alCirculation = (AlCirculation) it.next();
				Date collectDate = alCirculation.getStarttime();
				Date enddate = sdf.parse(endDate);
				if(collectDate.after(enddate)){
					it.remove();
				}
			}
		}
        for (Iterator iterator = alCirculations.iterator(); iterator.hasNext();) {
			AlCirculation alCirculation = (AlCirculation) iterator.next();
			
			/**查询销售采集的数量**/
			String saleLinkId = alCirculation.getId();
			AlAlcohollable alcohollable = new AlAlcohollable();
			String winelabel = alCirculation.getTemp1();
			alcohollable.setSerial(winelabel);
			List<AlAlcohollable> alcohollables = alcohollableService.find(alcohollable);
			for (Iterator iterator2 = alcohollables.iterator(); iterator2.hasNext();) {
				
					
				AlAlcohollable alAlcohollable = (AlAlcohollable) iterator2.next();
				if(alAlcohollable.getType().getValue().equals("瓶标")){
					if(!org.springframework.util.StringUtils.isEmpty(alAlcohollable.getBoxlable())){
						continue;
					}
			}
				AlAlcohollable showList = new AlAlcohollable();
				showList.setCreator(alCirculation.getId());
				showList.setSerial(alAlcohollable.getSerial());
				//酒标类型
				showList.setApplicanid(alAlcohollable.getType().getValue());
				//获取商品名称
				AlProduct alProduct = new AlProduct();
				 alProduct.setId(alAlcohollable.getProductid());
				 //alProduct.setBatch("");
				 List<AlProduct> alProducts = alProductService.find(alProduct);
				if(alProducts.size() > 0) {
					alProduct = alProducts.get(0);
					showList.setProductid(alProduct.getProductname());
					
				}
				showList.setApplicant(alAlcohollable.getAltype().getValue());
				showList.setBoxlable(alAlcohollable.getBoxlable());
				//设备编号，暂时写死
				showList.setTemp1("HR200HH7L0341");
				showList.setTemp4(alAlcohollable.getStatus().getValue());
				Account account1 = accountService.get(alCirculation.getBelowentid());
				showList.setTemp2(account1.getRealName());
				showList.setTemp3(alCirculation.getEndtime().toString());
				alCirculationShow.add(showList);
			}
		}
        if(!org.springframework.util.StringUtils.isEmpty(equipmentId)){
        	if(!"HR200HH7L0341".equals(equipmentId)){
        		alCirculationShow.clear();
        	}
        }
        
        return alCirculationShow;
	}
	/**
	 * 纳税申报
	 * @throws IOException 
	 */
	@RequestMapping(value = "/taxDeclare")
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public ModelAndView taxDeclare(HttpServletRequest request,
			HttpServletResponse response,HttpSession session
			
			) throws IOException{
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		//ModelAndView mad = new ModelAndView("/tax/alcirculation/taxConfirmView");
		//创建HSSFWorkbook对象(excel的文档对象)
        HSSFWorkbook wb = new HSSFWorkbook();
//建立新的sheet对象（excel的表单）
        HSSFSheet sheet=wb.createSheet("纳税申报一览表");
//在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        HSSFRow row1=sheet.createRow(0);
//创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
        HSSFCell cell=row1.createCell(0);
        //设置单元格内容
        cell.setCellValue("纳税申报一览表");
//合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
//在sheet里创建第二行
    	//在sheet里创建第二行
		HSSFRow row2=sheet.createRow(1);    
		      //创建单元格并设置单元格内容
		      row2.createCell(0).setCellValue("酒标编码");
		      row2.createCell(1).setCellValue("酒标类型");    
		      row2.createCell(2).setCellValue("对应商品");
		      row2.createCell(3).setCellValue("商品种类");    
		      //row2.createCell(4).setCellValue("销售采集时间");
		if(account!=null){
			String accountId = account.getId();
			Set<String> boxSerials = new HashSet<String>();
			String idsStr = new String(request.getParameter("ids").getBytes("iso-8859-1"),"utf-8");
			String[] ids = idsStr.split("\\*");
		//String[] ids= new String[1];
			for (int i = 0; i < ids.length; i++) {
				String[] infos = ids[i].split(",");
				String winelabelId = infos[0];
				AlAlcohollable winelabelParam = new AlAlcohollable();
				winelabelParam.setSerial(winelabelId);
				List<AlAlcohollable> winelabels =alcohollabelService.find(winelabelParam);
				AlAlcohollable winelabel = null;
				if(winelabels.size()>0){
					winelabel = winelabels.get(0);
				}
				if(null!=winelabel){
					
					
						
					winelabel.setStatus(WineLablesStatus.NEEDWRITTENOFF);
								alcohollabelService.update(winelabel);
								//**酒标流程表记录数据**//
								AlAlcoholflow alcoholflow = new AlAlcoholflow();
								alcoholflow.setCreator(accountId);
								alcoholflow.setFlowname("纳税申报");
								alcoholflow.setId(GenerateIdUtils.generateId32());
								alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
								alcoholflow.setSerial(winelabel.getSerial());
								alcoholflowService.save(alcoholflow);
								/**导出Excel**/
								 HSSFRow row3=sheet.createRow(i+2);
							      row3.createCell(0).setCellValue(winelabel.getSerial());
							      row3.createCell(1).setCellValue(winelabel.getType().getValue());
							      AlProduct product = alProductService.get(winelabel.getProductid());
							      row3.createCell(2).setCellValue(product.getProductname());    
							      row3.createCell(3).setCellValue(winelabel.getAltype().getValue());    
							     //alAlcohollable row3.createCell(4).setCellValue(); 
							
						}
					
					
						
					
					alcohollabelService.update(winelabel);
					boxSerials.add(winelabel.getBoxlable());
				}
			for (Iterator iterator = boxSerials.iterator(); iterator.hasNext();) {
				String winelabelBoxId = (String) iterator.next();
				AlAlcohollable winelabelParam1 = new AlAlcohollable();
				winelabelParam1.setSerial(winelabelBoxId);
				List<AlAlcohollable> winelabels = alcohollabelService.find(winelabelParam1);
				AlAlcohollable winelabelsBox = null;
				if (winelabels.size() > 0) {
					winelabelsBox = winelabels.get(0);
				}
				winelabelsBox.setStatus(WineLablesStatus.NEEDWRITTENOFF);
				//**酒标流程表记录数据**//
				AlAlcoholflow alcoholflow = new AlAlcoholflow();
				alcoholflow.setCreator(accountId);
				alcoholflow.setFlowname("纳税申报");
				alcoholflow.setId(GenerateIdUtils.generateId32());
				alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
				alcoholflow.setSerial(winelabelBoxId);
				alcoholflowService.save(alcoholflow);
				alcohollabelService.update(winelabelsBox);
			}
			}	
			
			
		//输出Excel文件
        OutputStream output=response.getOutputStream();
        response.reset();
        response.setHeader("Content-disposition", "attachment;filename=\"" + new String("纳税申报表.xls".getBytes("UTF-8"), "ISO-8859-1") + "\"");
        response.setContentType("application/msexcel");
        wb.write(output);
        output.close();
        ModelAndView mad = new ModelAndView("/tax/alcirculation/taxDeclareView");
		return mad ;
	}
	
	/**
	 * 应税确认
	 */
	@RequestMapping(value = "/taxConfirm", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_QUERY"})
	public ModelAndView taxConfirm(HttpServletRequest request,HttpSession session){
		Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
		ModelAndView mad = new ModelAndView("/tax/alcirculation/taxConfirmView");
		if(account!=null){
			String accountId = account.getId();
			String winelabelId = request.getParameter("winelabelId");
			String type = request.getParameter("type");
			AlAlcohollable winelabelParam = new AlAlcohollable();
			winelabelParam.setSerial(winelabelId);
			List<AlAlcohollable> winelabels =alcohollabelService.find(winelabelParam);
			AlAlcohollable winelabel = null;
			if(winelabels.size()>0){
				winelabel = winelabels.get(0);
			}
			if(null!=winelabel){
				/**箱标**/
				if(winelabel.getType().getKey()==2){
					AlAlcohollable bottomAlcohollable = new AlAlcohollable();
					bottomAlcohollable.setBoxlable(winelabelId);
					List<AlAlcohollable> bottomAlcohollables = alcohollabelService.find(bottomAlcohollable);
					for (Iterator iterator = bottomAlcohollables.iterator(); iterator.hasNext();) {
						AlAlcohollable alAlcohollable = (AlAlcohollable)iterator.next();
						if("confirm".equals(type)){
							//酒标的状态设置为流转中
							alAlcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
							alAlcohollable.setOwner(accountId);
							alcohollabelService.update(alAlcohollable);
							/**酒标流程表记录数据**/
							AlAlcoholflow alcoholflow = new AlAlcoholflow();
							alcoholflow.setCreator(accountId);
							alcoholflow.setFlowname("应税确认");
							alcoholflow.setId(GenerateIdUtils.generateId32());
							alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
							alcoholflow.setSerial(alAlcohollable.getSerial());
							alcoholflowService.save(alcoholflow);
						}else if("cancel".equals(type)){
							//酒标的状态设置为未流转
							/**酒标流程表记录数据**/
							alAlcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
							alcohollabelService.update(alAlcohollable);
						}
						
					}
				}
				if("confirm".equals(type)){
					//酒标的状态设置为流转中
					winelabel.setStatus(WineLablesStatus.CIRCULATIONING);
					winelabel.setOwner(accountId);
					/**酒标流程表记录数据**/
					AlAlcoholflow alcoholflow = new AlAlcoholflow();
					alcoholflow.setCreator(accountId);
					alcoholflow.setFlowname("应税确认");
					alcoholflow.setId(GenerateIdUtils.generateId32());
					alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
					alcoholflow.setSerial(winelabelId);
					alcoholflowService.save(alcoholflow);
				}else if("cancel".equals(type)){
					//酒标的状态设置为未流转
					/**酒标流程表记录数据**/
					winelabel.setStatus(WineLablesStatus.CIRCULATIONING);
				}
				alcohollabelService.update(winelabel);
			}
		}
		
		return mad;
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
    	ModelAndView mad = new ModelAndView("/tax/alproduct/productionCollectionView");
		service.batchDelete(ids);
		return mad;
	}
	/**
	 * 销售采集结果
	 * @param ids 唯一ID列表
	 * @return R 返回类型
	 */
    @RequestMapping(value = "/sellCollectionResultView", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
	public ModelAndView sellCollectionResultView() {
    	ModelAndView mad = new ModelAndView("/views/tax/sellResult.jsp");
		return mad;
	}
    /**
	 * 开始销售采集，模拟条形码扫描
	 * @param ids 唯一ID列表
	 * @return R 返回类型
     * @throws IOException 
	 */
    @RequestMapping(value = "/saleCollection", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
	public List<AlAlcohollable> saleCollection(HttpServletRequest request,HttpSession session){
    	Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
    	List<AlAlcohollable> sellResult = new ArrayList<AlAlcohollable>();
    	if(account!=null){
    		String accountId = account.getId();
        	String winelabels = request.getParameter("winelabels");
        	String belowEntId = request.getParameter("belowEntId");
        	Account accountParam = new Account();
        	accountParam.setPrincipal(belowEntId);
        	List<Account> accounts = accountService.find(accountParam);
        	if(accounts.size()>0){
        		belowEntId = accounts.get(0).getId();
        	}else{
        		belowEntId = "";
        	}
        	/**防止重复采集**/
        	AlCirculation alcirculation1 = new AlCirculation();
        	alcirculation1.setTopentid(accountId);
        	alcirculation1.setBelowentid(belowEntId);
        	alcirculation1.setTemp1(winelabels);
        	if(alCirculationService.find(alcirculation1).size()>0){
        		return sellResult;
        	}
			
			
        	AlAlcohollable alcoholabelParam = new AlAlcohollable();
        	alcoholabelParam.setSerial(winelabels);
        	
        	List<AlAlcohollable> alcoholabels = alcohollableService.find(alcoholabelParam);
        	if(alcoholabels.size()>0){
        		AlAlcohollable alcoholabel = alcoholabels.get(0);
        		WineLablesStatus status = alcoholabel.getStatus();
            	if((status.getKey()==1) || (status.getKey()==2)){
            		/**1.获得酒标，检查酒标状态；若未使用、待核销、已核销则报错，若未流转则更新为流转中**/
            		alcoholabel.setStatus(WineLablesStatus.CIRCULATIONING);
                	/**2.更新酒标信息表的销售单号、当前持有人、lastupdate**/
            		WineLablesType type = alcoholabel.getType();
            		//箱装
            		if(type.getKey()==2){
            			/**1.查询出所有关联箱标为当前酒标的酒标，并判断个数是否为规格，并判断各自的酒标状态是否合格且类型为瓶装**/
            			AlAlcohollable alcohollabel = new AlAlcohollable();
            			alcohollabel.setBoxlable(winelabels);
            			alcohollabel.setType(WineLablesType.BOTTLE);
            			List<AlAlcohollable> alcohollabelBottoms = alcohollableService.find(alcohollabel);
            			String productId = alcoholabel.getProductid();
            			if(!org.springframework.util.StringUtils.isEmpty(productId)){
            				AlProduct alproduct = alProductService.get(productId);
            				String specStr = alproduct.getSpec();
            				if(!org.springframework.util.StringUtils.isEmpty(specStr)){
            					int spec = Integer.parseInt(specStr);
            					if(alcohollabelBottoms.size()==spec){
            						
            						for (Iterator iterator = alcohollabelBottoms.iterator(); iterator.hasNext();) {
        								AlAlcohollable alAlcohollable = (AlAlcohollable) iterator.next();
        								/**1.产品流通环节表增加记录**/
        								String saleLinkId = GenerateIdUtils.generateId32();
                						AlCirculation alcirculation = new AlCirculation();
                						alcirculation.setId(saleLinkId);
                						alcirculation.setTopentid(accountId);
                						alcirculation.setBelowentid(belowEntId);
                						alcirculation.setStarttime(GenerateIdUtils.getCurrentSqlDate());
                						alcirculation.setEndtime(GenerateIdUtils.getCurrentSqlDate());
                						alcirculation.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
                						alcirculation.setCreator(accountId);
                						String winelabelsId = alAlcohollable.getSerial();
                						alcirculation.setTemp1(winelabelsId);
                						alCirculationService.save(alcirculation);
        								/**2.获得酒标，检查酒标状态；若未使用、待核销、已核销则报错，若未流转则更新为流转中**/
        								WineLablesStatus statusBottom = alAlcohollable.getStatus();
        								if((statusBottom.getKey()==1) || (statusBottom.getKey()==2)){
        									alAlcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
        									
        						    		/**3.酒标流程表增加记录**/
        									AlAlcoholflow alcoholflow = new AlAlcoholflow();
        									alcoholflow.setCreator(accountId);
        									alcoholflow.setFlowname("销售采集");
        									alcoholflow.setId(GenerateIdUtils.generateId32());
        									alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        									alcoholflow.setSaledate(GenerateIdUtils.getCurrentSqlDate());
        									alcoholflow.setSalelinkid(saleLinkId);
        									alcoholflow.setSerial(winelabelsId);
        									alcoholflowService.save(alcoholflow);
        									/**4.更新酒标信息表的销售单号、lastupdate;当前持有人在应税确认之后更新**/
        									alAlcohollable.setSales(saleLinkId);
        									alAlcohollable.setOwner(accountId);
        									alAlcohollable.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        									alcohollabelService.update(alAlcohollable);
        								}else{
        									logger.info("箱装存在瓶装酒标状态未流转！");
        						    		return sellResult;
        								}
        	    						
        							}
            					}else{
            						logger.info("请核对箱装规格与所对应酒标的数量是否一致！");
            			    		return sellResult;
            					}
            				}
            			}
            			String winelabelId = alcoholabel.getSerial();
            			String saleLinkId = GenerateIdUtils.generateId32();
            			AlCirculation alcirculation = new AlCirculation();
						alcirculation.setId(saleLinkId);
						alcirculation.setTopentid(accountId);
						alcirculation.setBelowentid(belowEntId);
						alcirculation.setStarttime(GenerateIdUtils.getCurrentSqlDate());
						alcirculation.setEndtime(GenerateIdUtils.getCurrentSqlDate());
						alcirculation.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
						alcirculation.setCreator(accountId);
						alcirculation.setTemp1(winelabelId);
						alCirculationService.save(alcirculation);
        	    		/**3.酒标流程表增加记录**/
            		
        				AlAlcoholflow alcoholflow = new AlAlcoholflow();
        				alcoholflow.setCreator(accountId);
        				alcoholflow.setFlowname("销售采集");
        				alcoholflow.setId(GenerateIdUtils.generateId32());
        				alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        				alcoholflow.setSaledate(GenerateIdUtils.getCurrentSqlDate());
        				alcoholflow.setSalelinkid(saleLinkId);
        				alcoholflow.setSerial(winelabelId);
        				alcoholflowService.save(alcoholflow);
        				/**4.更新酒标信息表的销售单号、当前持有人、lastupdate**/
        				alcoholabel.setSales(saleLinkId);
        				alcoholabel.setOwner(accountId);
        				alcoholabel.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        				alcohollabelService.update(alcoholabel);
            			//瓶装
            		}else if(type.getKey()==1){
            			String saleLinkId = GenerateIdUtils.generateId32();
            			/**1.产品流通环节表增加记录**/
    					AlCirculation alcirculation = new AlCirculation();
    					alcirculation.setId(saleLinkId);
    					alcirculation.setTopentid(accountId);
    					alcirculation.setBelowentid(belowEntId);
    					alcirculation.setStarttime(GenerateIdUtils.getCurrentSqlDate());
    					alcirculation.setEndtime(GenerateIdUtils.getCurrentSqlDate());
    					alcirculation.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
    					alcirculation.setCreator(accountId);
    					String winelabelId = alcoholabel.getSerial();
    					alcirculation.setTemp1(winelabelId);
    					alCirculationService.save(alcirculation);
    					
        	    		/**3.酒标流程表增加记录**/
        				AlAlcoholflow alcoholflow = new AlAlcoholflow();
        				alcoholflow.setCreator(accountId);
        				alcoholflow.setFlowname("销售采集");
        				alcoholflow.setId(GenerateIdUtils.generateId32());
        				alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        				alcoholflow.setSaledate(GenerateIdUtils.getCurrentSqlDate());
        				alcoholflow.setSalelinkid(saleLinkId);
        				alcoholflow.setSerial(winelabelId);
        				alcoholflowService.save(alcoholflow);
        				/**4.更新酒标信息表的销售单号、当前持有人、lastupdate**/
        				alcoholabel.setSales(saleLinkId);
        				alcoholabel.setOwner(accountId);
        				alcoholabel.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
        				alcohollabelService.update(alcoholabel);
            		}
            		
    			}else{
    				logger.info("酒标状态未流转！");
    	    		return sellResult;
    			}
            	sellResult.add(alcoholabel);
            	}
        		
        	}
        	
		return sellResult;
	}

/**
	 * 销售采集的删除
	 * @param ids 唯一ID列表
	 * @return R 返回类型
    * @throws IOException 
	 */
   @RequestMapping(value = "/delSaleCollection", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_PRODUCT_DELETE"})
	public ModelAndView delSaleCollection(HttpServletRequest request,HttpSession session){
	   ModelAndView mad = new ModelAndView("/tax/alcirculation/sellCollectionResultView");
	   Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
   	if(account!=null){
   		String accountId = account.getId();
       
   		String alcirculationId = request.getParameter("alcirculationId");	
		AlCirculation alcirculation = alCirculationService.get(alcirculationId);
		
		if(alcirculation!=null){
       		String winelabels = alcirculation.getTemp1();
       		AlAlcohollable alcoholabelParam = new AlAlcohollable();
           	alcoholabelParam.setSerial(winelabels);
           	List<AlAlcohollable> alcoholabels = alcohollableService.find(alcoholabelParam);
           	if(alcoholabels.size()>0){
           		AlAlcohollable alcoholabel = alcoholabels.get(0);
           		WineLablesStatus status = alcoholabel.getStatus();
               	if(status.getKey()==2){
               		/**1.判断删除后酒标的状态应该是流转中还是未流转。当前企业为生产企业则状态为未流转**/
               		String entId = account.getPrincipal();
               		EntEntbasic entBasic = entbasicService.get(entId);
               		EntType entType = entBasic.getEnttype();
               		if(entType.getKey()==1){
               			alcoholabel.setStatus(WineLablesStatus.UNCIRCULATION);
               		}else if(entType.getKey()==1){
               			alcoholabel.setStatus(WineLablesStatus.CIRCULATIONING);
               		}
                   	/**2.更新酒标信息表的销售单号、当前持有人、lastupdate**/
               		WineLablesType type = alcoholabel.getType();
               		//箱装
               		if(type.getKey()==2){
               			/**1.查询出所有关联箱标为当前酒标的酒标，并判断个数是否为规格，并判断各自的酒标状态是否合格且类型为瓶装**/
               			AlAlcohollable alcohollabel = new AlAlcohollable();
               			alcohollabel.setBoxlable(winelabels);
               			alcohollabel.setType(WineLablesType.BOTTLE);
               			List<AlAlcohollable> alcohollabelBottoms = alcohollableService.find(alcohollabel);
               			String productId = alcoholabel.getProductid();
               			if(!org.springframework.util.StringUtils.isEmpty(productId)){
               				AlProduct alproduct = alProductService.get(productId);
               				String specStr = alproduct.getSpec();
               				if(!org.springframework.util.StringUtils.isEmpty(specStr)){
               					int spec = Integer.parseInt(specStr);
               					if(alcohollabelBottoms.size()==spec){
               						
               						for (Iterator iterator = alcohollabelBottoms.iterator(); iterator.hasNext();) {
           								AlAlcohollable alAlcohollable = (AlAlcohollable) iterator.next();
           								/**1.产品流通环节表删除记录**/
           								String saleLinkId = alAlcohollable.getSales();
           								if(!org.springframework.util.StringUtils.isEmpty(saleLinkId)){
           									alCirculationService.deleteById(saleLinkId);
           									/**3.酒标流程表删除记录**/
           									AlAlcoholflow alcoholflow = new AlAlcoholflow();
           									alcoholflow.setSalelinkid(saleLinkId);
           									alcoholflow.setSerial(alAlcohollable.getSerial());
           									List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
           									if(alcoholflows.size()>0){
           										String flowId = alcoholflows.get(0).getId();
           										alcoholflowService.deleteById(flowId);
           									}
           								}
           								/**2.判断删除后酒标的状态应该是流转中还是未流转。当前企业为生产企业则状态为未流转**/
           								WineLablesStatus statusBottom = alAlcohollable.getStatus();
           								if(statusBottom.getKey()==2){
           				               		if(entType.getKey()==1){
           				               			alAlcohollable.setStatus(WineLablesStatus.UNCIRCULATION);
           				               		}else if(entType.getKey()==1){
           				               			alAlcohollable.setStatus(WineLablesStatus.CIRCULATIONING);
           				               		}
           									/**4.更新酒标信息表的销售单号、lastupdate;当前持有人在应税确认之后更新**/
           				               		/**4.查询当前登录人的为下游企业的销售记录，更新上次销售记录id**/
           				               		AlCirculation alcirculation2 = new AlCirculation();
           				               		alcirculation2.setBelowentid(accountId);
           				               		alcirculation2.setTemp1(alAlcohollable.getSerial());
           				               		List<AlCirculation> alcirculations = alCirculationService.find(alcirculation2);
           									if(alcirculations.size()>0){
           										String alcirculationId2 = alcirculations.get(0).getId();
           										alAlcohollable.setSales(alcirculationId2);
           									}else{
           										alAlcohollable.setSales("");
           									}
           									
           									alAlcohollable.setOwner(accountId);
           									alAlcohollable.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
           									alcohollabelService.update(alAlcohollable);
           								}else{
           									logger.info("箱装存在瓶装酒标状态未流转！");
           						    		return mad;
           								}
           	    						
           							}
               					}else{
               						logger.info("请核对箱装规格与所对应酒标的数量是否一致！");
               			    		return mad;
               					}
               				}
               			}
               			String winelabelId = alcoholabel.getSerial();
               			String saleLinkId = alcoholabel.getSales();
               			if(!org.springframework.util.StringUtils.isEmpty(saleLinkId)){
								alCirculationService.deleteById(saleLinkId);
								/**3.酒标流程表删除记录**/
								AlAlcoholflow alcoholflow = new AlAlcoholflow();
								alcoholflow.setSalelinkid(saleLinkId);
								alcoholflow.setSerial(winelabels);
								List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
								if(alcoholflows.size()>0){
									String flowId = alcoholflows.get(0).getId();
									alcoholflowService.deleteById(flowId);
								}
							}
           				/**4.更新酒标信息表的销售单号、当前持有人、lastupdate**/
               			/**4.查询当前登录人的为下游企业的销售记录，更新上次销售记录id**/
		               		AlCirculation alcirculation2 = new AlCirculation();
		               		alcirculation2.setBelowentid(accountId);
		               		alcirculation2.setTemp1(winelabelId);
		               		List<AlCirculation> alcirculations = alCirculationService.find(alcirculation2);
							if(alcirculations.size()>0){
								String alcirculationId2 = alcirculations.get(0).getId();
								alcoholabel.setSales(alcirculationId2);
							}
           				alcoholabel.setOwner(accountId);
           				alcoholabel.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
           				alcohollabelService.update(alcoholabel);
               			//瓶装
               		}else if(type.getKey()==1){
               			
               			/**1.产品流通环节表删除记录**/
       					
       					alCirculationService.deleteById(alcirculationId);
       					
           	    		/**3.酒标流程表删除记录**/
           				AlAlcoholflow alcoholflow = new AlAlcoholflow();
           				String winelabelId = alcoholabel.getSerial();
           				alcoholflow.setSalelinkid(alcirculationId);
           				alcoholflow.setSerial(winelabelId);
           				List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflow);
						if(alcoholflows.size()>0){
							String flowId = alcoholflows.get(0).getId();
							alcoholflowService.deleteById(flowId);
						}
           				/**4.更新酒标信息表的销售单号、当前持有人、lastupdate**/
						AlCirculation alcirculation2 = new AlCirculation();
	               		alcirculation2.setBelowentid(accountId);
	               		alcirculation2.setTemp1(winelabelId);
	               		List<AlCirculation> alcirculations = alCirculationService.find(alcirculation2);
						if(alcirculations.size()>0){
							String alcirculationId2 = alcirculations.get(0).getId();
							alcoholabel.setSales(alcirculationId2);
						}else{
							alcoholabel.setSales("");
						}
           				alcoholabel.setOwner(accountId);
           				alcoholabel.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
           				alcohollabelService.update(alcoholabel);
               		}
               		
       			}else{
       				logger.info("酒标状态未流转！");
       	    		return mad;
       			}
               
               	}
       		}
       	}
       	
		return mad;
	}
}
