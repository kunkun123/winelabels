package org.gecko.framework.wineLabels.aspect;

import java.util.List;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.gecko.framework.wineLabels.entity.AlAlcoholflow;
import org.gecko.framework.wineLabels.service.AlAlcoholflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
/**
 * 保存酒标流程的增强，给temp1字段赋值记录插入顺序，方便查询流程时排序
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2018年1月23日
 */
@Aspect  
@Component  
public class WinelabelsFlowAspect {
	@Autowired
	AlAlcoholflowService alcoholflowService;
	 @Pointcut("execution(* org.gecko.framework.wineLabels.repository.dao.AlAlcoholflowDao.save(..))") 
	 public void addOrder(){}  
	 @Before("addOrder()")  
	 public void beforeSleep(JoinPoint joinpoint){  
		 Object[] winelabelsFlows = joinpoint.getArgs();
		 for (int i = 0; i < winelabelsFlows.length; i++) {
			AlAlcoholflow alcoholflow = (AlAlcoholflow) winelabelsFlows[i];
			String winelabelId = alcoholflow.getSerial();
			if(!org.springframework.util.StringUtils.isEmpty(winelabelId)){
				AlAlcoholflow alcoholflowParam = new AlAlcoholflow();
				alcoholflowParam.setSerial(winelabelId);
				List<AlAlcoholflow> alcoholflows = alcoholflowService.find(alcoholflowParam);
				int size = alcoholflows.size();
				alcoholflow.setTemp1(size+"");
			}
		}
	 }  
}
