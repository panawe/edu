<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="com.edu.bean.*" import="com.edu.model.*" import="java.util.*"
	import="com.edu.security.model.*" errorPage="index.jsp"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>E-Soft Systems Inc.</title>
<LINK rel="SHORTCUT ICON"  href="images/logo_icone.gif"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description"
	content="Designed and developed by E-Soft Systems Inc. - www.e-softsystems.com" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
.dr-mpnl-pnl {
	overflow: auto !important
}

.requiredField {
	border-color: red
}

.rich-sdt-column-cell-body {
	height: 30px;
	text-align: center;
	valign: center
}

.disabledDay {
	background-color: gray;
}
</style>

<script>
	function isDayEnabled(day) {
		var date = new Date(day.date);
		return (date.getDay() == 6); // 6 is Saturday, the only day that should be enabled.
	}
	function getDisabledStyle(day) {
		callScript(new Date(day.date));
		if (!isDayEnabled(day))
			return 'rich-calendar-boundary-dates disabledDay';
	}
</script>
</head>
<body style="height: 100%;">