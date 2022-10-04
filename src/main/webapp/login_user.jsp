<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.net.URL,java.net.URLEncoder,javax.net.ssl.HttpsURLConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/module_1", "root", "saks");
Statement st = conn.createStatement();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	request.getSession().setAttribute("USERNAME_VIA_LOGIN", username);
	
	HttpSession ses =request.getSession();
	
	
	
	ses.setAttribute("firstname",request.getParameter("firstname"));
	ses.setAttribute("lastname",request.getParameter("lastname"));
	ses.setAttribute("username",request.getParameter("username"));
	ses.setAttribute("password",request.getParameter("password"));
	ses.setAttribute("confirm_password",request.getParameter("confirm_password"));
	ses.setAttribute("residential",request.getParameter("residential"));
	ses.setAttribute("email",request.getParameter("email"));
	ses.setAttribute("mob",request.getParameter("mob"));
	ses.setAttribute("car_reg",request.getParameter("car_reg"));
	ses.setAttribute("uname",request.getParameter("username"));
	
	
	
	
	ResultSet i = st.executeQuery(
			"SELECT * from use_registration WHERE username = " + "'" + username + "'" + " and " + "password = " + "'" + password + "'");
	
	if(i.next())
	{
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = dash_user.html\" /><body><b>Logged In" + "</b></body></html>");
	}
	else 
	{
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = login_user.html\" /><body><b>" + "Wrong Credential</b></body></html>");
	}
%>
</body>
</html>