<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:brown;">
<h1>Upload your photo to make your profile 100% complete</h1>
 
<a href="${pageContext.request.contextPath}/"><big style="color:green;">Hompage</big></a>

<form action="drphotoupload" method="post" enctype="multipart/form-data">
updload your photo:<input type="file" name="file"/>
<input type="submit" name="upload"/>

</form>
</body>
</html>