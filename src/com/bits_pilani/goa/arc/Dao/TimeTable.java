package com.bits_pilani.goa.arc.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bits_pilani.goa.arc.ConnectionManager.DBConnection;
import com.bits_pilani.goa.arc.Registration.TTInfo;
import com.bits_pilani.goa.arc.Registration.sixbynineBean;
import com.mysql.jdbc.Statement;

public class TimeTable {
	public List<TTInfo> getTtInfo(String combination){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		String password = null;
		ResultSet rs = null;
		List<TTInfo> result = new ArrayList<TTInfo>();
		try {
			Connection con = dbCon.getConnection();
			
			String query = "SELECT DISTINCT Subject,Catalog_No, Course_Title, Section  FROM timetable where Combination LIKE ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%,"+combination+",%");
			rs = pstmt.executeQuery();
			System.out.println("****" + combination);
			while(rs.next()){
				TTInfo ttRow = new TTInfo();
				ttRow.setCourseId(rs.getString("Subject") + " " + rs.getString("Catalog_No"));
				ttRow.setCourseTitle(rs.getString("Course_Title"));
				ttRow.setSectiom(rs.getString("Section"));
				result.add(ttRow);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Username not found");
		}
		finally{
			
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public List<sixbynineBean> getsixbynine(String combName) {
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		 java.sql.Statement stmt = null;
		String password = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		List<sixbynineBean> result = new ArrayList<sixbynineBean>();
		try {
			Connection con = dbCon.getConnectionOther();
			
			String query = "SELECT id FROM timetable_timetable where card_number = '"+combName+"'";
			//pstmt = con.prepareStatement(query);
			//pstmt.setString(1, "%,"+combination+",%");
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			int idd = rs.getInt("id");
			String query1 = "SELECT * FROM `timetable_timetable_schedules`  LEFT JOIN timetable_schedule ON timetable_timetable_schedules.schedule_id = timetable_schedule.id and timetable_id = ? LEFT JOIN timetable_timing ON timetable_timetable_schedules.schedule_id = timetable_timing.schedule_id ORDER BY start_time";
			pstmt = con.prepareStatement(query1);
			pstmt.setInt(1,idd);
			rs1 = pstmt.executeQuery();
			String htmlData = ""; 
			String mon,tue,wed,thu,fri,sat;
			
			while(rs1.next()){
				java.sql.Time st = rs1.getTime("start_time");
				java.sql.Time et = rs1.getTime("end_time");
				sixbynineBean inst = new sixbynineBean();
				String id = rs1.getString("day_of_week") + ""+ st.getHours();
				String content = rs1.getString("course_id") + " " + rs1.getString("section") + " " + rs1.getString("location");
				inst.setContent(content);
				inst.setId(id);
				int diff = et.getHours() - st.getHours();
				if (diff >1){
					sixbynineBean inst1 = new sixbynineBean();
					int increment = st.getHours()+1;
					String id1 =  rs1.getString("day_of_week") + ""+ increment;
					String content1 = rs1.getString("course_id") + " " + rs1.getString("section") + " " + rs1.getString("location");
					inst1.setContent(content1);
					inst1.setId(id1);
					result.add(inst1);
				}
				
				System.out.println(id);
				System.out.println(content);
				result.add(inst);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Username not found");
		}
		finally{
			
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
//	public static void main(String[] args) {
//		TimeTable as = new TimeTable();
//		as.getsixbynine("R_WS_A_1");
//	}
}
