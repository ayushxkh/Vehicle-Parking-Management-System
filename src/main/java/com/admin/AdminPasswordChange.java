package com.admin;

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
import com.connection.*;
/**
 * Servlet implementation class AdminPasswordChange
 */
@WebServlet("/AdminPasswordChange")
public class AdminPasswordChange extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select password from tbladmin where password='" + cpassword+ "' and username='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					int i = statement.executeUpdate("update tbladmin set password='" + password + "' where username='"+ session.getAttribute("uname") + "' ");
					response.sendRedirect("change-password.jsp");
					statement.close();
					con.close();
				} else {	
					response.sendRedirect("change-password.jsp");
				}
			} else {
				response.sendRedirect("change-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
