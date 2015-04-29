package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.Combinations;
import com.bits_pilani.goa.arc.Registration.CombinationInfoBean;

/**
 * Servlet implementation class CapacityDetails
 */

/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/CapacityDetails")
public class CapacityDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapacityDetails() {
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
		String combType = request.getParameter("combType");
		Combinations details = new Combinations();
		List<CombinationInfoBean> entireCombDetails =   details.combinationInformation(combType);
		//		<tr class="positive">
		//		<td>R_EG_1</td>
		//		<td>
		//			<div class="ui transparent fluid  input">
		//				<input type="number" value="34">
		//			</div>
		//		</td>
		//		<td>23</td>
		//	</tr>
		String htmlData = "<table class=\"ui celled table\"><thead><tr>"+
				"<th class=\"three wide\">Card Name</th>"+
				"<th class=\"two wide\">Maximum Seats</th>"+
				"<th class=\"two wide\">Remaining Seats</th><th class=\"two wide\">Save</th></tr></thead><tbody>";
		for (CombinationInfoBean combinationInfoBean : entireCombDetails) {
			if(combinationInfoBean.getFull_seats() <= 0)
				htmlData += "<tr class=\"negative\">";
			else if (combinationInfoBean.getFull_seats() <= 7)
				htmlData += "<tr class=\"warning\">";
			else 
				htmlData += "<tr class=\"positive\">";
			htmlData += "<td>"+ combinationInfoBean.getCardName() +"</td>";
			htmlData += "<td><div class=\"ui transparent fluid  input\"><input id=\""+combinationInfoBean.getCardName()+"\" type=\"number\" value=\""+ combinationInfoBean.getMax_seats() +"\"></div></td>";
			htmlData += "<td>"+ combinationInfoBean.getFull_seats() +"</td>";
			htmlData += "<td><div id=\""+combinationInfoBean.getCardName()+"\" class=\"ui basic blue icon button\" onclick=\"updateCombData('"+combinationInfoBean.getCardName()+"')\"><i class=\"save icon\"></i></div></td></tr>";
		}
		htmlData += "</tbody></table>";
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(htmlData);


	}

}
