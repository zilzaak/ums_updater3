<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>hey my babe</h1>
<h1>insert in add_contact</h1>

<form action="${pageContext.request.contextPath}/addcontact" method="get">
ENTER THE NUMBER OF MEDICINE ITEM:<input type="text" name="totalMedicine" />
<input type="submit" name="submit"/>

</form>

<a href="${pageContext.request.contextPath}/prescribe/">add_medicine</a>

</body>
</html>