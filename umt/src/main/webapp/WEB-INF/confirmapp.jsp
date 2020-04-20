<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" />" rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script>
<script src="<c:url value="/static/theme/popper114.js" />"></script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
</head>
<body style="background-color:lightblue;">
<h1>Confirm this Patient Appointment Request by giving Your Date</h1>

<form action="${pageContext.request.contextPath}/confirmapp" modelAttribute="App" method="post">
GIVE MEETING DATE:
<input type="text" name="meet_date"/><br/>
<br/>
<input type="hidden" name="app_id" value="${app.app_id}"/>
<input type="hidden" name="req_date" value="${app.req_date}"/>
<input type="hidden" name="reqby" value="${app.reqby}"/>
<input type="hidden" name="reqto" value="${app.reqto}"/>
<input type="hidden" name="problem" value="${app.problem}"/>
<input type="hidden" name="contact" value="${app.contact}"/>
<div>

</div>

<div>
<input type="submit" value="submit"/>
</div>

<br/>
<br/>


</form> 
</body>
</html>