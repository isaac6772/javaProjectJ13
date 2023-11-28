package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnect {
	private static final MyConnect instance = new MyConnect();
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaProject13";
	private String user = "root";
	private String password = "1234";
	
	public Connection conn = null;
	
	private MyConnect() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
		}
	}
	
	public static MyConnect getInstance() {
		return instance;
	}
}
