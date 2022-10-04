<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Otp Submit</title>
<style>
  
    body {
    background-image: url('https://i.pinimg.com/originals/af/b5/63/afb5631f2111b342feb1a378979dfb75.jpg');}
    h1 {text-align: center;}
    p {text-align: center;}
    form {text-align: center;}
div {text-align: center;}
input[type=button], input[type=submit],
input[type=reset] {
  background-color: #6d11dd;
  border: none;
  color: rgb(243, 236, 242);
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;}
  }
  </style>
</head>
<body>
<%-- <% --%>


<%-- %> --%>
<!-- 	Wrong OTP Try Again -->
	
<%-- 	<% --%>

<%-- 	%> --%>


<h1>Submit Otp</h1>
<p>Please submit the otp you received!</p>
<form action="OtpSubmit" method="post">
<input type="text" name="otp_value" ><br>
<input type="submit"><br>
</form>
</body>
</html>