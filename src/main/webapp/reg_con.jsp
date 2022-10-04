+<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*"%>
<%@ page import ="jakarta.servlet.http.HttpSession" %>
<%  

HttpSession ses=request.getSession();



String firstname =(String)ses.getAttribute("firstname");
String lastname =(String)ses.getAttribute("lastname");
String username =(String)ses.getAttribute("username");
String password =(String)ses.getAttribute("password");
String confirm_password =(String)ses.getAttribute("confirm_password");
String residential =(String)ses.getAttribute("residential");
String email =(String)ses.getAttribute("email");
String mob =(String)ses.getAttribute("mob");
String car_reg =(String)ses.getAttribute("car_reg");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/module_1","root","saks");
	PreparedStatement ps = conn.prepareStatement("insert into use_registration(firstname,lastname,username,password,confirm_password,residential,email,mob,car_reg) values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,username);
	ps.setString(4,password);
	ps.setString(5,confirm_password);
	ps.setString(6,residential);
	ps.setString(7,email);
	ps.setString(8,mob);
	ps.setString(9,car_reg);
	
	int x = ps.executeUpdate();
	if(x>0)
	{
		response.sendRedirect("login_user.html");
	}
	else
	{
		out.println("maa chuda");
	}
	
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>