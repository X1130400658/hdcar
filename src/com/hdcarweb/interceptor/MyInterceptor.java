package com.hdcarweb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception {  
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("test");
		if(!"admin".equals(name))
		{
			System.out.println(23);
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script>alert(\"ÇëÖØÐÂµÇÂ¼!\")</script>");
			return false;
		}
		System.out.println(24);
		return true;
    }
	@Override
	public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o, ModelAndView mv)  
            throws Exception {  
    }
	@Override
	public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object o, Exception excptn)  
            throws Exception {  
        System.out.println("The Operation Of Action Ending Successfully!");  
    } 
}
