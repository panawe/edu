<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="com.edu.bean.*" import="com.edu.model.*" import="java.util.*"
	import="com.edu.security.model.*" errorPage="index.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title></title>
	<script src="common/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
	<script src="common/dhtmlxscheduler_recurring.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="common/dhtmlxscheduler.css" type="text/css" title="no title" charset="utf-8">
	<link rel="stylesheet" href="common/dhtmlxscheduler_recurring.css" type="text/css" title="no title" charset="utf-8">
<style type="text/css" media="screen">
	html, body{
		margin:0px;
		padding:0px;
		height:100%;
		overflow:hidden;
	}	
</style>
<script type="text/javascript" charset="utf-8">
	function init() {
		scheduler.config.xml_date="%Y-%m-%d %H:%i";
		debugger;
		scheduler.locale.labels.section_location="Description";
		scheduler.locale.labels.section_description="Title";
		scheduler.config.details_on_create=true;
		scheduler.config.details_on_dblclick=true;
		scheduler.init('scheduler_here',null,"month");
		if ("1" != '<%=request.getSession().getAttribute("eventAccessLevel")%>')
			scheduler.config.readonly = true;
		scheduler.load("events_rec.do?uid="+scheduler.uid());
		var dp = new dataProcessor("events_rec.do");
		dp.init(scheduler);
	}
</script>
</head>
<body onload="init();">
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>
</body>
</html>