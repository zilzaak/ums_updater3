<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="table-responsive">
  <table class="table">
    	<tr>
    	<th>patientID</th>
		<th>DoctorID</th>
		<th>patientName</th>
		<th>age</th>
		<th>DiseaseType</th>
	</tr>
	<tr>
<td>${prescriptionForm.idpx}</td>
<td>${prescriptionForm.iddx}</td>
<td>${prescriptionForm.xpname}</td>
<td>${prescriptionForm.xpage}</td>
<td>${prescriptionForm.tdisease}</td>

	</tr>
  </table>
</div>

<table border="1">
	    <tr>
		<th>No</th>
		<th>MedicineName</th>
		<th> schedule</th>
		<th>condition</th>
		<th>duration</th>
	</tr>
	<c:forEach items="${prescriptionForm.dlist}" var="mdcn" varStatus="status">
		<tr>
		<td align="center">${status.count}</td>
		<td>${mdcn.ndrug}</td>
		<td>${mdcn.sdrug}</td>
		<td>${mdcn.cdrug}</td>
		<td>${mdcn.ddrug}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>