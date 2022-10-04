package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class OtpSubmit
 */
//@WebServlet("/OtpSubmit")
public class OtpSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String otp_val=(String)request.getParameter("otp_value");
		
		PrintWriter out = response.getWriter();
		
		
		
		HttpSession ses = request.getSession();
		String mob_number= (String) ses.getAttribute("Number");
		String session_id=(String)ses.getAttribute("session_id");
		
		HttpClient client = HttpClient.newHttpClient();
        HttpRequest req = HttpRequest.newBuilder()
                .uri(URI.create("https://2factor.in/API/V1/bd56413d-5504-11ec-b710-0200cd936042/SMS/VERIFY/"+ session_id+"/"+otp_val))
                .build();

        HttpResponse<String> res;
		try {
			res = client.send(req,
			        HttpResponse.BodyHandlers.ofString());
			
			String jsonString=res.body();
			JSONObject obj = new JSONObject(jsonString);
			String status = obj.getString("Status");
			System.out.println(status);
			
			if(status.equals("Success"))
			{
				response.sendRedirect("/Project/reg_con.jsp");
			}
			else {
//				Cookie coo=new Cookie("wrong_otp","true");
//				response.addCookie(coo);
				response.sendRedirect("/Project/SubmitOtp.jsp");
				
			}
			
			
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
