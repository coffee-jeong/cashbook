package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReceitDAO {
	public void insertReceit(int cashNo, String filename) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		String sql = "insert into receit(cash_no, filename) values(?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cashNo);
		stmt.setString(2, filename);
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	public void deleteReceit(int cashNo) throws ClassNotFoundException, SQLException {
		int row = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		String sql = "delete from receit where cash_no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cashNo);
		
		row = stmt.executeUpdate();
		if(row == 1) {
			System.out.println("영수증 삭제");
		} else {
			System.out.println("영수증 삭제 실패");
		}
		
		conn.close();
	}
}
