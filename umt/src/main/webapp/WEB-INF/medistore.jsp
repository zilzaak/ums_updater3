<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:aqua;">
IN THE MEDISTORE
<div align="center" style="background-color:aquamarine;">
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(request.getSession().getAttribute("sname")==null && request.getSession().getAttribute("spass")==null){
	response.sendRedirect("${pageContext.request.contextPath}/pharmacy.jsp");
}
%>

sid is ${sid}
	<h3>Products Page</h3>
	<table cellpadding="2" cellspacing="2" border="1">
		<tr>
			<th>pId</th>
			<th>Name</th>
			<th>photo</th>
			<th>Price</th>
			<th>Buy</th>
		</tr>
		<c:forEach var="p" items="${list}">
			<tr>
	<td>${p.pid }</td>
	<td>${p.product_name }</td>
	<td>${p.price }</td>
	<td align="center">
	<a href="${pageContext.request.contextPath }/buy/${p.pid}/${sid}">Add To Cart</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>