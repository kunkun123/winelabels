package org.gecko.framework.message;

import java.util.Iterator;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.log4j.spi.LoggerFactory;
import org.gecko.framework.utils.GenerateIdUtils;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;
import org.gecko.framework.wineLabels.entity.AlAlcohollable;
import org.gecko.framework.wineLabels.entity.AlProduct;
import org.gecko.framework.wineLabels.entity.enums.WineLablesStatus;
import org.gecko.framework.wineLabels.entity.enums.WineLablesType;
import org.gecko.framework.wineLabels.service.AlAlcoholflowService;
import org.gecko.framework.wineLabels.service.AlAlcohollableService;
import org.gecko.framework.wineLabels.service.AlProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 监听酒标扫描后的信息
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2018年1月14日
 */
//@Service
public class WinelabelsQueueListener implements MessageListener{
	@Autowired
	AlProductService alProductService;
	@Autowired
	AlAlcohollableService alcohollableService;
	@Autowired
	AlAlcoholflowService alcoholflowService;
	@Override
	public void onMessage(Message message) {
		// 从消息中获取酒标信息
		TextMessage wineLabelsInfo = (TextMessage) message;
		String info;
		try {
			info = wineLabelsInfo.getText();
			String infos[] = info.split("\\.");
			if(infos.length==2){
				String productId = infos[0];
				String accountId = infos[1];
				//根据产品表的id获得产品
				AlProduct alproduct = alProductService.get(productId);
				collect(alproduct,accountId);
				/**设置生产编号，判断是否已经采集**/
				alproduct.setBatch(GenerateIdUtils.generateId32());
				alProductService.update(alproduct);
			}
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/** 1.建立酒标与商品的关系，并更改酒标的状态，酒标流程表添加记录  **/
	private void collect(AlProduct alproduct, String accountId){
		
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
		AlAlcoholflow alcoholflow = new AlAlcoholflow();
		alcoholflow.setFlowname(flowname);
		alcoholflow.setId(GenerateIdUtils.generateId32());
		alcoholflow.setSerial(serial);
		alcoholflow.setCreator(accountId);
		alcoholflow.setLastupdatetime(GenerateIdUtils.getCurrentSqlDate());
		alcoholflowService.save(alcoholflow);
	}
}
