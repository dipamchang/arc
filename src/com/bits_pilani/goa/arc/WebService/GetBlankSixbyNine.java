package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetBlankSixbyNine
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/GetBlankSixbyNine")
public class GetBlankSixbyNine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetBlankSixbyNine() {
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

		String htmlData = "<table class='ui celled definition table'> <thead> <tr> <th></th> <th>8 AM</th> <th>9 AM</th> <th>10 AM</th> <th>11 AM</th> <th>12 AM</th> <th>1 PM</th> <th>2 PM</th> <th>3 PM</th> <th>4 PM</th> <th>5 PM</th> </tr> </thead> <tbody> <tr> <td>Monday</td> <td id='M8'></td> <td id='M9'></td> <td id='M10'></td> <td id='M11'></td> <td id='M12'></td> <td id='M13'></td> <td id='M14'></td> <td id='M15'></td> <td id='M16'></td> <td id='M17'></td> </tr> <tr> <td>Tuesday</td> <td id='T8'></td> <td id='T9'></td> <td id='T10'></td> <td id='T11'></td> <td id='T12'></td> <td id='T13'></td> <td id='T14'></td> <td id='T15'></td> <td id='T16'></td> <td id='T17'></td> </tr> <tr> <td>Wednesday</td> <td id='W8'></td> <td id='W9'></td> <td id='W10'></td> <td id='W11'></td> <td id='W12'></td> <td id='W13'></td> <td id='W14'></td> <td id='W15'></td> <td id='W16'></td> <td id='W17'></td> </tr> <tr> <td>Thursday</td> <td id='Th8'></td> <td id='Th9'></td> <td id='Th10'></td> <td id='Th11'></td> <td id='Th12'></td> <td id='Th13'></td> <td id='Th14'></td> <td id='Th15'></td> <td id='Th16'></td> <td id='Th17'></td> </tr> <tr> <td>Friday</td> <td id='F8'></td> <td id='F9'></td> <td id='F10'></td> <td id='F11'></td> <td id='F12'></td> <td id='F13'></td> <td id='F14'></td> <td id='F15'></td> <td id='F16'></td> <td id='F17'></td> </tr> <tr> <td>Saturday</td> <td id='S8'></td> <td id='S9'></td> <td id='S10'></td> <td id='S11'></td> <td id='S12'></td> <td id='S13'></td> <td id='S14'></td> <td id='S15'></td> <td id='S16'></td> <td id='S17'></td> </tr> </tbody> </table>";
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(htmlData);
	}
}
