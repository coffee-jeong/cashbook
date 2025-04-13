package dao;

import java.sql.*;
import java.util.*;

import dto.Cash;
import dto.Category;

public class CashDao {
	// 달력에 일자별 수입/지출 각 합계금액
	public List<HashMap<String, Object>> cashList(int year, int month) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		List<HashMap<String, Object>> list = new ArrayList<>();

		try (
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
			PreparedStatement stmt = conn.prepareStatement(
				"SELECT DAY(cash_date) AS day, kind, SUM(amount) AS total "
				+ "FROM category ct INNER JOIN cash cs "
				+ "ON ct.category_no = cs.category_no "
				+ "WHERE YEAR(cash_date) = ? AND MONTH(cash_date) = ? "
				+ "GROUP BY DAY(cash_date), ct.kind "
				+ "ORDER BY DAY(cash_date)")
		) {
			stmt.setInt(1, year);
			stmt.setInt(2, month);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					HashMap<String, Object> map = new HashMap<>();
					map.put("day", rs.getInt("day"));
					map.put("kind", rs.getString("kind"));
					map.put("total", rs.getInt("total"));
					list.add(map);
				}
			}
		}
		return list;
	}
	// cashList 특정 일자의 수입/지출 상세 내역
	public ArrayList<Cash> selectCashList(int year, int month, int days) throws ClassNotFoundException, SQLException{
		ArrayList<Cash> list = new ArrayList<>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT ct.title, ct.kind, c.memo memo, c.amount amount, c.createdate "
				+ "FROM cash c INNER JOIN category ct "
				+ "ON c.category_no = ct.category_no "
				+ "WHERE YEAR(cash_date) = ? and month(cash_date)= ? AND DAY(cash_date) = ? "
				+ "ORDER BY kind";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, year);
		stmt.setInt(2, month);
		stmt.setInt(3, days);
		
		rs = stmt.executeQuery();
		
			while (rs.next()) {
				Cash c = new Cash();
			    c.setMemo(rs.getString("memo"));
			    c.setAmount(rs.getInt("amount"));

			    Category cat = new Category();
			    cat.setKind(rs.getString("kind")); 	// kind 설정
			    cat.setTitle(rs.getString("title"));
			    c.setCategory(cat); // Cash에 Category 넣기

			    list.add(c);
			}

		return list;	
	}
	// cash 추가 
	public void insertCash(int categoryNo, String cashDate, int amount, String memo) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		String sql = "insert into cash(category_no, cash_date, amount, memo) values(?,?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryNo);
		stmt.setString(2, cashDate);
		stmt.setInt(3, amount);
		stmt.setString(4, memo);
		
		stmt.executeUpdate();
		
		conn.close();
		
	}
	
	// 상세페이지에서 수정시
	public void updateCash() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		String sql = "";
		stmt = conn.prepareStatement(sql);
	}
}
