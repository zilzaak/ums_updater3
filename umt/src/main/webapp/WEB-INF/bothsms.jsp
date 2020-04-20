<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:gray">
<div style="margin-left:250px;margin-right:250px;">
Patient message:
<div align="center", style="background-color:lightsteelblue; width:350px ; height:160px;">
   ${studsms}
</div>
<br/>
<br/>
<br/>
   Doctors sms: 
<div align="center" style="background-color:darkkhaki; width:350px;height:160px;" >

   
   ${pssms}
</div>
Doctors id : ${selecteddid}

patient id:${selectedpid}
</div>
</body>
</html>