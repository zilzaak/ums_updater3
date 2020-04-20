<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>

<script type="text/javascript">

 jQuery(document).ready(function($){
	 
	 $("#aform").submit(function(event){
		 event.preventDefault();
	
			 	 calltaj();
			   });
	 
function calltaj(){
		var x = { }
		

		x["nameofp"] = $("#nameofp").val();
		x["testname"] = $("#testname").val();
		x["idofd"] = $("#idofd").val();
		x["idofp"] = $("#idofp").val();
		x["date"] = $("#date").val();
	
			$.ajax({
				type: "POST",
			contentType: "application/json",
			url: "${pageContext.request.contextPath}/givetest",
			data : JSON.stringify(x),
			dataType: 'json',
			success: function(g){
				$("#divshow").show();
				 		$("#tn").text(g.testname);$("#pn").text(g.nameofp);
				 		$("#dt").text(g.date);$("#idd").text(g.idofd);
				 		$("#idp").text(g.idofp);
			               },
			                error: function(e){
			               	alert("fail to post");
			                }	
			});	
		}	 
 });

 </script>
  
</head>
<body>

<div align="center">

<form id="aform">
<table>
<tr>
<td>
 <input type="hidden"    name="idofp" id="idofp" value="${accepter}" /> </td>
</tr>
<tr>
<td>
 <input type="hidden"    name="idofd" id="idofd" value="${giver}" /> </td>
</tr>

<tr>
<td>patient name:</td>
<td> <input type="text"   name="nameofp" id="nameofp"  /> </td>
</tr>
<tr>
<td>testname</td>
<td> <input type="text"   name="testname"  id="testname"/> </td>
</tr>
<tr>
<td>date</td>
<td>
 <input type="text"    name="date" id="date" /> </td>
</tr>
<tr>
<td> <button  type="submit" class="btn btn-success">POST</button> </td>
</tr>
</table>
</form>

 </div>
 
<div id="divshow" align="center" style="display:none;">
test name: <b><span id="tn"></span></b><br/>
date:<b><span id="dt"></span></b><br/>
patient name: <b><span id="pn"></span></b><br/>
doctor id :  <b><span id="idp"></span></b><br/>
patient id : <b><span id="idd"></span></b><br/>
</div>
</body>
</html>