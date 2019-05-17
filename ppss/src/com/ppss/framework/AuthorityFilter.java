package com.ppss.framework;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ppss.model.UserModel;

/**
 * 用户权限控制
 * Servlet Filter implementation class AuthorityFilter
 */
@WebFilter("/AuthorityFilter")
public class AuthorityFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthorityFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//请求对象强转
		HttpServletRequest hsr=(HttpServletRequest) request;
		//响应对象强转
		HttpServletResponse hsp=(HttpServletResponse) response;
		//取得session中登录成功的用户信息
		UserModel userModel=(UserModel) hsr.getSession().getAttribute("user");
		//取得请求url
		String url=hsr.getRequestURL().toString();
		//判断权限是否为管理员
		if(userModel.getStatus()==0){
			//放行所有请求
			chain.doFilter(request, response);
		}//判断权限为普通用户，同时不允许执行更新和删除
		else if(userModel.getStatus()==1&&!url.contains("del")&&!url.contains("update")){
			chain.doFilter(request, response);
		}else{//条件不满足，直接回到登录页
			hsr.getRequestDispatcher(hsr.getContextPath()+"/sys/login").forward(hsr, hsp);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
