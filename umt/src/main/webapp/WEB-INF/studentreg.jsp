<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery340.js" />" > </script>
<script src="<c:url value="/static/theme/popper114.js" />"></script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>

</head>
<body style="background-color:maroon;" >

<div align="center">
<p style="color:white;">PATIENT registration form</p>
<p style="color:white;"> enter your information</p> <br/>
  <p style="color:white;"> ${sms}</p>
  <div  style="height:400px;margin-left:250px;margin-right:250px;margin-bottom:250px;background-color:darkcyan;border:8px solid;">
   <form action="regstudent" method="get" modelAttribute="Student">
<div align="center">
<div  style="height:45px;margin-left:50px;margin-right:50px;margin-top:50px;" >
<input type="text" placeholder="name" class="form-control"   name="name"/> </div>
<div>
<div   style="height:45px;margin-left:50px;margin-right:50px;margin-top:50px;">
<input type="text" placeholder="email" class="form-control"  name="email" /> </div>

<div  style="height:45px;margin-left:50px;margin-right:50px;margin-top:50px;">
<input type="password" placeholder="password" class="form-control"  name="password"/> </div>


<input type="hidden" class="form-control"  name="dept" value="cse" /> 


<input type="hidden" class="form-control"  name="roll" value="140136" /> 

 </div>




   <br/>
   <input type="submit" name="save"/>
      
   <input type="reset" name="clear"/>
  
</form>
   </div>


</div>
</body>
</html>