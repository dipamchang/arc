package com.bits_pilani.goa.arc.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bits_pilani.goa.arc.ConnectionManager.DBConnection;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
public class Data {

	public int registeredCount(){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		int count = 0 ;
		try {
			Connection con = dbCon.getConnection();
			String query = "SELECT COUNT(*) FROM student WHERE Combination != \"not\" AND Combination != \"deReg\"";
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
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
		return count;
	}
	public static void main(String[] args) {
		Data as = new Data();
		System.out.println(as.registeredCount());
	}

}
