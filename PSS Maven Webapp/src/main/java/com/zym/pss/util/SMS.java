package com.zym.pss.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class SMS {
	String httpUrl = "http://apis.baidu.com/kingtto_media/106sms/106sms";
//	String httpArg = "mobile=18307202611&content=%E3%80%90%E7%9F%AD%E4%BF%A1%E9%80%9A%E3%80%91%E6%82%A8%E7%9A%84%E9%AA%8C%E8%AF%81%E7%A0%81%EF%BC%9A888888";
	String httpArg ;
	/**
	 * @param mobile
	 * 		接收的手机号
	 * @param content
	 * 		发送的内容
	 * @return
	 */
	public String request(String mobile ,String content) {
		StringBuffer sb = new StringBuffer(); 
		sb.append("mobile=");sb.append(mobile);
		sb.append("&content=");sb.append(content);
		httpArg = sb.toString();
		
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + httpArg;
	    System.out.println(httpUrl);

	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        // 填入apikey到HTTP header
	        connection.setRequestProperty("apikey",  "d976c33a48d935b11f65cb543afe40ca");
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}

/*	public static void main(String[] args) {
		String mobile ="18307202611";  
		String content;
		try {
			content = URLEncoder.encode("【Ming云】恭喜你，中路100万，请查收。", "UTF-8");
			System.out.println(content);
			System.out.println(new SMS().request(mobile,content));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
*/}
