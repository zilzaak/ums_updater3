<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery311.js" />" > </script>
<script src="static/theme/popper114.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<body>
<table>
<tr>
<th>Doctor name</th>
<th>patient name</th>
<th>test name</th>
<th> date </th>
</tr>
<c:forEach var="t" items="${tests}">
<tr>
   <td>${t.nameofd}</td>
   <td>${t.nameofp}</td>
   <td>${t.testname}</td>
</tr>
</c:forEach>
</table>
</body>
</html>