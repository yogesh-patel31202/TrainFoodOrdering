package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.http.HttpServletRequest;

public class DataDb {
	public Connection connection = null;

	public DataDb(HttpServletRequest request) {
		// HttpSession session = request.getSession();
		try {
			// String temp = (String) session.getAttribute("schtype");
			Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
			String Server = "localhost:3306";
			String Database = null, user = null, Password = null;
			Database = "trainfoodordering";
			user = "root";
			Password = "";
			connection = DriverManager.getConnection("jdbc:mysql://" + Server
					+ "/" + Database, user, Password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
