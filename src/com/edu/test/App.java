package com.edu.test;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class App 
{
    public static void main( String[] args )
    {
   	 Date curr = new Date(); 
	    Calendar cal = Calendar.getInstance(); 
	    cal.setTime(curr); 
	    int currentDOW = cal.get(Calendar.DAY_OF_WEEK);
	    cal.add(Calendar.DAY_OF_YEAR, (currentDOW * -1)+1);

	    Format formatter = new SimpleDateFormat("MM/dd/yy");
	    System.out.println("First day of week="+formatter.format(cal.getTime()));
	    
    	ApplicationContext appContext = 
    	  new ClassPathXmlApplicationContext(new String[] {"Spring-Customer.xml"});
 
    	CustomerService cust = 
	  (CustomerService)appContext.getBean("customerServiceProxy");
 
    	System.out.println("*************************");
    	cust.printName();
    	System.out.println("*************************");
    	cust.printURL();
    	System.out.println("*************************");
    	

    	    
    	try{
    	   cust.printThrowException();
    	}catch(Exception e){	
    	}
    }
}