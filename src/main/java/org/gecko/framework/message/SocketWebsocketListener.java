package org.gecko.framework.message;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.socket.TextMessage;

import sun.tools.tree.NewArrayExpression;


public class SocketWebsocketListener{
	
		public  String info = "";
		private static ServerSocket serverSocket;  
		private static Socket socket;
		private static Socket client;
		    public void init() {    
		        try {    
		        	 final int PORT=5082;
		             serverSocket = new ServerSocket(PORT);    
		            while (true) {    
		                // 一旦有堵塞, 则表示服务器与客户端获得了连接    
		                client = serverSocket.accept();  
		                Thread.sleep(2000);
		                // 处理这次连接    
		                new HandlerThread(client); 
		            }    
		        } catch (Exception e) {    
		            System.out.println("服务器异常: " + e.getMessage());    
		        }    
		    }    
		    
		    private class HandlerThread implements Runnable { 
		    	SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		         public HandlerThread(Socket client) {    
		            socket = client;    
		            new Thread(this).start();    
		        }    
		    
		        public void run() {    
		            try {    
		            	
		                // 读取客户端数据    
		                DataInputStream input = new DataInputStream(socket.getInputStream());  
		                
		                // byte[] buf = new byte[3000];
		                // available stream to be read
		                int length = input.available();
		                
		                // create buffer
		                byte[] buf = new byte[length];
		                
		                // read the full data into the buffer
		                input.readFully(buf);
		                
		                // for each byte in the buffer
		                for (byte b:buf)
		                {
		                   // convert byte to char
		                   char c = (char)b; 
		                   if(c==','){
		                	  info+=('='+sdf.format(new Date())+c);
		                   }else{
		                	  info+=c;
		                   }
		                   // prints character
		                   System.out.print(c);
		                }
		                input.close();
		                
		                /**如果通过websocket方式给浏览器推送消息**/
		                new SpringWebSocketHandler().sendMessageToUsers(new TextMessage(info));
		                info="";
		            } catch (Exception e) {    
		                System.out.println("服务器 run 异常: " + e.getMessage());    
		            } finally {    
		                if (socket != null) {    
		                    try {    
		                        socket.close();    
		                    } catch (Exception e) {    
		                        socket = null;    
		                        
		                        System.out.println("服务端 finally 异常:" + e.getMessage());    
		                    }    
		                }    
		            }   
		        }    
		    }   
		    
		    public void startCollection(){
		    	 new HandlerThread(client);
		    }
		    /**
			 * 停止采集后socket结束
			 * 
			 * @throws IOException
			 */
			public void stop() throws IOException {
				
				if (socket != null) {
					socket.close();
					
					serverSocket.close();
				}
				info="";
			}
			public void reciveDate() throws IOException {
				
				// 处理这次连接    
		        //new HandlerThread(socket); 

			}
			public  String getInfo() {
				return this.info;
			}
}
