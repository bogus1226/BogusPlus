package com.bogus.bogusplus.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor  {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		// /user/signin/email/view
		String uri = request.getRequestURI();
		
		// 로그인이 되지 않았을때
		if(userId == null) {
			
			// "user" 를 제외한 모든상태에서
			if(uri.startsWith("/movie") || uri.startsWith("/profile") || uri.startsWith("/suda") ) {
				
				// 로그인 페이지로 이동해라
				response.sendRedirect("/user/signin/email/view");
				return false;
			}
		}
		
		return true;

		
	}
}
