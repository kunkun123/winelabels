package org.gecko.framework.wineLabels.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.impl.bpmn.data.SimpleDataInputAssociation;
import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.ent.entity.EntApplication;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.framework.ent.service.EntApplicationService;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.wineLabels.entity.AlAlcohollable;
import org.gecko.framework.wineLabels.entity.AlProduct;
import org.gecko.framework.wineLabels.entity.enums.WineLablesStatus;
import org.gecko.framework.wineLabels.entity.enums.WineLablesType;
import org.gecko.framework.wineLabels.service.AlAlcohollableService;
import org.gecko.framework.wineLabels.service.AlProductService;
import org.gecko.generator.config.GeckoGenConfigure.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 酒标信息表控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:26:10
 *
 */
@Controller
@RequestMapping("/wineLabels/alalcohollable")
public class AlAlcohollableController extends BaseController<AlAlcohollable> {

	@Autowired
	public AlAlcohollableService service;
	@Autowired
	public AlProductService alProductService;
	@Autowired
	public EntApplicationService entApplicationService;
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
 * 酒标管理查询列表
 * @throws ParseException 
 * @throws UnsupportedEncodingException 
 */
@RequestMapping(value = "/managerList", method = {RequestMethod.POST,RequestMethod.GET})
@ResponseBody
	public List<AlAlcohollable> labelManagerList(Page<AlAlcohollable> page ,HttpServletRequest request,HttpSession session) throws ParseException, UnsupportedEncodingException{
	page.setLimit(1000);
	//页面table显示
	List<AlAlcohollable> managerList = new ArrayList<AlAlcohollable>();
	Account account = (Account) session.getAttribute(GeckoProperties.SESSION_KEY);
	AlAlcohollable param = new AlAlcohollable();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String productidSearch = new String(request.getParameter("productidSearch").getBytes("iso-8859-1"),"utf-8");
	String serialSearch = request.getParameter("serialSearch");
	String statusSearch = request.getParameter("statusSearch");
	
	String DateSearch1 = request.getParameter("dateSearch1");
	String DateSearch2 = request.getParameter("dateSearch2");
	//查询条件
	if(!org.springframework.util.StringUtils.isEmpty(serialSearch)){
		param.setSerial(serialSearch);
	}
	if(!org.springframework.util.StringUtils.isEmpty(productidSearch)){
		AlProduct alproduct = new AlProduct();
		alproduct.setProductname(productidSearch);
		List<AlProduct> alproducts = alProductService.find(alproduct);
		if(alproducts.size()>0){
			param.setProductid(alproducts.get(0).getId());
		}else{
			param.setProductid("1`");
		}
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
	if(account!=null){
		param.setApplicant(account.getId());
		List<AlAlcohollable> alAlcohollables = service.find(param);
		if((!org.springframework.util.StringUtils.isEmpty(DateSearch1))
				&&(!org.springframework.util.StringUtils.isEmpty(DateSearch2))){
			Iterator<AlAlcohollable> it = alAlcohollables.iterator();
			while(it.hasNext()){
				AlAlcohollable alAlcohollable = (AlAlcohollable) it.next();
				String applicationId = alAlcohollable.getApplicanid();
				EntApplication entApplication = entApplicationService.get(applicationId);
				Date auditDate = entApplication.getAuditdate();
				Date startDate = sdf.parse(DateSearch1);
				Date endDate = sdf.parse(DateSearch2);
				if(auditDate.after(endDate) || auditDate.before(startDate)){
					it.remove();
				}
			}
		}else
		//查询开始时间不为空
		if(!org.springframework.util.StringUtils.isEmpty(DateSearch1)){
			Iterator<AlAlcohollable> it = alAlcohollables.iterator();
			while(it.hasNext()){
				AlAlcohollable alAlcohollable = (AlAlcohollable) it.next();
				String applicationId = alAlcohollable.getApplicanid();
				EntApplication entApplication = entApplicationService.get(applicationId);
				Date auditDate = entApplication.getAuditdate();
				Date startDate = sdf.parse(DateSearch1);
				if(auditDate.before(startDate)){
					it.remove();
				}
			}
		}else
		//查询结束时间不为空
		if(!org.springframework.util.StringUtils.isEmpty(DateSearch2)){
			Iterator<AlAlcohollable> it = alAlcohollables.iterator();
			while(it.hasNext()){
				AlAlcohollable alAlcohollable = (AlAlcohollable) it.next();
				String applicationId = alAlcohollable.getApplicanid();
				EntApplication entApplication = entApplicationService.get(applicationId);
				Date auditDate = entApplication.getAuditdate();
				Date endDate = sdf.parse(DateSearch2);
				if(auditDate.after(endDate)){
					it.remove();
				}
			}
		}
		for(Iterator iterator = alAlcohollables.iterator();iterator.hasNext();){
			AlAlcohollable alAlcohollable = (AlAlcohollable) iterator.next();
			AlAlcohollable showList = new AlAlcohollable();
				showList.setSerial(alAlcohollable.getSerial());
				showList.setStatus(alAlcohollable.getStatus());
				showList.setBoxlable(alAlcohollable.getBoxlable());
				//状态
				showList.setTemp1(alAlcohollable.getStatus().getValue());
				//酒标类型
				ProductType winelabelsType = alAlcohollable.getAltype();
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
			//状态
			WineLablesStatus winelabelsStatus = alAlcohollable.getStatus();
			if(winelabelsStatus.getKey()==4){
				showList.setTemp1("未使用");
			}
			/**未使用**/
			if(winelabelsStatus.getKey()==4){
				showList.setTemp3("无");
				showList.setProductid("未使用，暂无对应商品信息");
			}
			//获得审核时间
			EntApplication application = new EntApplication();
			application.setId(alAlcohollable.getApplicanid());
			List<EntApplication> applications = entApplicationService.find(application);
			if(applications.size()>0){
				application = applications.get(0);
				showList.setTemp4(application.getAuditdate().toString());
			}
			managerList.add(showList);
		}
	}
	return managerList;
}
	/**
	 *
	 * @param @param id 唯一ID
	 * @param id 唯一ID
	 * @return R  返回类型
	 */
	@RequestMapping(value = "/get/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_VIEW"})
	public R get(@PathVariable String id) {
		AlAlcohollable alalcohollable = service.get(id);
		return R.ok().put(alalcohollable);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_EDIT"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_DELETE"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_NEW", "GECKO_WINELABELS_AL_ALCOHOLLABLE_EDIT"})
	public R save(@RequestBody AlAlcohollable entity) {
        R r = new R();
		if(null != entity.getId() && StringUtils.isNoneBlank(String.valueOf(entity.getId()))) {
			service.update(entity);
            r = R.ok();
		} else {
            if (org.springframework.util.StringUtils.isEmpty(entity.getId())) {
                entity.setId(UuidUtil.get32UUID());
                ReflectUtil.fillsProperty(entity);
            }
			r.put(service.save(entity));
		}
		return r;
	}
	/**
     *	酒标信息详情
     */
	@RequestMapping(value = "/wineLabelsDetail", method = {RequestMethod.POST,RequestMethod.GET,RequestMethod.PUT})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_NEW", "GECKO_WINELABELS_AL_ALCOHOLLABLE_EDIT"})
	public List<AlAlcohollable> wineLabelsDetail(HttpServletRequest request) {
	   String winelabelId = request.getParameter("winelabelId");
	   AlAlcohollable alcohollable = new AlAlcohollable();
	   alcohollable.setSerial(winelabelId);
	   List<AlAlcohollable> alcohollables = service.find(alcohollable);
	   List<AlAlcohollable> alcohollablesShow = new ArrayList<AlAlcohollable>();
	   if(alcohollables.size()>0){
		   alcohollable = alcohollables.get(0);
		   /**瓶装**/
		   if(null!=alcohollable.getType() && alcohollable.getType().getKey()==1){
			   String boxLabel = alcohollable.getBoxlable();
			   AlAlcohollable alcohollableBox = new AlAlcohollable();
			   alcohollableBox.setSerial(boxLabel);
			   List<AlAlcohollable> alcohollableBoxs = service.find(alcohollableBox);
			   if(alcohollableBoxs.size()>0){
				   WineLablesStatus status = alcohollableBoxs.get(0).getStatus();
				   if(status!=null){
					   alcohollable.setTemp2(status.getValue());
				   }
				   alcohollable.setSerial(alcohollableBoxs.get(0).getSerial());
				   alcohollablesShow.add(alcohollable);
			   }
		   }else if(null!=alcohollable.getType() && alcohollable.getType().getKey()==2){
			   AlAlcohollable alcohollableBottom = new AlAlcohollable();
			   alcohollableBottom.setBoxlable(winelabelId);
			   List<AlAlcohollable> alcohollableBottoms = service.find(alcohollableBottom);
			   for (AlAlcohollable alAlcohollable : alcohollableBottoms) {
				   WineLablesStatus status = alcohollable.getStatus();
				   if(status!=null){
					   alAlcohollable.setTemp2(status.getValue());
				   }
				   alcohollablesShow.add(alAlcohollable);
			   }
		   }
	   }
       return alcohollablesShow;
	}

	/**
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLLABLE_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
}
