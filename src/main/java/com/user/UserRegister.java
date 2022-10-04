package com.user;

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

/**
 * Servlet implementation class UserRegister
 */
//@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addVehicle = statement.executeUpdate("insert into tbluser(fullname,mobile,email,address,uname,password)values('"
							+ fullname + "','" + mobile + "','" + email + "','" + address + "','" + username
							+ "','" + password + "')");
			if (addVehicle > 0) {
				String message = "User register successfully, Please login.";
				hs.setAttribute("message", message);
				response.sendRedirect("user-register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
