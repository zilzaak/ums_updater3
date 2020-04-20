<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<div align="center" style="height:100px">
<h1>your final Appointment with date </h1>
<h1>you have </h1>
</div>
<div class="table-responsive-sm">
<table class="table table-hover" border="1">

<thead class="thead-dark"><tr>
<th>problem</th>
<th>patient name</th>
<th>request to</th>
<th>request date</th>
<th>meeting date</th>
<th>download this</th>
</tr>
</thead>

<tbody>
<c:forEach var="aps" items="${applst}">
<tr>
<td style="background-color:aquamarine;">${aps.problem}</td>
<td style="background-color:antiquewhite;">${aps.patientname}</td>
<td style="background-color:darkcyan;">${aps.doctorName}</td>
 <td style="background-color:darkseagreen;">${aps.req_date}</td>
<c:set var="con" value="${aps.meet_date}" />
  <c:if test ="${con!=null}">
 <td style="background-color:green;color:white;">${aps.meet_date}</td>
  </c:if>
<c:if test ="${con==null}">
 <td style="background-color:red;color:white;">wait for the appointment</td>
  </c:if>
  <td><a href=" ">download</a></td>
</tr>


</c:forEach>



</tbody>

</table>
</div>

</body>
</html>