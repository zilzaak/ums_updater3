<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
 <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
   <script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>



<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>

</head>
<body onload="knocked();prescribed();activep();">
<script type="text/javascript">
function knocked(){
	var x1 = document.getElementById("kp").value;
	if(x1="yes"){
		$("#modbtn").show();
	}
	
}
function activep(){
	var x2 = document.getElementById("ap").value;
	if(x2="yes"){
		$("#modbtn3").show();
	}
}
function prescribed(){
	var x3 = document.getElementById("pp").value;
	if(x3="yes"){
		$("#modbtn2").show();
	}
	
}
</script>
<input type="hidden" id="kp" value="${kp}"/>
<input type="hidden" id="ap" value="${ap}"/>
<input type="hidden" id="pp" value="${pp}"/>


  <div class="modal" id="recmodal">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
     <h4 class="modal-title">Record of all appointment(PUST MC)</h4>
               </div>
   <div class="modal-body">
      <table border="2px" padding="2px" style="color:maroon;">
<p style="color:white;">listofknockedpatient</p>
<th>patient id</th>
<th>patient name</th>
<th>knock this patient</th>
<c:forEach var="pInfos" items="${pInfos}">
<tr>
<td>${pInfos.sid}</td>
<td>${pInfos.name}</td>
<td><a href="${pageContext.request.contextPath}/ChatDescision?operation=chatWithOldPatient&pid=${pInfos.sid}&aid=${aid}">knock</a></td>
</tr>
</c:forEach>
</table>
<br/>
<table border="2px"  cellspacing="2px"  padding="2px" style="color:maroon;">
<th>knocking date</th>
<th>doctor id</th>
<c:forEach var="sms" items="${smsInfos}">
<tr>
<td>${sms.date}</td>
<td>${sms.aid}</td>
</tr>
</c:forEach>
</table> 
   </div>
 </div>
     </div>
    </div>	















  <div class="modal" id="recmodal2">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
     <h4 class="modal-title">Record of all appointment(PUST MC)</h4>
               </div>
   <div class="modal-body"  style="width:400px;">
   <table border="2px">
<p style="color:white;">Prescription Record</p>
<tr>
<th>prescription_id</th>
<th>pid</th>
<th>pname</th>
<th>page</th>
<th>deasease</th>
<th>date</th>
<th>did</th>
<th>prescription Link</th>
<th>ProvidedMedicines</th>
</tr>

<c:forEach var="dform" items="${dplist}">
<tr>
<td>${dform.fpid}</td>
<td>${dform.idpx}</td>
<td>${dform.xpname}</td>
<td>${dform.xpage}</td>
<td>${dform.tdisease}</td>
<td>${dform.pdate}</td>
<td>${dform.iddx}</td>
<td>
<a href="${pageContext.request.contextPath}/presfordoc/${dform.idpx}/${dform.iddx}">download this</a>
</td>
<td>
<a href="${pageContext.request.contextPath}/provideddrug/${dform.fpid}">Click To See</a>
</td>
</tr>
</c:forEach>
</table>
</div>
 </div>
     </div>
    </div>	























  <div class="modal" id="recmodal3">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
     <h4 class="modal-title">List Of Active Patient(PUST MC)</h4>
               </div>
   <div class="modal-body">
  <table border="2px"  cellspacing="2px"  padding="2px" >
<p>List of Active Patient</p>
<th>patient id</th>
<th>patient name</th>
<th>kNOCK HIM</th>
<c:forEach var="ac" items="${acss}">
<tr>
<td>${ac.person_id}</td>
<td>${ac.name}</td>
<td><a href="${pageContext.request.contextPath}/ChatDescision?operation=chatActivePatient&pid=${ac.person_id}&aid=${aid}"></a></td>
</c:forEach>
</table>
   </div>
 </div>
     </div>
    </div>	





<div background-color="red">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<ul class="list-group">
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=listofpatient&did=${aid}" id="show2"><span  class="btn btn-primary">See list of patient who have knocked you</span></a>
<div  id="modbtn" style="display:none;">
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#recmodal">Knocking Patient</button>
</div></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=listofprescribedpatient&did=${aid}"><span  class="btn btn-secondary">See Record of prescription</span></a>
<div  id="modbtn2" style="display:none;">
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#recmodal2">Prescription record</button>
</div>


</li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=priviousrecord&did=${aid}" id="show1"><span  class="btn btn-success">list of active patient</span></a>

<div  id="modbtn3" style="display:none;">
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#recmodal3">Active list of patient</button>
</div>

</li>
<li class="list-group-item"><span class="btn btn-secondary">
   <form action="${pageContext.request.contextPath}/search" method="get">  
   <i class="fa fa-search"></i>  <input type="text" name="pid" />            
   <input type="submit" name="submit"/>
   </form>
   Search A patient record  <button class="btn btn-outline-secondary border-left-0 rounded-0 rounded-right" type="button"></button>
</li>

</ul></div>
<div class="col-md-3"></div>


</div>
</div>
</body>
</html>