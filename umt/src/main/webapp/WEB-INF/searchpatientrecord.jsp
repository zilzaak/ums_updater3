<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body onload="fpnll();" >
<script type="text/javascript">
function fpnll(){
var x = document.getElementById("fp").value;
if(x=="yes"){
	$("#pres").hide();
	alert("there  records available ")
}
}

</script>
<input type="hidden" id="fp" value="${nullfpform}"/>
<input type="hidden" id="hp" value="${hidepress}"/>
<div align="center" id="doc">
<table border="2">
	    <tr>
		<th>dr name</th>
		<th>expert in</th>
		<th>phone</th>
		<th>digree</th>
		<th>image</th>
	      </tr>
	
		<tr>
		<td>${doc.name}</td>
		<td>${doc.expertint}</td>
		<td>${doc.drphone}</td>
		<td>${doc.degree}</td>
		<td><img  src="<c:url value="/static/drphoto/${doc.filename }" />"/></td>
	</tr>

</table>
</div>

<br/>
<br/>
<br/>

<div class="table-responsive" align="center" id="pres" style="width:500px;margin-top:350px;margin-left:300px;">
<p>All record of a patient along with the consultation date and his doctor id</p>
<table class="table table-hover" border="1">
	    <tr>
	    <thead class="thead-dark">
		<th>No</th>
		<th>patintName</th>
		<th>age</th>
		<th>disease </th>
		<th>doctor id</th>
		<th>date</th>
		</thead>
	    </tr>
	      <tbody>
	<c:forEach items="${fpform}" var="mdcn" varStatus="status">
		<tr>
		<td align="center">${status.count}</td>
		<td>${mdcn.xpname}</td>
		<td>${mdcn.xpage}</td>
		<td>${mdcn.tdisease}</td>
		<td><a href="${pageContext.request.contextPath}/getdocbyid/${mdcn.iddx}">${mdcn.iddx}</a></td>
		<td>${mdcn.pdate}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

</body>
</html>