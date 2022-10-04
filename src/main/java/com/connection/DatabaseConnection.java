package com.connection;

import org.apache.commons.dbcp.BasicDataSource;
import java.security.SecureRandom;
import java.sql.*;
import java.util.Random;

public class DatabaseConnection {
	static Connection con;

	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://10.42.0.176:3306/module_1?allowPublicKeyRetrieval=true&useSSL=false", "monty", "sexy");
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			con = getConnection();
			rs = con.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static void insertUpdateFromSqlQuery(String SqlQueryString) {
		try {
			if (con == null) {
				getConnection();
			}
			con.createStatement().executeUpdate(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static String randompasswordgeneration() {
		Random RANDOM = new SecureRandom();
		final int PASSWORD_LENGTH = 10;
		String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
		String password = "";
		for (int i = 0; i < PASSWORD_LENGTH; i++) {
			int index = (int) (RANDOM.nextDouble() * letters.length());
			password += letters.substring(index, index + 1);
		}
		return password;
	}
}