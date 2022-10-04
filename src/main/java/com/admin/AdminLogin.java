package com.admin;

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

import com.admin.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			String tokens = UUID.randomUUID().toString();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet resultset = st.executeQuery("select * from tbladmin where username='" + uname + "' AND password='" + pass + "'");
			if (resultset.next()) {
				hs.setAttribute("uname", uname);
				response.sendRedirect("dashboard.jsp?_tokens='" + tokens + "'");
			} else {
				response.sendRedirect("admin-login.jsp");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
