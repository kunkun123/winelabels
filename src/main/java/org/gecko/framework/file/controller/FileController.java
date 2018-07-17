package org.gecko.framework.file.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gecko.framework.file.FileDownload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 文件上传下载的控制器
 * @author Aisino.liuyk
 * @email liuyikun@aisino.com
 * @date 2017年12月20日
 */
@Controller
@RequestMapping("/complaint/file")
public class FileController {
	@RequestMapping("/fileDownload")
	public void fileDownload(String url,String name ,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//get方式提交的参数默认是ISO-8859-1编码
		url = new String(url.getBytes("ISO-8859-1"), "UTF-8");
		name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
		//编码方式
		String enc = "utf-8";
		request.setCharacterEncoding(enc);  
	    response.setContentType("text/html;charset="+enc); 
	    response.addHeader("Content-Type", "application/octet-stream");
		/* attachment：建议浏览器将响应体保存到本地，而不是正常处理响应体。 
		 *filename=yourfilename.suffix：直接指明文件名和后缀。
		 *filename*=utf-8’’yourfilename.suffix：指定了文件名编码。其中，编码后面那对单引号中还可以填入内容，此处不赘述，可参考规范。
		 *有些浏览器不认识 filename*=utf-8''yourfilename.suffix （估计因为这东西比较复杂），所以最好带上 filename=yourfilename.suffix 。
		 */
	    response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(name.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		ServletOutputStream outp = response.getOutputStream();
		new FileDownload().FtpDownload(url,outp);
	}
}
