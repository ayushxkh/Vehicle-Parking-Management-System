<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String email   = request.getParameter("WorkerEmailRemove");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/userdb", "root", "saks");
	Statement st = conn.createStatement();
	
	Statement st1 = conn.createStatement();
		int i1 = st.executeUpdate(
				"Delete from da_admin_worker where email = " + "'" + email + "'"  );
		
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = dash_admin_worker.jsp\" /><body><b>Done" + "</b></body></html>");
	
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>
© 2021 GitHub, Inc.