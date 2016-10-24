package com.edu.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class RestrictPageFilter implements Filter{

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		String pageRequested = req.getRequestURI().toString();
		if (session == null) {
			session = req.getSession(true); // will create a new session
			resp.sendRedirect("index.faces");
		} else if ((session.getAttribute("user") == null)
				&& (!pageRequested.contains("index"))) {
			resp.sendRedirect("index.faces");
		} else {
			chain.doFilter(request, response); // continue filtering
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}
