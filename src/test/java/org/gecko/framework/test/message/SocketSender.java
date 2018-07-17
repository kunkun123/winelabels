package org.gecko.framework.test.message;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

import org.junit.Test;

import com.sun.tools.script.shell.Main;

public class SocketSender {
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		runServer();
	}
	private static void runServer() throws IOException {
		Socket socket=new Socket("127.0.0.1",5082);
		System.out.println("客户端连接成功");
		BufferedWriter write=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));     //可用PrintWriter
	
 
		while (true) {
 
			/*write.write("http://192.168.0.100/F?C=892NMJH235157381309979841,http://192.168.0.100/F?C=SHD8123NM5157376872018701,"
					+ "http://192.168.0.100/F?C=892NMJH2351573813100148c0,http://192.168.0.100/F?C=N4F2N12435157381195266600,"
					+ "http://192.168.0.100/F?C=N4F2N124351573811953335c0_,");//向客户端输出数据
*/			 		
			write.write("http://192.168.0.100/F?C=2018071145aa1973b5b142bca03185d0,http://192.168.0.100/F?C=2018071118ad15a9b6df498cae24516e,"
					+ "http://192.168.0.100/F?C=20180711d94051b5450f4148a0c67cb9,http://192.168.0.100/F?C=201807114472814290244502a8dbc1ee,"
					+ "http://192.168.0.100/F?C=20180711ff6466f5018c4542b8aa1c7d_,");//向客户端输出数据
			
			
			/*write.write("http://192.168.0.100/F?C=892NMJH235157381309979841,");//向客户端输出数据
*/			
			
			write.flush();
			write.close();
			break;
		}
	}
}
