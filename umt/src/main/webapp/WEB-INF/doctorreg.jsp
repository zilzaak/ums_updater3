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
		 
	
			 	 ajp();
			 	
			
	 });
function ajp(){
		var da = { }
		da["name"] = $("#nam").val();
	
		da["age"] = $("#ag").val();
		da["degree"] = $("#degre").val();
		da["expertint"] = $("#expertin").val(); 
		da["password"] = $("#passwor").val();
		da["day"] = $("#da").val();
	
		da["schedule"] = $("#schedul").val();
	
		da["drphone"] = $("#drphon").val();
		da["msg"] = ("#ms").val();
		
			$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8065/umt/choice/reg",
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

nam:<input type="text"  name="name"  id="nam" />
age:<input type="text"  name="age"   id="ag" /> <br/>
dgree:<input type="text"  name="degree"   id="degre" /> <br/>
<input type="text"  name="expertint"  id="expertin" /> <br/>
<input type="text" name="password"  id="passwor" /> <br/>
<input type="text" name="day"  id="da" /> <br/>
schedule:<input type="text" name="schedule"  id="schedul" /> <br/>
<input type="text" name="msg"  id="ms" /> <br/>
<input type="text" name="drphone"  id="drphon" /> <br/>
<button type="submit" class="btn btn-success btn-md">post</button>

</form>
</div>
</body>
</html>