<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(request.getSession().getAttribute("sname")==null && request.getSession().getAttribute("spass")==null){
	response.sendRedirect("${pageContext.request.contextPath}/pharmacy.jsp");
}
%>

in the order medicine page while your pas and username is wrong
</body>
</html>