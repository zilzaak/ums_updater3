<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/static/main.css" /> " rel="stylesheet">
<script src="<c:url value="/static/main.js" />" > </script>
<script src="<c:url value="/static/jquery.js" />" > </script>

<title>Insert title here</title>
</head>
<body>
<div>
<h1>1. booking appointment </h1>
<h1>2. call for emergency</h1>
<h1>3.number of some contacts are given bellow</h1>
<div  id="msg"> 
<p>this service is for everybody so that the local area people can take the service from here.
public can get help easyly from this. to book appointment you have to register . neverthless you can not access
list of doctor are availabe for serving yot. contacts number are given here
<div>

<form action="choice" method="post">

 <div class="findblood">  <input type="submit" name="operation" value="studentlogin" style="background-color:blue;height:2em;width:10em;" /></div>
</form>

</div>


<div id="doclist" align="center"  style="background-color:gray;" >

		<div>
		<img src="C:\\Users\\toshiba\\eclipse-workspace\\umt\\WebContent\\nurse2.jpg" />
		<img src="C:\\Users\\toshiba\\eclipse-workspace\\umt\\WebContent\\nurse2.jpg" />

	<img src="C:\\Users\\toshiba\\eclipse-workspace\\umt\\WebContent\\nurse2.jpg" />
		<img src="C:\\Users\\toshiba\\eclipse-workspace\\umt\\WebContent\\nurse2.jpg" />
	</div>
	</div>
</div>

</div>
</body>
</html>