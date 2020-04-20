<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">


<script type="text/javascript">

 jQuery(document).ready(function($){
	 $("#sform").submit(function(event){
		 event.preventDefault();
		 
			 	 ajp();
			 	
			
	 });
function ajp(){
		var da = { };
		da["name"] = $("#name").val();
		da["age"] = $("#age").val();
		da["degree"] = $("#degree").val();
		da["expertint"] = $("#expertint").val(); 
		da["password"] = $("#password").val();
		da["day"] = $("#day").val();
		da["schedule"] = $("#schedule").val();
		da["drphone"] = $("#drphone").val();
		da["msg"] = ("#msg").val();
		
			$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "${pageContext.request.contextPath}/docreg",
			data: JSON.stringify(da),
			dataType: 'json',
			success: function(dr){
				alert("sssss")	;	
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

<div>
<form id="sform" >

<input type="text" name="name"  id="name" />
<input type="text" name="age"   id="age" />
<input type="text" name="degree"   id="degree" />
<input type="text" name="expertint"  id="expertint" />
<input type="text" name="password"  id="password" />
<input type="text" name="day"  id="day" />
<input type="text" name="schedule"  id="schedule" />
<input type="text" name="msg"  id="msg" />
<input type="text" name="drphone"  id="drphone" />
<button type="submit" class="btn btn-success btn-md">post</button>

</form>
</div>
</body>
</html>