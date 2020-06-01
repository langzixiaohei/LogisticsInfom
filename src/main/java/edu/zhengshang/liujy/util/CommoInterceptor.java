package edu.zhengshang.liujy.util;//package cn.os.util;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//public class CommoInterceptor extends HandlerInterceptorAdapter{
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		if(request.getSession().getAttribute("userSession")!=null){
//			return true;
//		}else{
//			response.sendRedirect(request.getContextPath()+"/backer.jsp");
//			return false;
//		}
//	}
//}
