<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/static/theme/bootstrap334.min.css"/> "rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" />" rel="stylesheet">
<script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap334.min.js" />" > </script>
<link href="<c:url value="/static/theme/search2.css" />" rel="stylesheet">
<link href="<c:url value="/static/theme/jquery-ui.css" /> " rel="stylesheet"> 
<script src="<c:url value="/static/theme/jquery224.js" />" > </script>  
<script src="<c:url value="/static/theme/jquery.min.321.js" />"> </script>  
<script src="<c:url value="/static/theme/jquery-ui.js" />" > </script> 
<script src="<c:url value="/static/theme/bootstrap334.min.js" />" > </script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  rel="stylesheet" type="text/css" href="">
	<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
	<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">
<style>
fieldset {
border:2px solid green

}

legend{
padding:0.2em 0.5em;
border:1px solid green;
color:green;
font-size:90%;
text-align:center;

}
</style>
</head>
<body class="bd2">

<script type="text/javascript">
$(document).ready(function(){

	$("#u").click(function(){
		
		$(this).css("background-color","gray");
			
		});
	$("#p").click(function(){
		$(this).css("background-color","gray");
	});
		
})

</script>
	
<br/><br/><br/>
<div id="login" align="center" style="margin-left:250px;margin-right:250px;margin-top:140px;"> 

<form action="${pageContext.request.contextPath}/studentlogin" method="post" >
<fieldset>
<legend align="center">user login </legend>
<label for="user">username</label>
<input type="text" name="user"  id="u"/><br/><br/>
<label for="pass">password</label>
<input type="password" name="pass" id="p"/><br/><br/>

<button type="submit" id="login">submit</button>
</fieldset>

</form>
</div>


     
            
</body>
</html>