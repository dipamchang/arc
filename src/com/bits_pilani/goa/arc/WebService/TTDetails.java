package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.TimeTable;
import com.bits_pilani.goa.arc.Registration.TTInfo;

/**
 * Servlet implementation class TTDetails
 */
@WebServlet("/TTDetails")
public class TTDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TTDetails() {
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
		
		String combination = request.getParameter("comb");
		TimeTable ttinfo = new TimeTable();
		List<TTInfo> result = ttinfo.getTtInfo(combination);
		
		/*<table class="ui very padded table">
  <thead>
    <tr>
      <th>Course No.</th>
      <th>Course name</th>
      <th>Section No.</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>F2113</td>
      <td>Workshop Practice</td>
      <td>P2</td>
    </tr>
    <tr>
      <td>F2113</td>
      <td>Workshop Practice</td>
      <td>P2</td>
    </tr>
    <tr>
      <td>F2113</td>
      <td>Workshop Practice</td>
      <td>P2</td>
    </tr>
    <tr>
      <td>F2113</td>
      <td>Workshop Practice</td>
      <td>P2</td>
    </tr>
  </tbody>
</table>
		 * */
		
		
		String table = "<table class=\"ui padded table\"> <thead>   <tr>   <th>Course No.</th>   <th>Course name</th> <th>Section No.</th>   </tr>  </thead>  <tbody>";
		
		for (TTInfo ttInfo2 : result) {
			table += "<tr>";
			table += "<td>"+ ttInfo2.getCourseId() + "</td>";
			table += "<td>"+ ttInfo2.getCourseTitle() + "</td>";
			table += "<td>"+ ttInfo2.getSectiom() + "</td>";
			table += "</tr>";
		}
		table +="  </tbody></table>"; 
		 response.setContentType("text/plain");
		 response.setCharacterEncoding("UTF-8");
		 response.getWriter().write(table);
		
	}

}
