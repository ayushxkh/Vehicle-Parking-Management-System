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
<%  
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/module_1", "root", "saks");
Statement st = conn.createStatement();
String useraddress =request.getParameter("useraddress");
String intime =request.getParameter("intime");
String exittime =request.getParameter("exittime");
String cartype =request.getParameter("cartype");
String parkingloc =request.getParameter("parkingloc");
String service =request.getParameter("service");
String username =request.getParameter("username");
String carregno =request.getParameter("carregno");
String email =request.getParameter("email");
String phone =request.getParameter("phone");

int i1 = st.executeUpdate("Insert into da_user_book (useraddress , intime , exittime, cartype,parkingloc,service,username,carregno,email,phone ) values( " + "'" + 
		useraddress + "',"  + "'" + intime + "', " + "'" + exittime + "'," + "'" + cartype  + "'" +  parkingloc + "', " + "'" + service + "'," + "'" + username  +  carregno + "', " + "'" + email + "'," + "'" + phone  +"'" +")");

out.println("<html><meta http-equiv=\"refresh\" \r\n"
		+ "        content=\"5; url = dash_admin_user.jsp\" /><body><b>" + "Inserted</b></body></html>");





%>
</body>
</html>