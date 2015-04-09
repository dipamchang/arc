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
		
		String htmlData = "<table class='ui celled definition table'> <thead> <tr> <th></th> <th>8 AM</th> <th>9 AM</th> <th>10 AM</th> <th>11 AM</th> <th>12 AM</th> <th>1 PM</th> <th>2 PM</th> <th>3 PM</th> <th>4 PM</th> <th>5 PM</th> </tr> </thead> <tbody> <tr> <td>Monday</td> <td id='monday8'></td> <td id='monday9'></td> <td id='monday10'></td> <td id='monday11'></td> <td id='monday12'></td> <td id='monday13'></td> <td id='monday14'></td> <td id='monday15'></td> <td id='monday16'></td> <td id='monday17'></td> </tr> <tr> <td>Tuesday</td> <td id='tuesday8'></td> <td id='tuesday9'></td> <td id='tuesday10'></td> <td id='tuesday11'></td> <td id='tuesday12'></td> <td id='tuesday13'></td> <td id='tuesday14'></td> <td id='tuesday15'></td> <td id='tuesday16'></td> <td id='tuesday17'></td> </tr> <tr> <td>Wednesday</td> <td id='wednesday8'></td> <td id='wednesday9'></td> <td id='wednesday10'></td> <td id='wednesday11'></td> <td id='wednesday12'></td> <td id='wednesday13'></td> <td id='wednesday14'></td> <td id='wednesday15'></td> <td id='wednesday16'></td> <td id='wednesday17'></td> </tr> <tr> <td>Thursday</td> <td id='thursday8'></td> <td id='thursday9'></td> <td id='thursday10'></td> <td id='thursday11'></td> <td id='thursday12'></td> <td id='thursday13'></td> <td id='thursday14'></td> <td id='thursday15'></td> <td id='thursday16'></td> <td id='thursday17'></td> </tr> <tr> <td>Friday</td> <td id='friday8'></td> <td id='friday9'></td> <td id='friday10'></td> <td id='friday11'></td> <td id='friday12'></td> <td id='friday13'></td> <td id='friday14'></td> <td id='friday15'></td> <td id='friday16'></td> <td id='friday17'></td> </tr> <tr> <td>Saturday</td> <td id='saturday8'></td> <td id='saturday9'></td> <td id='saturday10'></td> <td id='saturday11'></td> <td id='saturday12'></td> <td id='saturday13'></td> <td id='saturday14'></td> <td id='saturday15'></td> <td id='saturday16'></td> <td id='saturday17'></td> </tr> </tbody> </table>";
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(htmlData);

		
		
		
	}

}
