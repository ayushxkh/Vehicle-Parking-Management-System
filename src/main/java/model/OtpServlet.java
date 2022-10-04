package model;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.json.JSONObject;

/**
 * Servlet implementation class OtpServlet
 */
//@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		HttpSession ses = request.getSession();
		String mob_number= request.getParameter("mob");
		
		
		
		
		
		
		ses.setAttribute("firstname",request.getParameter("firstname"));
		ses.setAttribute("lastname",request.getParameter("lastname"));
		ses.setAttribute("username",request.getParameter("username"));
		ses.setAttribute("password",request.getParameter("password"));
		ses.setAttribute("confirm_password",request.getParameter("confirm_password"));
		ses.setAttribute("residential",request.getParameter("residential"));
		ses.setAttribute("email",request.getParameter("email"));
		ses.setAttribute("mob",request.getParameter("mob"));
		ses.setAttribute("car_reg",request.getParameter("car_reg"));
		ses.setAttribute("uname",request.getParameter("username"));
		
		
		
		System.out.println("IN OTP SERVLET");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		System.out.println(mob_number);
		HttpClient client = HttpClient.newHttpClient();
        HttpRequest req = HttpRequest.newBuilder()
                .uri(URI.create("https://2factor.in/API/V1/bd56413d-5504-11ec-b710-0200cd936042/SMS/" +mob_number+ "/AUTOGEN"))
                .build();

        HttpResponse<String> res;
        
		try {
			res = client.send(req,
			        HttpResponse.BodyHandlers.ofString());
			
			
			String jsonString =res.body();
			
			JSONObject obj = new JSONObject(jsonString);
			String session_id = obj.getString("Details");
			ses.setAttribute("session_id", session_id);
		
		
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("/Project/SubmitOtp.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
