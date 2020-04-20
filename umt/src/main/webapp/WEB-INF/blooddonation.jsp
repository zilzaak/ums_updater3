<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">  
 <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
  <script src="<c:url value="/static/theme/jquery311.js" />" > </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">

 <script type="text/javascript">
 jQuery(document).ready(function($){
	 $("#submitform").submit(function(event){
		 event.preventDefault();
		 var p = "yes";
		 var x = $("#userid").val();
		 var y = $("#cellno").val();
		 if(isNaN(x)){
		
			$("#sms").show();$("#msg").text("user id can not be string");
			p="not";
		 }
		 if(isNaN(y)){
				p="not";
				$("#sms").show(); $("#msg2").text("phone no can not be string");
			 }
		
		 if(p=="yes"){
			 	 ajp();
			 	 }
			
	 });
function ajp(){
		var data = { }
		data["uname"] = $("#uname").val();
		data["bgroop"] = $("#bgroop").val();
		data["userid"] = $("#userid").val();
		data["cellno"] = $("#cellno").val(); 
		data["user_status"] = $("#user_status").val();
		data["date"] = $("#date").val();
		data["sold"] = "no";
			$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "${pageContext.request.contextPath}/pathtosave",
			data: JSON.stringify(data),
			dataType: 'json',
			success: function(r){
				$("#resultdiv").show();
				$("#un").text(r.uname);$("#bg").text(r.bgroop);$("#ui").text(r.userid);
				$("#us").text(r.user_status);$("#cn").text(r.cellno);$("#d").text(r.date); 		
			},
			error: function(e){
				alert("fail to post");
			}
			
			});	
		}
	 
	 
 });

 </script>

</head>
<body id="bdo">

<div align="center" style="margin-top:50px;">
<b>insert your collected blood record </b>
<div align="center">
 <b>search a blood group</b>
 <input type="text" name="hjhj" />
     <i class="fa fa-search" style="font-size:48px;"> </i>

   </div>  
<form  id="submitform">
<table>
<tr>
<td>name:</td>
<td><input type="text" class="form-control" name="uname" id="uname" /></td></tr>
<tr>
<tr>
<td>date:</td>
<td><input type="date" class="form-control" name="date" id="date"  /></td></tr>
<td>bLood Group:</td>
<td><select  name="bgroop" id="bgroop" class="form-control">
<option value="A(+ve)">A(+ve)</option>
<option value="A(-ve)">A(-ve)</option>
<option value="AB(+ve)">AB(+ve)</option>
<option value="AB(-ve)">AB(-ve)</option>
<option value="B(+ve)">B(+ve)</option>
<option value="B(-ve)">B(-ve)</option>
<option value="O(-ve)">O(-ve)</option>
<option value="O(+ve)">O(+ve)</option>
</select></td></tr>
<tr>
<td>gender:</td>
 <td><select name="user_status" id="user_status">
 <option value="male">male</option>
 <option value="female">female</option>
 </select></td></tr>
<tr>
<td>User Id:</td>
<td><input type="text" class="form-control" name="userid" id="userid"  /></td></tr>
<tr>
<td>Phone No:</td>
 <td><input type="text" class="form-control" name="cellno" id="cellno" /></td></tr>


<br/>
<tr>
<td>save the data:</td>
<td><button  type="submit" class="btn btn-success btn-md">Submit</button></td></tr>
</table>
</form>
</div>

<div align="center" style="display:none;" id="sms">
<span id="msg" style="background-color:red"></span> <br/>
<span id="msg2" style="background-color:red"></span>
</div>
<div align="center" id="resultdiv" style="display:none;">
<h3> your inserted record:</h3>
name : <b><span id="un"></span></b> <br/>
blood group: <b><span id="bg"></span></b> <br/>
gender  : <b><span id="us"></span></b> <br/>
cell no: <b><span id="cn"></span></b> <br/>
date : <b><span id="d"></span></b> <br/>
user id: <b><span id="ui"></span></b> <br/>
</div>
</body>
</html>







