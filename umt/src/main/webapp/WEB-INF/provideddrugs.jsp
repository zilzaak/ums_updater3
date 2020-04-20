<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery340.js" />" > </script>
<script src="<c:url value="/static/theme/popper114.js" />"></script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
</head>
<body>
<div align="center"><h1>your provided drug list are as follows</h1></div>
<div class="table-responsive">
<table class="table table-hover" border="1">
<thead  class="thead-dark">
<tr>
<th>drugName</th>
<th>Schedule of taking Drug</th>
<th>condition</th>
<th>duration</th>
</tr>
</thead>
<tbody>
<c:forEach var="drug" items="${druglist}">
<tr>
<td>${drug.ndrug}</td>
<td>${drug.sdrug}</td>
<td>${drug.cdrug}</td>
<td>${drug.ddrug}</td>
</tr>

</c:forEach>

</tbody>
</table>
</div>
</body>
</html>