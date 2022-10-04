package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import com.mysql.cj.Session;

/**
 * Servlet implementation class AdminUpdateDetails
 */
@WebServlet("/AdminUpdateDetails")
public class AdminUpdateDetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("adminname");
		String mobile = request.getParameter("contactnumber");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int updateinfo = statement.executeUpdate("update tbladmin set adminName='" + name + "',mobilenumber='" + mobile+ "',email='" + email + "' where username='" + session.getAttribute("uname") + "'");
			if (updateinfo > 0) {
				String message = "Profile updated sucessfully.";
				session.setAttribute("message", message);
				response.sendRedirect("admin-profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
