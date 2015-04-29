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
public class Credentials {

	public String getPassword(String username){
		DBConnection dbCon = new DBConnection();
		PreparedStatement pstmt = null;
		String password = null;
		String name = null;
		try {
			Connection con = dbCon.getConnection();
			String query = "SELECT Password,Name FROM student where Id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			password = rs.getString("Password");
			name = rs.getString("Name");
			rs.close();
			pstmt.close();

		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
			System.out.println("Username not found");
		}
		finally{

			try {
				dbCon.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return password+","+name;

	}

	//	public static void main(String[] args) {
	//		Credentials asd = new Credentials();
	//		System.out.println(asd.getPassword("2011wC6PS610G"));
	//	}

}
