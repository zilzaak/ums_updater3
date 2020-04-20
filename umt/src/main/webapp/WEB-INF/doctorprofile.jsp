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
<body style="background-color:burlywood;" onload="allapp();">
<script type="text/javascript">
function allapp(){
	var x = document.getElementById("app").value;
	if(x="yes"){
		$("#modbtn").show();
	}
	
}
</script>
<input type="hidden" id="app" value="${app}"/>
<%
if(session.getAttribute("Dusername")==null && session.getAttribute("Dpassword")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
}
%>
<div class="row">

<div class="col-sm-4  "> <h1> pust medial info</h1>

       <p style="color:yellow; font-size:20px;">pabna univaesity of science and technilogy has taken 
       a few step to provide help to the student .and it give all kind of services for its patient.
   this newly made website will take a very good influence of handling the all kind of upcomming medical problems
   of future students.
       </p>
</div>
<div class="col-sm-4 "> <h1> your profile info</h1>
<img  src="<c:url value="/static/drphoto/${dr.filename}" />"/>
<br/><br/>
<div class="row">
<div class="col-sm-6">
   <ul class="list-group">
   <li  class="list-group-item">NAME: ${dr.name}</li>
   <li  class="list-group-item">AGE:${dr.age}</li>
   <li  class="list-group-item">EXPERT IN:  ${dr.expertint}</li>
   <li  class="list-group-item">DIGREE:  ${dr.degree}</li>
   </ul>
</div>
</div>

</div>
<div class="col-sm-4 "> <h1> pust medical center</h1>
       <p style="color:yellow; font-size:20px;">pabna univaesity of science and technilogy has taken 
       a few step to provide help to the student .and it give all kind of services for its patient.
   this newly made website will take a very good influence of handling the all kind of upcomming medical problems
   of future students.
      </p>

</div>



</div>
<br/> <br/>
</div>

<br/>
<br/>
<div class="modal" id="recmodal">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
     <h4 class="modal-title"> all appointment History(PUST MC)</h4>
               </div>
   <div class="modal-body" >
    <table border="2">
    <tr style="background-color:darkcyan;">
    <th>patient</th>
    <th>Doctor</th>
    <th>date</th>
    <th>serial no</th>
    <th>Detete</th>
    </tr>
    <c:forEach var="ch" items="${dapps}">
    <tr>
    <td>${ch.prname}</td>
    <td>${ch.dname}</td>
    <td style="color:green;">${ch.chdate}</td>
    <td>${ch.sirialno}</td>
    <td><a href="JJJG">remove</a></td>
    </tr>
    </c:forEach>
    </table>
   </div>
 </div>
     </div>
    </div>	
<ul class="list-group">
<li class="list-group-item">
<a href="${pageContext.request.contextPath}/choice?operation=editaccountDoc"><span class="btn btn-info">edit your profile</span></a>
</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/choice?operation=onlineservice"><span class="btn btn-success">give service through online</span></a>
</li>
</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/recordapp/${aid}"><span class="btn btn-success">Records of Apointment</span></a>
<div  id="modbtn" style="display:none;">
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#recmodal">All Apointment Record</button>
</div>
</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/appointmentReqList/${aid}"><span class="btn btn-primary">give service via appointment</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/allontreatment?"><span class="btn btn-secondary">all Online treatment records</span></a>  <button class="btn btn-outline-secondary border-left-0 rounded-0 rounded-right" type="button">
<i class="fa fa-search"></i>
</button>
</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/logout?log=logoutdoctor&id=${aid}"><h3 style="color:black">LOG OUT</h3></a></li>

</ul>
<div class="row">
<div class="col-md-4">
</div>

<div class="col-md-4">
<h1>change your profile picture</h1>
<form action="${pageContext.request.contextPath}/updatedrphoto" method="post" enctype="multipart/form-data">
<span>updload your photo</span>::<input type="file" name="file"/>
<input type="submit" name="upload"/>
</form>
</div>
<div class="col-md-4">
</div>

</div>

</body>
</html>