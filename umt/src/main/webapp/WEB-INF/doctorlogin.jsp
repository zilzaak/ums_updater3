<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">
</head>
<body id="dlog">
<div align="center">
<h1>doctor login form</h1>
</div>
<div align="center"><bold>${sms}</bold></div>
<div class="border border-success" style="margin-left:300px;margin-right:300px;bakground-color:green;">
<form class="container" action="logindoctor" method="post" >
 <div class="form-group">
    <label for="email">USER NAME:</label><br/>
   <i class="fa fa-user-circle fa-lg" aria-hidden="true"></i>
   <br/>
    <input type="text" class="form-control" id="email" name="name">
  </div>
  <div class="form-group">
    <label for="pwd">PASSWORD:</label><br/>
  <i class="fa fa-key fa-lg" aria-hidden="true">
  <br/>
  </i><input type="password" class="form-control" id="pwd" name="password">
  </div>
 <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
<br/>
<div align="center" style="background-color:darkseagreen; margin-left:290px;margin-right:290px;">
<p style="color:red"><bold>NOT REGISTERED YET AS DOCTOR????</bold></p>
 <a href="${pageContext.request.contextPath}/choice?operation=doctorreg">CLICK TO REGISTER</a>
</div>
</body>
</html>