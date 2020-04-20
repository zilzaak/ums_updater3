<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:coral;">
<div align="center">

added product is: ${product.product_name}
addes price is : ${product.price}
added id is : ${product.pid}
</div>
<div>
	<h3>Products Page</h3>
	<table cellpadding="2" cellspacing="2" border="1">
		<tr>
			<th>pId</th>
			<th>Name</th>
			<th>photo</th>
			<th>Price</th>
			<th>Buy</th>
		</tr>
		<c:forEach var="product" items="${prods}">
			<tr>
	<td>${product.pid }</td>
	<td>${product.product_name }</td>
	<td>${product.price }</td>
	
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>