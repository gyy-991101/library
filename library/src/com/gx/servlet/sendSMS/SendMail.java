package com.gx.servlet.sendSMS;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import net.sf.json.JSONObject;
public class SendMail extends HttpServlet {
	
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	/* int  mobile_code = (int)((Math.random()*9+1)*100000);
	// 收件人电子邮箱
    String to = "lidi8888888@126.com";

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
       message.setText("123");

       // 发送消息
       Transport.send(message);
       System.out.println("发送成功");
    }catch (MessagingException mex) {
       mex.printStackTrace();
    }*/
	//super.doGet(req, resp);
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	resp.setContentType("application/json; charset=UTF-8");
	
	 int  mobile_code = (int)((Math.random()*9+1)*100000);
		//邮箱发送
		// 收件人电子邮箱
	     String to =req.getParameter("mail");
	
	      JSONObject json = new JSONObject();
			if( mobile_code>0)
			{
				json.put("data",mobile_code);
			}
			else
			{
				json.put("data","失败");
			}
			PrintWriter out=resp.getWriter();
			out.write(json.toString());
	}
}
