package com.zubiri;
import java.sql.*;

public class Connect {
	
	public static Connection conn=null;
	
	public static void startConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");
	}

}
