<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
</head>
<body style="background-color:brown;">
<div align="center">
<h1> your are now in your profile</h1>
</div>

<%

if(session.getAttribute("username")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	
}
%>
<div align="center">
<form action="choice" method="post">
<span class="btn btn-info">Edit your Account</span><br/>
<br/>
<input type="submit" name="operation" value="editaccountStu" />
</form>
</div>
<br/>
<br/>

<div align="center" style="background-color:gray;">
<h1> Doctor list and other service</h1>
<p>You have to Chat with the PersonalAssistant of the doctor.The ps will give you a Time to see the doctor.
You Have two option. 
1) Take treatment and prescription of the doctor via Online.
2)OR You Can directly see the doctor going to his chamber.The PS of the doctor will give you the meeting time.

For the first option You Have to pay money via bank acc or bkash.
</p>
<br/>
<ul class="list-group">
<li class="list-group-item"><a href="${pageContext.request.contextPath}/searchdoc"><span class="btn btn-info">Get doctor according to Disease </span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/seestudinfo?name=${username}"><span class="btn btn-info">your profile details </span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorlist/"><span class="btn btn-info"> All doctor List</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/choice?operation=pharmacy"><span class="btn btn-info">Order medicine </span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/appletter/${sid}"><span class="btn btn-info">Check AppointMent Letter </span></a></li>

</ul>

<a href="${pageContext.request.contextPath}/logout?log=logoutpatient&id=${sid}"><h3 style="color:black">LOG OUT</h3></a>
<br/>
<br/>
</div>
<br/>
<br/>
<br/>
<div align="center">
<ul class="list-group">
<li class="list-group-item">your id is : ${st.sid} </li>
<li class="list-group-item">name is : ${st.name} </li>
<li class="list-group-item">dept is : ${st.dept}</li>
<li class="list-group-item">roll is : ${st.roll} </li>
</ul>
 <br/>
 <br/>
  <br/>
 <br/>
 
 Student id id: ${sid}
 </div>


</body>
</html>