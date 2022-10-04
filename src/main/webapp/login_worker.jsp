<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
if (username.equals("worker")&&password.equals("worker"))
{
	response.sendRedirect("dash_worker.html");
}else
{
	response.sendRedirect("login_admin.html");
}
%>
</body>
</html>