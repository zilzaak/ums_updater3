<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<h1>Doctor Acount edition</h1>
<div align="center">

<body style="background-color:pink;">
<%
if(session.getAttribute("Dusername")==null && session.getAttribute("Dpassword")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
}
%>           <h3>Edit profile of doctor_id: ${aid}  </h3>
            <h3 style="color:red;">${notyourprofile}</h3>
   your edited data are: ${dr.name}
         degree is ${dr.degree}
         age is : ${dr.age} 
          expert in : ${dr.expertint}
<p color="black" >edit your account by giving exact username and password</p>
<form action="finaleditDoc" method="post" modelAttribute="Doctor">
your id:<input type="text" name="did" /> <br/>
your username:<input type="text" name="name"/> <br/>
your degree:<input type="text" name="degree"/> <br/>
your age:<input type="text" name="age"/> <br/>
your phone:<input type="text" name="drphone"/> <br/>
expert in<input type="text" name="expertint"/> <br/>
password:<input type="text" name="password"/> <br/>
schedule:<input type="text" name="schedule"/> <br/>
<input type="submit" name="submit"/>
</form>
</div>
</body>
</html>