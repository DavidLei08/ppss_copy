package com.ppss.framework;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 系统访问安全过滤器
 * @author ZXM
 *
 */
public class MyFilter implements Filter {
public static Log log=LogFactory.getLog(MyFilter.class);
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse=(HttpServletResponse) response;
		Object user = httpServletRequest.getSession().getAttribute("user");
		String url=httpServletRequest.getRequestURL().toString();
		log.info("ip_address:"+request.getRemoteAddr()+"   "+"request_url:"+url);
		//放行登陆请求、登出、静态资源、注册请求
		if((user != null) || (url.indexOf("login") != -1) ||(url.indexOf("logout") != -1)|| (url.indexOf("res") != -1)||(url.indexOf("regsiter") != -1)){
			
			chain.doFilter(request, response);
		}else { 
			httpServletResponse.setContentType("text/html; charset=UTF-8");
			//session失效或登录不成功，重定向索引页
			httpServletResponse.getWriter().print("<script type='text/javascript'>alert('会话失效请重新登录！！');parent.location.href='"
					+ httpServletRequest.getContextPath() + "/auth/login';</script>");
		}
		

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	public MyFilter() {

	}

}
