package com.bits_pilani.goa.arc.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.bits_pilani.goa.arc.ConnectionManager.DBConnection;
import com.bits_pilani.goa.arc.Registration.StudentDetailsBean;
import com.bits_pilani.goa.arc.WebService.SRegistrationDetails;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
public class StudentData {

	public String ifRegistered(String id){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		String combi = null;
		try {
			Connection con = dbCon.getConnection();
			String query = "SELECT Combination FROM student where Id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			combi = rs.getString("Combination");
			rs.close();
			pstmt.close();

		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
			System.out.println("DB Exception catch");
		}
		finally{
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return combi;

	}

	public int doRegister(String comb, String id){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			Connection con = dbCon.getConnection();
			String query = "UPDATE student SET Combination = ? WHERE Id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comb);
			pstmt.setString(2, id);
			rs = pstmt.executeUpdate();
			pstmt.close();

		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
			System.out.println("DB Exception catch");
		}
		finally{
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}


	public List<StudentDetailsBean> getAllRegData(String filter, String rstatus){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDetailsBean> CombDetails = new ArrayList<StudentDetailsBean>();
		String filter2 = "";
		if(rstatus.equals("1"))
			filter2 += "and Combination != \"not\" and Combination != \"deReg\"" ;
		else if (rstatus.equals("2"))
			filter2 += "and Combination = \"not\" and Combination != \"deReg\"";
		else if (rstatus.equals("3"))
			filter2 += "and Combination != \"deReg\"";
		else if (rstatus.equals("4"))
			filter2 += "and Combination = \"deReg\"";
		else if (rstatus.equals("5")){
			filter = "";
			filter2="";
		}

		try {
			Connection con = dbCon.getConnection();
			String query = "SELECT * FROM student where Id LIKE '%"+filter+"%' " + filter2;
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, rstatus);
			rs = pstmt.executeQuery();
			while(rs.next()){
				StudentDetailsBean beanInstance = new StudentDetailsBean();
				beanInstance.setCombination(rs.getString("Combination"));
				beanInstance.setPassowrd(rs.getString("Password"));
				beanInstance.setStudentId(rs.getString("Id"));
				beanInstance.setStudentName(rs.getString("Name"));
				beanInstance.setTimestamp(rs.getString("timestamp"));
				CombDetails.add(beanInstance);

			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error in combination Information retrieval");
		}
		finally{

			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return CombDetails;
	}

	public void truncateStudentDB(){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;

		try {
			Connection con = dbCon.getConnection();
			String query = "TRUNCATE TABLE student;";
			pstmt = con.prepareStatement(query);
			pstmt.execute();
			pstmt.close();
			System.out.println("DB Truncate successful");

		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
			System.out.println("DB Exception catch in truncating student DB");
		}
		finally{
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int insertStudentData(String id, String name, String passs){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;

		int rs = 0;
		try {
			Connection con = dbCon.getConnection();
			String query = "INSERT INTO student (`Id`, `Name`, `Password`, `Combination`) VALUES (?,?,"+passs+",'not');" ;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeUpdate();
			pstmt.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("DB Exception catch, while entering student data");
		}
		finally{
			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}
}
