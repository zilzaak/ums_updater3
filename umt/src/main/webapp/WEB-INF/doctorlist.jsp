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
</head>
<body style="background-color:orange;">
<%
if(session.getAttribute("username")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
%>
<div style="background-color:lightblue;">
<div align="center" style="color:green;">
<a href="${pageContext.request.contextPath}/activelist?listof=doctor"><h3>SEE ACTIVE DOCTOR LIST</h3></a><br/>
<h1>active doctor list</h1> <br/>
<table border="2">
<th>Doctor_ID</th>
<th>Doctor_Name</th>
<th>OnlineStatus</th>
<th>HIS PROFILE</th>
<c:forEach var="onlineactive" items="${activelistofdoctor}">
<tr>
   <td>${onlineactive.person_id}</td>
   <td>${onlineactive.name}</td>
   <td>${onlineactive.active_status}</td>
   <td><a href="godoctorprofile?gdid=${onlineactive.person_id}&gsid=${sid}"><span class="btn btn-success">go his profile</span></a></td>
</tr>

</c:forEach>
</table>
</div>
<br/>
<br/>
<div align="center"  style="background-color:gray;" >
<form action="doctorlist" method="post">
<input type="submit" name="submit" value="alldoctor"/>
</form> <br/>

		<h1>Doctor List</h1>
		
<table border="1" style="background-color:lightyellow;">
            <th>Did</th>
			<th>Name</th>
			<th>age</th>
			<th>degree</th>
			<th>ExpertIn</th>
			<th>doctorphone</th>
            <th>image</th>
             <th>Profile</th>
			<c:forEach var="doctor" items="${doctors}">
				<tr>
                    <td>${doctor.did}</td>
					<td>${doctor.name}</td>
					<td>${doctor.age}</td>
					<td>${doctor.degree}</td>
				    <td>${doctor.expertint}</td>
				    <td>${doctor.drphone}</td>
				    <td><img  src="<c:url value="/static/drphoto/${doctor.filename}" />" /></td>
<td><a href="${pageContext.request.contextPath}/godoctorprofile?gdid=${doctor.did}&gsid=${sid}"><span class="btn btn-success">go his profile</span></a></td>
				 </tr>
	</c:forEach>
		</table>
				    </div>
</div>
</body>
</html>