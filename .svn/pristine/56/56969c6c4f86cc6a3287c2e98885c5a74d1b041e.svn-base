package org.gecko.framework.file;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.taglibs.standard.tag.common.core.OutSupport;
import org.gecko.common.utils.GeckoProperties;

/**
 * 文件下载管理
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2017年12月20日
 */
public class FileDownload {
	public void FtpDownload(String url,OutputStream outp) throws UnsupportedEncodingException, IOException{
		FTPClient ftp = null;
		InputStream in = null;  
		try{  
			 ftp = new FTPClient();
			/**
			* ftp服务器的相关配置
			*/
			String ftpIP = GeckoProperties.getString("FTP_SERVER_IP");
			int ftpPort = Integer.parseInt(GeckoProperties.getString("FTP_SERVER_PORT"));
			String userName =  GeckoProperties.getString("FTP_USER_NAME");
			String password =  GeckoProperties.getString("FTP_PASSWORD");
			try{
		          ftp.connect(ftpIP,ftpPort);
		          boolean a = ftp.login(userName,password);
		          System.out.println(a);
		    }catch (java.net.SocketException e){
		          e.printStackTrace();
		    }catch (java.io.IOException e){
		          e.printStackTrace();
		    }
			in = ftp.retrieveFileStream(new String(url.getBytes("utf-8"),"iso-8859-1"));   
			 byte[] b = new byte[1024];  
			 int i = 0;  
			 while((i = in.read(b)) > 0){  
				 outp.write(b, 0, i);  
			 }     
			outp.flush();  
		}catch (Exception e) {
			System.out.println("error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}finally {
			if(in != null){  
			  in.close();  
			  in = null;
			}  
			if(outp != null){
				outp.close();
				outp=null;
			}
		}
	}
}
