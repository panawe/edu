package com.edu.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class IE9CompatablityFixServlet implements Filter
{
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		/*// ((HttpServletResponse) response).setHeader("X-UA-Compatible", "IE=EmulateIE7");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//String pageRequested = req.getRequestURI().toString();
		resp.addHeader("X-UA-Compatible", "IE=EmulateIE8");
		chain.doFilter(request, resp);*/
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}