package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.StudentData;
import com.bits_pilani.goa.arc.Registration.StudentDetailsBean;

/**
 * Servlet implementation class SRegistrationDetails
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/SRegistrationDetails")
public class SRegistrationDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SRegistrationDetails() {
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
		String studentId = request.getParameter("studentId");
		String regStatus = request.getParameter("regStatus");
		StudentData regDetails = new StudentData();
		List<StudentDetailsBean> allRegData = regDetails.getAllRegData(studentId, regStatus);
		//		<table class="ui celled table">
		//		<thead>
		//			<tr>
		//				<th>Student ID</th>
		//				<th>Name</th>
		//				<th>Combination</th>
		//				<th>Timestamp</th>
		//				<th>De-Register</th>
		//			</tr>
		//		</thead>
		//		<tbody>
		//			<tr>
		//				<td>2011C6PS610G</td>
		//				<td>cHANGEDE dIPAM dILIP</td>
		//				<td>r_ws_1</td>
		//				<td>2015-03-18 17:28:40</td>
		//				<td><div class="ui red icon button"><i class="remove circle icon"></i></div></td>
		//			</tr>
		//		</tbody>
		//	</table>
		String htmlData = "<table class=\"ui celled table\"><thead><tr><th>Student ID</th><th>Name</th><th>Combination</th><th>Timestamp</th>"+
				"<th>De-Register</th></tr></thead><tbody>";

		for (StudentDetailsBean studentDetailsBean : allRegData) {
			htmlData += "<tr><td>"+ studentDetailsBean.getStudentId() +"</td>";
			htmlData += "<td>"+ studentDetailsBean.getStudentName() +"</td>";
			htmlData += "<td>"+ studentDetailsBean.getCombination() +"</td>";
			htmlData += "<td>"+ studentDetailsBean.getTimestamp() +"</td>";
			htmlData += "<td><div class=\"ui red icon button\" onclick=\"deRegisterStudent('"+studentDetailsBean.getStudentId()+"')\"><i class=\"remove circle icon\"></i></div></td>";
			htmlData += "</tr>";
		}
		htmlData += "</tbody></table>";
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(htmlData);


	}

}
