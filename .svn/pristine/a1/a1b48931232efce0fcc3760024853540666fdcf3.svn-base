package org.gecko.framework.wineLabels.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.gecko.common.utils.ReflectUtil;
import org.gecko.common.utils.UuidUtil;
import org.gecko.core.annotations.GeckoAuthority;
import org.gecko.core.mybatis.page.Page;
import org.gecko.framework.base.BaseController;
import org.gecko.framework.model.R;
import org.gecko.framework.system.entity.Account;
import org.gecko.framework.system.service.AccountService;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;
import org.gecko.framework.wineLabels.service.AlAlcoholflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * 酒标流程表控制器
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:40:01
 *
 */
@Controller
@RequestMapping("/wineLabels/alalcoholflow")
public class AlAlcoholflowController extends BaseController<AlAlcoholflow> {

	@Autowired
	public AlAlcoholflowService service;
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
	 * 数据列表
	 * @param page 分页设置
	 * @param search 查询参数
	 * @param order 排序
	 * @return R返回类型
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_QUERY"})
	public Page<AlAlcoholflow> list(Page<AlAlcoholflow> page) {
        AlAlcoholflow param = new AlAlcoholflow();
        if(page.getSearch()!=null){
        param.setTemp2("%" + page.getSearch() + "%");
//param.setSaledate("%" + page.getSearch() + "%");
param.setTemp3("%" + page.getSearch() + "%");
param.setTemp4("%" + page.getSearch() + "%");
param.setFlowname("%" + page.getSearch() + "%");
param.setTemp1("%" + page.getSearch() + "%");
//param.setLastupdatetime("%" + page.getSearch() + "%");
param.setCreator("%" + page.getSearch() + "%");
param.setSerial("%" + page.getSearch() + "%");
param.setSalelinkid("%" + page.getSearch() + "%");
        }
		page = service.likeByPage(param, page);
		return page;
	}

	/**
	 *
	 * @param @param id 唯一ID
	 * @param id 唯一ID
	 * @return R  返回类型
	 */
	@RequestMapping(value = "/get/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_VIEW"})
	public R get(@PathVariable String id) {
		AlAlcoholflow alalcoholflow = service.get(id);
		return R.ok().put(alalcoholflow);
	}

    @RequestMapping("/edit")
    @ResponseBody
    @GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_EDIT"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_DELETE"})
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
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_NEW", "GECKO_WINELABELS_AL_ALCOHOLFLOW_EDIT"})
	public R save(@RequestBody AlAlcoholflow entity) {
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
	 * export  导出数据
	 * @param ids 唯一ID列表
	 * @return R返回类型
	 */
	@RequestMapping(value = "/export/{ids}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_EXPORT"})
	public R export(@PathVariable String[] ids) {
		return R.ok();
	}
	/**
     * 获取酒标的流转记录
     * @param entity
     * @return R返回类型
     */
	@RequestMapping(value = "/winelabelsTransfer", method = RequestMethod.GET)
	@ResponseBody
	//@GeckoAuthority(codes = {"GECKO_WINELABELS_AL_ALCOHOLFLOW_NEW", "GECKO_WINELABELS_AL_ALCOHOLFLOW_EDIT"})
	public List<AlAlcoholflow> winelabelsTransfer(HttpServletRequest request) {
		String wineLabelId = request.getParameter("winelabels");
		List<AlAlcoholflow> alcoholflowShow = new ArrayList<AlAlcoholflow>();
		List<AlAlcoholflow> alcoholflows = service.findByWinelabels(wineLabelId);
		for (Iterator iterator = alcoholflows.iterator(); iterator.hasNext();) {
			AlAlcoholflow alAlcoholflow = (AlAlcoholflow) iterator.next();
			/**根据entId查找企业名称**/
			String accountId = alAlcoholflow.getCreator();
			String accountName = "";
			if(!org.springframework.util.StringUtils.isEmpty(accountId)){
				Account account = accountService.get(accountId);
				if(null!=account){
					accountName = account.getRealName();
					alAlcoholflow.setCreator(accountName);
				}
			}
			String flowName = alAlcoholflow.getFlowname();
			if(flowName.contains("申请")){
				alAlcoholflow.setFlowname("["+accountName+"]提出了酒标申领");
				alAlcoholflow.setTemp1("未使用");
			}else if(flowName.contains("审核")){
				alAlcoholflow.setFlowname("主管部门审核通过，审核人："+accountName);
				alAlcoholflow.setTemp1("未使用");
			}else if(flowName.contains("生产采集")){
				alAlcoholflow.setFlowname("["+accountName+"]生产采集");
				alAlcoholflow.setTemp1("未流转");
			}else if(flowName.contains("销售采集")){
				alAlcoholflow.setFlowname("["+accountName+"]销售采集");
				alAlcoholflow.setTemp1("流转中");
			}else if(flowName.contains("应税确认")){
				alAlcoholflow.setFlowname("["+accountName+"]应税确认");
				alAlcoholflow.setTemp1("流转中");
			}else if(flowName.contains("纳税申报")){
				alAlcoholflow.setFlowname("["+accountName+"]完成商品交易，纳税申报确认");
				alAlcoholflow.setTemp1("流转中");
			}else if(flowName.contains("核销")){
				alAlcoholflow.setFlowname("核销方式：手动核销，核销人："+accountName);
				alAlcoholflow.setTemp1("已核销");
			}
			alcoholflowShow.add(alAlcoholflow);
		}
		return alcoholflowShow;
	}
}
