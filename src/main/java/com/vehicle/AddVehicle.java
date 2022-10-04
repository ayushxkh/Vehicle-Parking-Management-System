package com.vehicle;

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

import java.util.Random;

/**
 * Servlet implementation class AddVehicle
 */
@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Random rand = new Random();
		int ParkingNumber = rand.nextInt(9000000) + 1000000;
		HttpSession hs = request.getSession();
		System.out.println("ParkingNumber        " + ParkingNumber);
		String catename = request.getParameter("catename");
		String vehcomp = request.getParameter("vehcomp");
		String vehreno = request.getParameter("vehreno");
		String ownername = request.getParameter("ownername");
		String ownercontno = request.getParameter("ownercontno");
		int parking_seat = 0;
		int addVehicle = 0;
		String status = "";
		int count = 0;
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet total_parking_seat_result = statement.executeQuery("select * from tblParkingSeatCapacity");
			if (total_parking_seat_result.next()) {
				parking_seat = total_parking_seat_result.getInt(1);
			}
			ResultSet resultSet = statement.executeQuery("select count(*) from tblvehicle where status=''");
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (parking_seat > count) {
				addVehicle = statement.executeUpdate(
						"insert into tblvehicle(ParkingNumber,VehicleCategory,VehicleCompanyname,RegistrationNumber,OwnerName,OwnerContactNumber,status)values('"
								+ ParkingNumber + "','" + catename + "','" + vehcomp + "','" + vehreno + "','"
								+ ownername + "','" + ownercontno + "','" + status + "')");
			} else {
				String message = "Parking slot is full, Wait for sometimes";
				hs.setAttribute("message", message);
				response.sendRedirect("add-vehicle.jsp");
			}
			if (addVehicle > 0) {
				response.sendRedirect("add-vehicle.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
