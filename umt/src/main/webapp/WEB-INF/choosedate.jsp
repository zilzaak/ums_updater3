<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/static/theme/jquery-ui.css" /> " rel="stylesheet"> 
   <script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
  <script src="<c:url value="/static/theme/jquery-ui.js" />" > </script> 
  <link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">  
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet"> 
   <script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$("#dp").datepicker({
		
		showWeek:true,
	yearSuffix:"-CE",
	showAnim:"explode"
	});
	
});
</script>
<script type="text/javascript">

</script>
</head>
<body>

<div align="center">
<h1>choose a date for appointment</h1>
<form action="${pageContext.request.contextPath}/chooseapp" method="get">
<input type="hidden" name="chsid" value="${chsid}" />
<input type="hidden" name="chdid" value="${chdid}" />
<input type="text"  name="chdate" id="dp" />
<input type="submit" />
</form>
</div>




<br/><br/><br/>
<div align="center">
<h1>Your appointment list</h1>
<table border="2">
<tr>
<th>patient</th>
<th>doctor Name</th>
<th>date</th>
<th>Appointment PDF</th>
</tr>
<tr>

</tr>
</table>
</form>
</div>




</body>
</html>