package com.bits_pilani.goa.arc.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.bits_pilani.goa.arc.ConnectionManager.DBConnection;
import com.bits_pilani.goa.arc.Registration.CombinationInfoBean;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
public class Combinations {

	public Map<String,Integer> getAvailableCombinations(String combType){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		String password = null;
		ResultSet rs = null;
		Map<String,Integer> CombDetails = new TreeMap<String,Integer>(); 
		try {
			Connection con = dbCon.getConnectionOther();
			System.out.println(combType);
			String query = "SELECT * FROM timetable_timetable where card_number LIKE '%"+combType+"%'";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, combType);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CombDetails.put(rs.getString("card_number"), rs.getInt("current_capacity"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error in getting available combinations");
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

	public int updateAvailability(String comb){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			Connection con = dbCon.getConnectionOther();
			String query = "UPDATE timetable_timetable SET current_capacity = current_capacity - 1 WHERE card_number = ? and current_capacity > 0;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comb);
			rs = pstmt.executeUpdate();
			System.out.println(rs);
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
		return rs;
	}

	public List<CombinationInfoBean> combinationInformation(String combType){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CombinationInfoBean> CombDetails = new ArrayList<CombinationInfoBean>(); 
		try {
			Connection con = dbCon.getConnectionOther();
			System.out.println(combType);
			String query = "SELECT * FROM timetable_timetable where card_number LIKE '%"+combType+"%'";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, combType);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CombinationInfoBean beanInstance = new CombinationInfoBean();
				beanInstance.setCardName(rs.getString("card_number"));
				beanInstance.setMax_seats(rs.getInt("max_capacity"));
				beanInstance.setFull_seats(rs.getInt("current_capacity"));
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

	public int updateSeatCapacity(String cardname, int newOffset){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			Connection con = dbCon.getConnectionOther();
			String query = "UPDATE timetable_timetable SET current_capacity = current_capacity + ("+ newOffset +"), max_capacity = max_capacity + ("+ newOffset +") WHERE card_number = ? ;";
			System.out.println(cardname);
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cardname);
			rs = pstmt.executeUpdate();
			System.out.println(rs);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Error in SQl process, updating Seat capacity");
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

	public int insertGroupInfo(String group, String branch){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;

		int rs = 0;
		try {
			Connection con = dbCon.getConnection();
			String query = "INSERT INTO branchgroup (`branch`, `groupName`) VALUES (?,?);" ;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, branch);
			pstmt.setString(2, group);
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

	public List<String> getGroupInfo(String group){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> groupInfo = new ArrayList<String>();

		try {
			Connection con = dbCon.getConnection();
			//System.out.println(combType);
			String query = "SELECT * FROM branchgroup where groupName = '"+group+"'";

			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, combType);
			rs = pstmt.executeQuery();
			while(rs.next()){
				groupInfo.add(rs.getString("branch"));

			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error in group branch info retrieval");
		}
		finally{

			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return groupInfo;
	}

	public void truncateGroupBranchTable(){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;

		try {
			Connection con = dbCon.getConnection();
			String query = "TRUNCATE TABLE branchgroup;";
			pstmt = con.prepareStatement(query);
			pstmt.execute();
			pstmt.close();
			System.out.println("Table Truncate successful");

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
}
