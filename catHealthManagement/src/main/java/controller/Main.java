package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		System.out.println(userId);
		System.out.println(pass);
		if((userId != null && userId.length() > 0) && (pass != null && pass.length() > 0)) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/main.jsp");
			rd.forward(request, response);
			
		}else{
			request.setAttribute("errorMsg", "未入力の項目があります");
		
			System.out.println("errorMsgあり");
		
		
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/login.jsp");
			rd.forward(request, response);
		}
	}

}
