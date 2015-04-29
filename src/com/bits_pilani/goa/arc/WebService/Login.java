package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bits_pilani.goa.arc.Dao.Credentials;

/**
 * Servlet implementation class Login
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Credentials getInfo = new Credentials();
		String[] db_cred = getInfo.getPassword(username).split(",");
		String db_pass = db_cred[0];
		String db_name = db_cred[1];
		if(password.equals(db_pass)){
			HttpSession session = request.getSession();
			session.setAttribute("LOGIN_USER",username);
			session.setAttribute("NAME",db_name);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("OK");

		}
		else {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Invalid Username/Password. Please Try Again.");
		}
	}

}
