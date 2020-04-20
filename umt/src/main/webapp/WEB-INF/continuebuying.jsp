<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:gray;">
<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("username")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	
}
%>
<div align="center">
	<h3>Products Page</h3>
	<table cellpadding="2" cellspacing="2" border="1">
		<tr>
		<th>item_id</th>
		<th>ITEM_Quantity</th>
		<th>Item_Nmae</th>
		<th>item_price</th>
		</tr>
		<c:forEach var="item" items="${cart}">
			<tr>
	   <td>${item.item_id }</td>
	   <td>${item.quantity }</td>
	   <td>${item.item_name }</td>
	   <td>${item.item_price}</td>
	   <td>${item.buydate}</td>
	   <td>${item.buyer_id}</td>
	   <td><a href="${pageContext.request.contextPath}/removecart/${item.item_id}">removeCart</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>