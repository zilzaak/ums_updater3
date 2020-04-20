<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery340.js" />" > </script>
<script src="<c:url value="/static/theme/popper114.js" />"></script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
</head>
<body onload="checknull();">
<script type="text/javascript">
function checknull(){
	var x = document.getElementById("n").value;

	if(x="yesnull"){
		alert("no appointment request is available");
		$("#nn").hide();	
	}
	
}

</script>
<input type="hidden" id="n" value="${nllval}"/>

<div align="center" id="nn" style="width:350px;margin-left:200px;">
<b>All Appointment Request's</b>
<table class="table table-hover" border="1">
<thead class="thead-dark">
<th> request date</th>
<th>problem</th>
<th>patient id</th>
<th>contact</th>
<th>confirmation status</th>
<th>confirm request</th>
<th>consultation date</th>
<thead>
<tbody>
<c:forEach var="app" items="${apps}">
<tr>
<td>${app.req_date}</td>
<td> ${app.problem}</td>
<td>${app.reqby}</td>
<td>${app.contact}</td>
<td>
  <c:set var = "con"  value ="${app.meet_date}"/>
      <c:if test ="${con==null}">
   <c:out value = "not confirmed yet"/>
   </c:if>
  <c:if test ="${con!=null}">
  <c:out value = "confirmed"/>
</c:if>
</td>
<td>
  <c:set var = "con"  value ="${app.meet_date}"/>
      <c:if test = "${con==null}">
<a href="${pageContext.request.contextPath}/appconfirm/${app.app_id}/${app.reqby}/${app.reqto}/${app.problem}/${app.contact}">confirm this</a></td>
   </c:if>
<td>${app.meet_date}</td>
</tr>
</c:forEach>
</tbody>

</table>
</div>



</body>
</html>