package com.cocovill.order.common;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Controller
public class InterceptorLogin extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(InterceptorLogin.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(true);
	
		logger.info("RequestURL:"+request.getRequestURI());
		
		//InterCeptor 제외 url
		if(
				//login 페이지
				request.getRequestURI().startsWith("/user/userLoginForm")
				//리소스
				||request.getRequestURI().startsWith("/resources")

				//||"/resources".equals(request.getRequestURI())
				){
			return true;
		}
		

		InetAddress Address = InetAddress.getLocalHost(); 
		String ip = Address.getHostAddress();
		
		
		if(session.getAttribute("USER_ID") == null){
			logger.info("인터셉터::로그인정보 없음");
			response.sendRedirect("/user/userLoginForm.do");
			return false;
		}
		
		// 등록,수정,삭제일 경우 슈퍼관리자 권한 체크
//		if(request.getRequestURI().indexOf("insert") > 0 || request.getRequestURI().indexOf("INSERT") > 0
//			|| request.getRequestURI().indexOf("update") > 0 || request.getRequestURI().indexOf("UPDATE") > 0
//			|| request.getRequestURI().indexOf("delete") > 0 || request.getRequestURI().indexOf("DELETE") > 0
//		){
//			logger.info("SIUD:"+request.getRequestURI());
//			if(!session.getAttribute("USER_AUTH").toString().equalsIgnoreCase(user_auth_AllAdmin)){
//				logger.info("인터셉터::권한없음"+session.getAttribute("USER_AUTH").toString());
//				response.sendRedirect("/common/login/form.mee");
//				return false;
//			}
//			
//		}
		
		return true;
	}
 
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
 
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
