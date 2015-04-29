package com.bits_pilani.goa.arc.WebService;

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

/**
 * Servlet Filter implementation class SessionCheckFilter
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
//@WebFilter("/SessionCheckFilter")
public class SessionCheckFilter implements Filter {

	private String contextPath;

	/**
	 * Default constructor. 
	 */
	public SessionCheckFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;  

		if (req.getSession().getAttribute("LOGIN_USER") == null) { //checks if there's a LOGIN_USER set in session...
			System.out.println("Inside null session");
			res.sendRedirect(contextPath + "/login.jsp"); //or page where you want to redirect
		} else {
			System.out.println("Inside NON null session");
			String userType = (String) req.getSession().getAttribute("LOGIN_USER");
			if (!userType.equals("ADMIN")){ //check if user type is not admin
				//res.sendRedirect(contextPath + "/main.jsp"); //or page where you want to  
			}
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		contextPath = fConfig.getServletContext().getContextPath();
	}

}
