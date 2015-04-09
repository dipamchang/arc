package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.Data;

/**
 * Servlet implementation class RegData
 */
@WebServlet("/RegData")
public class RegData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegData() {
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
		Data RegData = new Data();
		int cc = RegData.registeredCount();
		String as = Integer.toString(cc);
		response.setContentType("text/plain");
		 response.setCharacterEncoding("UTF-8");
		 System.out.println(cc);
		 response.getWriter().write(as);
	}

}
