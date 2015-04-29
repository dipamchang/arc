package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bits_pilani.goa.arc.Dao.Combinations;
import com.bits_pilani.goa.arc.Dao.StudentData;

/**
 * Servlet implementation class StudentRegistration
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentRegistration() {
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
		String comb = request.getParameter("comb");
		Combinations combList = new Combinations();
		Map<String,Integer> cList = combList.getAvailableCombinations(comb);
		int asd = 0;
		if(cList.get(comb) > 0){
			System.out.println("map - " + cList.get(comb) );
			asd = combList.updateAvailability(comb);
			System.out.println("Current Avail = " + asd);
			if(asd==0){
				//Not OK
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("NOK");
				System.out.println("NOK asd = 0 " );
				return;
			}else if (asd == 1){

				StudentData ast = new StudentData();
				HttpSession sess = request.getSession();  String id = (String)sess.getAttribute("LOGIN_USER"); 
				int res = ast.doRegister(comb, id);
				if(res == 1){
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("OK");
					System.out.println("OK asd = 1 " );
					return;
				}else {
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("NOK");
					System.out.println("NOK  " + cList.get(comb) );
					return;
				}
			}
		}
		else {
			//Not Ok
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("NOK");
			System.out.println("NOK  " + cList.get(comb) );
			return;
		}
	}
}
