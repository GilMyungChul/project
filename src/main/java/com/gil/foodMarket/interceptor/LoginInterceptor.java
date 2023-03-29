package com.gil.foodMarket.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		
		HttpSession session = request.getSession();
		handler = (Object)session.getAttribute("loginDto");
		
		if (handler == null) {
			
			response.sendRedirect("loginForm.do");
			return false;
		}
		
		return true;
		
	}
	
}
