package com.bits_pilani.goa.arc.WebService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bits_pilani.goa.arc.Dao.TimeTable;
import com.bits_pilani.goa.arc.Registration.sixbynineBean;
import com.google.gson.Gson;

/**
 * Servlet implementation class SixByNineData
 */
@WebServlet("/SixByNineData")
public class SixByNineData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SixByNineData() {
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
		String combName = request.getParameter("combName");
		TimeTable getData = new TimeTable();
		List<sixbynineBean> timetable69 = getData.getsixbynine(combName);
		Gson gson = new Gson();
		String json = gson.toJson(timetable69);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
