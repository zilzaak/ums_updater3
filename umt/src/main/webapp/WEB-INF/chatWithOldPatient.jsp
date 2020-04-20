<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<!--   
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
 -->
  <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery.min.321.js" />" > </script> 
   <script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>

<script type="text/javascript">
var op="ok";
function delet(){

	op="delete";
	
}
function addrow(){

	op="addrow";
	
}
function save(){

	op="save";
	
}

function validate(){
	
	if(document.myform.kvl.value=="1" && op=="delete" ){
	     alert("Can not delete row containing single row");
		document.myform.kvl.focus();
		return false;
	}
	if(op=="addrow" ){
		
	
		return true;
	}
	if(op=="save" ){
		
		
		return true;
	}
	
	else{
		return(true);	
	}	

}
</script>
</head>
<div align="center" style="background-color:burlywood;">
<h1>make conversation with patient</h1> 
<form action="${pageContext.request.contextPath}/smstostud" method="post" >
 <input type="hidden" name="aid" value=${myaid} /> <br/>
 <input type="hidden" name="sid" value=${mypid}  /> <br/>
type sms: <input type="text" name="pssms"/> <br/>
send: <input type="submit" name="send"/> <br/>
clear: <input type="reset" name="reset"/>
</form>
</div>
<div align="center" style="height:100px;margin-top:20px;">

<a href="${pageContext.request.contextPath}/testcon/${myaid}/${mypid}"><span class="btn btn-success">Suggest this patient for Medical test</span></a> <br/><br/>
<a href="${pageContext.request.contextPath}/testrecord/${myaid}"><span class="btn btn-success">Record of ProvidedMedical Test</span></a>
</div>
<div align="center" style="background-color:aquamarine;">
<h2>Prescribe This Patient</h2>
<form:form method="post" action="${pageContext.request.contextPath}/updateprescription" modelAttribute="Fpdoct" name="myform" onsubmit="return(validate());" >

<div class="table-responsive">
  <table class="table">
    	<tr>
		<th>patientName</th>
		<th>age</th>
		<th>DiseaseType</th>		
		</tr>
	<tr>
<td><input type="text" name="xpname" value="${dpform.xpname}" /> </td>
<td><input type="text" name="xpage"  value="${dpform.xpage}" /> </td>
<td><input type="text" name="tdisease" value="${dpform.tdisease}"  /></td>
<td><input type="hidden" name="iddx" value="${dpform.iddx}"  />  </td>
<td><input type="hidden" name="idpx"  value="${dpform.idpx}"  /> </td>
<td><input type="hidden" name="pdate"  value="${dpform.pdate}" /> </td>
</tr>
	
  </table>
</div>

<table border="1">	   
 <tr>
		<th>No</th>
		<th>MedicineName</th>
		<th>Schedule Of take</th>
		<th>condition</th>
		<th>duration</th>
	</tr>
	<c:forEach items="${dpform.dlist}" var="drug" varStatus="status">
		<tr>
		<td align="center">${status.count}</td>
		<td><input type="text" name="dlist[${status.index}].ndrug" value="${drug.ndrug}" /></td>
<td>
<input type="text" name="dlist[${status.index}].sdrug" value="${drug.sdrug}" />
 </td>
<td>
<input type="text" name="dlist[${status.index}].cdrug" value="${drug.cdrug}" />
 </td>					
		<td>
<input type="text" name="dlist[${status.index}].ddrug" value="${drug.ddrug}"  />
	</td>
	    
	    <td><input type="hidden" id="cn" name="kvl" value="${status.count}"/></td>
		</tr>
	</c:forEach>
</table>	
<br/>
Post Now:<input type="submit" name="operation" value="Save"  onclick="save();"/>
addrow:<input type="submit" name="operation" value="addrow"  onclick="addrow();"/>
Remove Row:<input type="submit" name="operation"  onclick="delet();" id="delete" value="remove" />	
</form:form>
</div>
<br/>
<br/>
<div background-color="red">
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4">
<ul class="list-group">
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=listofpatient&did=${aid}"><span  class="btn btn-primary">See list of patient who have knocked you</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=listofprescribedpatient&did=${aid}"><span  class="btn btn-secondary">See Record of patient whom you have prescribed</span></a></li>
<li class="list-group-item"><a href="${pageContext.request.contextPath}/doctorsquery?dq=priviousrecord&did=${aid}" ><span  class="btn btn-success">list of active patient  who are now  online</span></a></li>
<li class="list-group-item"><span class="btn btn-secondary">
      <form action="${pageContext.request.contextPath}/search" method="get">  
      <i class="fa fa-search"></i>  <input type="text" name="pid" />            
   <input type="submit" name="submit"/>
   </form>
   Search A patient record  <button class="btn btn-outline-secondary border-left-0 rounded-0 rounded-right" type="button"></button>
</li>
</ul></div>
<div class="col-md-4"></div>
</div>

</body>
</html>