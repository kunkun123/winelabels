/**
 * 
 */
package org.gecko.framework.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2018年1月8日
 */
public class GenerateIdUtils {
	public static String generateId32(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String id = sdf.format(new Date());
		id = id.concat((UUID.randomUUID().toString().trim().replaceAll("-", "").substring(0, 24)));
		return id;
	}

	public static String generateId10() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String id = sdf.format(new Date());
		Random rd = new Random();
		for (int i = 0; i < 4; i++) {
			id+=rd.nextInt(10);
		}
		return id;
	}
	/**
	 * 获取当前时间
	 */
	public static java.sql.Date getCurrentSqlDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		return date;
	}
}
