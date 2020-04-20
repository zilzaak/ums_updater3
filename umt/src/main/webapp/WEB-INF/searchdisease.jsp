<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
 <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
  <script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>


<link href="<c:url value="/static/theme/search2.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/jquery-ui.css" /> " rel="stylesheet"> 
 <script src="<c:url value="/static/theme/jquery224.js" />" > </script>   
  <script src="<c:url value="/static/theme/jquery-ui.js" />" > </script> 

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  rel="stylesheet" type="text/css" href="">
	<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
<style>

</style>
</head>
<body>
<script>
	$(function() {
		$("#searchBox").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "${pageContext.request.contextPath}/getdoctor",
					dataType : "json",
					data : {
						q : request.term
					},
					success : function(data) {
						//alert(data);
						console.log(data);
						response(data);
					}
 				});
			},
			minLength : 2
		});
	});
</script>
<div style="width: 600px; margin: auto;">
		<h3>Search a doctor typing the  disease name</h3>
		<fieldset>
			<legend>Search Here</legend>
			<p>
			<form action="${pageContext.request.contextPath}/drbydis" method="get">
				<input type="text" name="disname" id="searchBox"
					style="width: 560px; margin: auto;" />
					<button type="submit"  ><span class="btn btn-success">search</span></button>
			
			</form>
			
			</p>
		</fieldset>
	</div>
	<br/><br/>
	<div align="center">
	<table>
	<tr>
	<th>Doctor name</th>
	<th> age</th>
	<th>Expert In</th>
	<th>Schedule</th>
	<th>Phone</th>
	<th>Meet Him</th>
	</tr>
		<c:forEach  var="dr" items="${dlist}">
		<tr>
<td>${dr.name}</td>
<td>${dr.age}</td>
<td>${dr.expertint}</td>
<td>${dr.schedule}</td>
<td>${dr.drphone}</td>
<td><a href="${pageContext.request.contextPath}/godoctorprofile?gdid=${dr.did}&gsid=${sid}"><span class="btn btn-success">go his profile</span></a></td>
	</tr>
		</c:forEach>
	
	</table>
	
	
	</div>
</body>
</html>