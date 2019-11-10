package com.gx.servlet.sendSMS;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import net.sf.json.JSONObject;
import javax.mail.*;
import javax.mail.internet.*;

public class SendsmsServlet extends HttpServlet {
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=UTF-8");
		 int  mobile_code = (int)((Math.random()*9+1)*100000);
		//邮箱发送
		/*// 收件人电子邮箱
	      String to =req.getParameter("mail");
	 
	      // 发件人电子邮箱
	      String from = "lidi88888888@126.com";
	 
	      // 指定发送邮件的主机为 smtp.qq.com
	      String host = "smtp.126.com";  //126 邮件服务器
	 
	      // 获取系统属性
	      Properties properties = System.getProperties();
	 
	      // 设置邮件服务器
	      properties.setProperty("mail.smtp.host", host);
	 
	      properties.put("mail.smtp.auth", "true");
	      // 获取默认session对象
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
	        public PasswordAuthentication getPasswordAuthentication()
	        {
	         return new PasswordAuthentication("lidi88888888@126.com", "yao854853678"); //发件人邮件用户名、密码
	        }
	       });
	 
	      try{
	         // 创建默认的 MimeMessage 对象
	         MimeMessage message = new MimeMessage(session);
	 
	         // Set From: 头部头字段
	         message.setFrom(new InternetAddress(from));
	 
	         // Set To: 头部头字段
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));
	 
	         // Set Subject: 头部头字段
	         message.setSubject("注册验证码");
	         
	 		
	         // 设置消息体
	         message.setText(mobile_code+"");
	 
	         // 发送消息
	         Transport.send(message);
	         System.out.println("发送成功");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }*/
		// 短信发送
		 int Phonecode=0;
		 
		 String Phonemobile=req.getParameter("phone");	
		 
		 HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

		/*int mobile_code = (int)((Math.random()*9+1)*100000);*/
		Phonecode=mobile_code;
	   String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
System.out.println("您的验证码是：" + mobile_code);
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "C31326792"), //查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
			    new NameValuePair("password", "08f9d6ad0b38e5218b8990abaeea5807"),  //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", Phonemobile), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);

			 if("2".equals(code)){
				System.out.println("短信提交成功");
				
			}

		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		JSONObject json = new JSONObject();
		if( Phonecode>0)
		{
			json.put("data",Phonecode);
		}
		else
		{
			json.put("data","失败");
		}
		PrintWriter out=resp.getWriter();
		out.write(json.toString());
	}
}
