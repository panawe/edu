package com.edu.listener;

import java.util.Date;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.edu.security.bean.UserBean;
import com.edu.security.model.SessionHistory;

public class MySessionListener implements HttpSessionListener {
	public void sessionCreated(HttpSessionEvent se) {

		try {


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void sessionDestroyed(HttpSessionEvent se) {
		try {
			
			UserBean ub = (UserBean)se.getSession().getAttribute("userBean");
			if(ub!=null){
				SessionHistory sh = ub.getSessionHistory();
				sh.setEndDate(new Date());
				ub.getUserService().update(sh, ub.getUser());				
			}
		} catch (Exception e) {
			System.out.println("Impossible to close connection");
			e.printStackTrace();
		}
	}
}
