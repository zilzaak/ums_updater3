<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery340.js" />" > </script>
<script src="<c:url value="/static/theme/popper114.js" />"></script>
<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">
</head>
<body id="slog">
<div align="center" >
<h1>Patient Entry form</h1>
<bold style="color:red;">${sms}</bold>

  <div  style="margin-left:300px;margin-right:300px;background-color:darkcyan;border:8px solid;">
   <form action="loginstudent" method="post" >

<div  style="margin-left:50px;margin-right:50px; margin-top:50px" >
<input type="text" class="form-control" placeholder="name"  name="name"/> </div>

<div   style="margin-left:50px;margin-right:50px; margin-top:50px">
<input type="password" class="form-control" placeholder="password" name="password"/> </div>

<input type="submit" style="margin-top:50px;" name="save"/>
      <input type="reset"  name="clear"/>
</form>
   </div>
<div align="center">
<P style="color:black"><big>NOT REGISTERED YET AS PATIENT????</big></h1>
 <a href="${pageContext.request.contextPath}/choice?operation=studentreg">CLICK TO REGISTER</a>
</div>
</div>
</body>
</html>