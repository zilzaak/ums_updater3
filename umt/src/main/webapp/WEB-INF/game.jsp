<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">  
 <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">

   <script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
  <script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
 jQuery(document).ready(function($){
	 $("#gmform").submit(function(event){
		 event.preventDefault();
		 
		 var data = { }
		 
			data["name"] = $("#nm").val();
			data["age"] = $("#age").val();
			data["day"]= $("#day").val();
			data["schedule"] = $("#sdl").val();
			data["expertin"] = $("#exprt").val();
			data["phone"] = $("#phn").val();
			
			data["degree"] = $("#dg").val();
			data["pass"] = $("#pd").val();
			data["msg"] = "no";
				$.ajax({
				type: "POST",
				contentType: "application/json",
				url: "${pageContext.request.contextPath}/regex/regadoc",
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(r){
					if(r.msg=="yes"){
						$("#rdv").show();
						$("#pn").text(r.name);	
						$("#gn").text("you have regestered succesfully");	
						$("#d").text("upload photo to 100% complete");
					}
					else{
						
					alert("this username or password exist");
					}	
					
			   },
			        	
				error: function(e){
					alert("fail to post");
				    }
				
				});			
 });
	 
 });
		
		

 </script>
</head>
<body>
<div class="container">
<div class="row">

<div class="col-4" style="margin-top:50px;">

<form  id="gmform" style="height:200px;">
<table style="border:2px solid;">
<tr>
<td><input type="text" placeholder="name"  name="name" id="nm"/><td> 
</tr>
<tr>
<td> <input type="text" placeholder="age"   name="age" id="age" /> </td>
</tr>
<tr>
<td> <input type="text" placeholder="phone"  name="phone" id="phn" /></td>
</tr>
<tr>
<td>  <input type="text" placeholder="days"   name="day" id="day"/> </td>
</tr>
<tr>
<td> <input type="text" placeholder="schedule"   name="schedule" id="sdl" /></td>
</tr>
<tr>
<td> <input type="text" placeholder="degree"   name="degree" id="dg" /></td>
</tr>
<tr>
<td>  <input type="password" placeholder="password"  name="pass" id="pd" /></td>
</tr>

<tr>
<td><button type="submit" class="btn btn-success">post</button></td>
</tr>

</table>

</form>
</div>
<div class="col-4"  style="margin-top:100px;"  id="rdv" style="display:none;">

 <b> <span id="pn"></span></b> <br/>
 <b><span id="gn"></span></b> <br/>
 <b><span id="an"></span> </b><br/>
 <a id="d" href="${pageContext.request.contextPath}/choicebyHref/afterregdoctor"></a>
</div>
<div class="col-4"  >


</div>

</div>
</div>


</body>
</html>