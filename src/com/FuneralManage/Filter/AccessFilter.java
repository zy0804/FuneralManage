package com.FuneralManage.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccessFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unused")
	@Override                     //对请求进行过滤，防止危险访问，确保登录后才能进入系统
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;  
		HttpServletResponse response = (HttpServletResponse) resp;  
		HttpSession session = request.getSession();  				//获取session
		String userName = (String) session.getAttribute("userName");  //从session中获取用户名
		String uri = request.getRequestURI();
		String path = request.getServletPath();
		
		if (path.indexOf("Login")>0||path.indexOf("assets")>0||path.equals("/js/AjaxJson.js")||path.indexOf("Register")>0)  //是从登录页面登录，则继续发送请求
//		String file[] = uri.split("/");
//		System.out.println(file[file.length-1]);
//		if(file[file.length-1].equals("Login.html")||file[file.length-1].equals("Register.html"))
		{

				chain.doFilter(request, response);
				return; 
			}else {//不是登录页面，判断session中是否有用户名
				if (session!=null) {
					
				
				if ((userName != null && userName!="")) {     //session中有用户名，则用户已经已登录
                	chain.doFilter(req, resp); 				 //继续发送请求
                }else {													//session中没有用户名，则未登录
                	response.sendRedirect("http://localhost:8080/FuneralManage/Login.html");  //重新定向到登录页面
				}
			}else {
					response.sendRedirect("http://localhost:8080/FuneralManage/Login.html");
			}

		}
		
	
		
		       // 除了登录页面以外的页面和登录action以外，检查登录情况，未登录的需要重定向并且不通过过滤  
//		        if (uri.indexOf("Login.html") == -1 && uri.indexOf("LoginAction") == -1) {    //不是登录页面
//		           
//		                if ((userName != null && userName!="")) {                //已登录
//		                	chain.doFilter(req, resp); 
//		                }else {													//未登录
//		                	response.sendRedirect("http://localhost:8080/FuneralManage/Login.html");
//		                	System.out.println("!!");
//						}  
//		          
//		        }else {                //是登录页面
//		        	chain.doFilter(request, response);
//				}  
		    }

		
	

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
