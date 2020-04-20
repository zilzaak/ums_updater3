<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link rel="stylesheet" href="static/theme/font-awesome470.css">
  <script src="<c:url value="/static/theme/jquery311.js" />" > </script>
<script src="static/theme/popper112.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
</head>
<body style="background-color:gray;">
<%
if(session.getAttribute("username")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	      }
%>
<div style="background-color:lightsteelblue;">
<div align="center" style="background-color:violet;">
<p color="blue">Message the PersonalAssistant of the doctor to take a apppintment or Message the doctor taking the PIN from Personal Assistant </p>
<br/>
 <h1>${invalidID}  </h1> 
<form action="smstops" method="post">
<input type="hidden" name="sid" value= ${selectedpid}  /> <br/>
<input type="hidden" name="aid" value= ${selecteddid}   /> <br/>
 <input type="hidden" name="studsms"/> <br/>

 </form>
</div>
<div class="row">
<div class="col-md-3">
</div>
<div class="col-md-6">
<ul class="list-group">
<li class="list-group-item"><a href="${pageContext.request.contextPath}/choice?operation=meetonline"><span class="btn btn-info">meet doctor through Online Conversation</span></a></li>
<li class="list-group-item">

<div style="background-color:indianred;">
<form  modelAttribute="Appointment" action="${pageContext.request.contextPath}/appointment" method="post">
<span class="btn btn-info"> request for a appointment </span><br/>
<p style="color:black;">TYPE YOUR PROBLEM SHORTLY 
</p>
<textarea name="problem" rows="5" cols="10"></textarea><br/><br/>
<p>CONTACT NO::</p>
<input type="text" name="contact"/><i class="fa fa-phone-square fa-lg" aria-hidden="true"></i>
<input type="hidden" name="reqby" value="${selectedpid}" />
<input type="hidden" name="reqto" value="${selecteddid}" />
<input type="submit" value="REQUESTNOW"/>
</form>
</div>
</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/appointmentmsg/${PID}/${DID}"><span class="btn btn-info">check appointment confirmation message</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/choice?operation=meetphysically"><span class="btn btn-info">get your all medical record</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/testinfo/${selectedpid}"><span class="btn btn-info">Check Medical Test Notification</span></a></li>
</ul></div>
<div class="col-md-3">
</div>
</div>

 ${selectedpid} 
 YOUR SELECTED DOCTOR DID IS : ${DID} 
  PATIENT PID: ${PID} 
  ${selecteddid }
</div>
</body>
</html>