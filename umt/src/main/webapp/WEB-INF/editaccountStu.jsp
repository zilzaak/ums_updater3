<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body style="background-color:green; top-border:500px">
<div align="center"  style="background-color:violet;">
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("username")==null && session.getAttribute("password")==null){
	response.sendRedirect("http://localhost:8017/text1/");
	}
%>
 your edited data are
          Name is : ${st.name} ;
         Department: ${st.dept}  ;
         Roll : ${st.roll} ;
         password : ${st.password} 
<p color="black" >edit your account by changing your username and password</p>
<form action="finaleditStu" method="post" modelAttribute="Student">
enter id: <input type="text" name="sid" /> 
 <br/>
enter name: <input type="text" name="name" /> 
<br/>
enter dept: <input type="text" name="dept" /> 
<br/>
enter roll : <input type="text" name="roll" /> 
<br/>
enter password: <input type="text" name="password" />
enter email: <input type="text" name="email" />
 <br/>
 submit : <input type="submit" name="submit" />
<br/>

</form>
</div>


</body>
</html>