<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center" style="background-color:coral;">

Admin login :
<div><form action="pharmacyAdmin" method="post">
 admin name:<input type="text" name="adminname"/> <br/>
admin password:<input type="password" name="adminpass"/><br/>
<input type="submit" name="submit" value="login"/><br/>
</form>
</div>
<div align="center">
 ${sms}
To Order Medicine enetr your Student id and password <br/>
  <form action="ordermedicine" method="post">
  student name:<input type="text" name="sname"/><br/>
  student password:<input type="password" name="spass"/><br/>
  login:<input type="submit" name="submit"/><br/>
  
    </form>
</div>
</body>
</html>