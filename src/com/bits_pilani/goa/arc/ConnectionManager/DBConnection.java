package com.bits_pilani.goa.arc.ConnectionManager;
import java.sql.*;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 * 
 */
public class DBConnection {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/bits_arc_registration";
	static final String DB_URL_OTHER = "jdbc:mysql://localhost:3306/bits_arc";
	static final String USER = "bits";
	static final String PASS = "Bits@123";

	Connection conn = null;
	public Connection getConnection() throws SQLException, ClassNotFoundException{

		//STEP 2: Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver");

		//STEP 3: Open a connection
		System.out.println("Connecting to database...");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		return conn;
	}

	public Connection getConnectionOther() throws SQLException, ClassNotFoundException{

		//STEP 2: Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver");

		//STEP 3: Open a connection
		System.out.println("Connecting to OTHER database...");
		conn = DriverManager.getConnection(DB_URL_OTHER,USER,PASS);
		return conn;
	}


	public void closeConnection () throws SQLException{
		conn.close();
	}


}
