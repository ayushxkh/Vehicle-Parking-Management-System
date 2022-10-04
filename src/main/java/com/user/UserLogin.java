package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			String tokens = UUID.randomUUID().toString();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet resultset = st.executeQuery("select * from tbluser where uname='" + uname + "' AND password='" + pass + "'");
			if (resultset.next()) {
				String fullName=resultset.getString(2);
				hs.setAttribute("uname", uname);
				hs.setAttribute("fullName", fullName);
				hs.setAttribute("mobileNo", resultset.getString(3));
				response.sendRedirect("user-dashboard.jsp?_tokens='" + tokens + "'");
			} else {
				String message = "Invalid credential";
				hs.setAttribute("message", message);
				response.sendRedirect("user-login.jsp");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
