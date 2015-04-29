package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.Combinations;

/**
 * Servlet implementation class GroupBranch
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/GroupBranch")
public class GroupBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GroupBranch() {
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

		Combinations branchgroup = new Combinations();
		branchgroup.truncateGroupBranchTable();

		String[] eglist = request.getParameter("egbranches").split(",");
		String[] wslist = request.getParameter("wsbranches").split(",");

		for (String string : wslist) {
			branchgroup.insertGroupInfo("WS", string.trim());	
		}

		for (String string : eglist) {
			branchgroup.insertGroupInfo("EG", string.trim());
		}

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("<p>Saved</p>");
	}

}
