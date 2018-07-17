package org.gecko.framework.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.gecko.common.utils.GeckoProperties;
import org.gecko.core.security.interceptor.SecurityInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


/**
 * 文件上传管理
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2017年12月20日
 */
public class FileUpload {
	
	private final Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);
	/** 
	   * FTP server configuration--IP key,value is type of String 
	   */
	  public static final String SERVER_IP = "SERVER_IP"; 
	  
	  /** 
	   * FTP server configuration--Port key,value is type of Integer 
	   */
	  public static final String SERVER_PORT = "SERVER_PORT"; 
	  
	  /** 
	   * FTP server configuration--ANONYMOUS Log in key, value is type of Boolean 
	   */
	  public static final String IS_ANONYMOUS = "IS_ANONYMOUS"; 
	  
	  /** 
	   * user name of anonymous log in 
	   */
	  public static final String ANONYMOUS_USER_NAME = "anonymous"; 
	  
	  /** 
	   * password of anonymous log in 
	   */
	  public static final String ANONYMOUS_PASSWORD = ""; 
	  
	  /** 
	   * FTP server configuration--log in user name, value is type of String 
	   */
	  public static final String USER_NAME = "USER_NAME"; 
	  
	  /** 
	   * FTP server configuration--log in password, value is type of String 
	   */
	  public static final String PASSWORD = "PASSWORD"; 
	  
	  /** 
	   * FTP server configuration--PASV key, value is type of Boolean 
	   */
	  public static final String IS_PASV = "IS_PASV"; 
	  
	public String FtpUpload(MultipartFile file,HttpServletRequest request,String savePath) throws IOException{
		
		MultipartResolver resolver = new CommonsMultipartResolver(request
					.getSession().getServletContext());
		
		//获取文件的扩展名
		String originalFilename = file.getOriginalFilename();
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
		//文件名称在服务器上可能重复
		String newFileName="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		newFileName = sdf.format(new Date());
		Random r = new Random();
		for (int i = 0; i < 3; i++) {
			newFileName = newFileName+r.nextInt(10);
		}
		File newFile =new File(savePath+"/"+newFileName+suffix);
		
		//如果請求是复杂对象，即多部件包含附件
		if (resolver.isMultipart(request)) {
			try{
				// 复制文件到指定路径
				FileUtils.copyInputStreamToFile(file.getInputStream(),
							newFile);
				// 上传文件到服务器
				FTPClientUtil.upload(newFile, URLDecoder.decode(savePath,"UTF-8"));
			}catch(Exception e){  
				logger.error("文件上传失败");
				e.printStackTrace();  
			}
		
		} 
		return savePath+"/"+newFileName+suffix;
	}
	/**
	 * 文件上传到应用服务器的硬盘
	 * @param file
	 * @param request
	 * @param savePath
	 * @return
	 * @throws IOException
	 */
	public String FileUpload(MultipartFile file,HttpServletRequest request,String savePath) throws IOException{
		
		MultipartResolver resolver = new CommonsMultipartResolver(request
					.getSession().getServletContext());
		//获取文件的扩展名
		String originalFilename = file.getOriginalFilename();
		if(originalFilename.contains(".")){
			String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
			//文件名称在服务器上可能重复
			String newFileName="";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			newFileName = sdf.format(new Date());
			Random r = new Random();
			for (int i = 0; i < 3; i++) {
				newFileName = newFileName+r.nextInt(10);
			}
		    String realPath = request.getSession().getServletContext().getRealPath(savePath);   
			File newFile =new File(realPath+"/"+newFileName+suffix);
			//如果請求是复杂对象，即多部件包含附件
			if (resolver.isMultipart(request)) {
				try{
					if(!newFile.getParentFile().exists()){
						newFile.mkdir();//创建目录
					}
					// 复制文件到指定路径
					FileUtils.copyInputStreamToFile(file.getInputStream(),
								newFile);
					// 上传文件到服务器
					//FTPClientUtil.upload(newFile, URLDecoder.decode(savePath,"UTF-8"));
				}catch(Exception e){  
					logger.error("文件上传失败");
					e.printStackTrace();  
				}
			
			} 
			return newFileName+suffix;
		}else{
			return "-";
		}
	}
}
