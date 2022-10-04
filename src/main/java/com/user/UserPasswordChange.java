package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserPasswordChange
 */
@WebServlet("/UserPasswordChange")
public class UserPasswordChange extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select password from tbluser where password='" + cpassword+ "' and uname='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					int i = statement.executeUpdate("update tbluser set password='" + password + "' where uname='"+ session.getAttribute("uname") + "' ");
					response.sendRedirect("change-user-password.jsp");
					statement.close();
					con.close();
				} else {	
					response.sendRedirect("change-user-password.jsp");
				}
			} else {
				response.sendRedirect("change-user-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
