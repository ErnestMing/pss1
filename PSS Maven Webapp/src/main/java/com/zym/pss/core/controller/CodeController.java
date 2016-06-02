package com.zym.pss.core.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zym.pss.util.SMS;

@Controller
public class CodeController{

	@RequestMapping("/code.action")
	public void SMS(String phone,HttpSession session ){
		String mobile =phone; 
		String content;
		
		Random ran  = new Random() ; 
		StringBuffer sb = new StringBuffer() ;
		
		//生成6为数字验证码
		for(int i = 0 ;i<6;i++){
			sb.append(ran.nextInt(10));
		}
		//验证码
		String code = sb.toString() ; 
		System.out.println("验证码"+code);
		
		try {
			content = URLEncoder.encode("【Ming云】验证码:"+code+",请勿泄露。", "UTF-8");
			SMS sms = new SMS();		//短信工具类
			sms.request(mobile,content);		//发送短信
			
			session.setAttribute("code", code);		//将验证码放入Session
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
}
