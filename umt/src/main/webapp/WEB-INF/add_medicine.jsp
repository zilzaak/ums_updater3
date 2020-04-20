<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Spring 3 MVC Multipe Row Submit - viralpatel.net</title>
</head>
<body>
<script>
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
<div align="center" style="background-color:burlywood;">
<h1>make conversation with patient</h1> 
<form action="smstostud" method="post" >
 <input type="hidden" name="aid" value=${myaid} /> <br/>
 <input type="hidden" name="sid" value=${mypid}  /> <br/>
type sms: <input type="text" name="pssms"/> <br/>
send: <input type="submit" name="send"/> <br/>
clear: <input type="reset" name="reset"/>
</form>
</div>
<div align="center" style="background-color:aquamarine;">
<h2>Prescribe this patient</h2>
<form:form method="post" action="http://localhost:8017/ums/controller2/updatepres" modelAttribute="prescriptionForm" name="myform" onsubmit="return(validate());" >

<div class="table-responsive">
  <table class="table">
    	<tr>
		<th>patientName</th>
		<th>age</th>
		<th>DiseaseType</th>
		<th>sex</th>
		
		</tr>
	<tr>
<td><input type="text" name="patientName" value="${prescriptionForm.patientName}" /></td>
<td><input type="text" name="patient_age" value="${prescriptionForm.patient_age}"/></td>
<td><input type="text" name="diseaseType" value="${prescriptionForm.diseaseType}"  />	</td>
<td><input type="text" name="sex" value="${prescriptionForm.sex}"  />	</td>
<td><input type="hidden" name="patient_id" value=${mypid} /> <br/></td>
<td><input type="hidden" name="doctor_id"  value=${myaid}  /></td>

</tr>
	
  </table>
</div>

<table>	   
 <tr>
		<th>No</th>
		<th>MedicineName</th>
		<th> time to eat</th>
		<th>condition</th>
		<th>duration</th>
	</tr>
	<c:forEach items="${prescriptionForm.mdcns}" var="mdcn" varStatus="status">
		<tr>
		<td align="center">${status.count}</td>
		<td><input type="text" name="mdcns[${status.index}].medicineName" value="${mdcn.medicineName}" /></td>
		<td><input type="text" name="mdcns[${status.index}].scheduleOftakeMedicine" value="${mdcn.scheduleOftakeMedicine}"/></td>
		<td><input type="text" name="mdcns[${status.index}].duration" value="${mdcn.duration}" /></td>
		<td><input type="text" name="mdcns[${status.index}].condition" value="${mdcn.condition}" /></td>
		<td><input type="hidden" id="cn" name="kvl" value="${status.count}"/></td>
		</tr>
	</c:forEach>
</table>	
<br/>
Save:<input type="submit" name="operation" value="Save"  onclick="save();"/>
addrow:<input type="submit" name="operation" value="addrow"  onclick="addrow();"/>
Remove Row:<input type="submit" name="operation"  onclick="delet();" id="delete" value="remove" />	
</form:form>
</div>
</body>
</html>