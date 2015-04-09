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

public class Combinations {
	
	public Map<String,Integer> getAvailableCombinations(String combType){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		String password = null;
		ResultSet rs = null;
		Map<String,Integer> CombDetails = new TreeMap<String,Integer>(); 
		try {
			Connection con = dbCon.getConnection();
			System.out.println(combType);
			String query = "SELECT * FROM combinationdata where Combination LIKE '%"+combType+"%'";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, combType);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CombDetails.put(rs.getString(1), rs.getInt(3));
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
		return CombDetails;
	}
	
	public int updateAvailability(String comb){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			Connection con = dbCon.getConnection();
			String query = "UPDATE combinationdata SET Current_strength = Current_strength - 1 WHERE Combination = ? and Current_strength > 0;";
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
			Connection con = dbCon.getConnection();
			System.out.println(combType);
			String query = "SELECT * FROM combinationdata where Combination LIKE '%"+combType+"%'";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, combType);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CombinationInfoBean beanInstance = new CombinationInfoBean();
				beanInstance.setCardName(rs.getString("Combination"));
				beanInstance.setMax_seats(rs.getInt("Max_capacity"));
				beanInstance.setFull_seats(rs.getInt("Current_strength"));
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
			Connection con = dbCon.getConnection();
			String query = "UPDATE combinationdata SET Current_strength = Current_strength + ("+ newOffset +"), Max_capacity = Max_capacity + ("+ newOffset +") WHERE Combination = ? ;";
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
	
	
	
	
}





