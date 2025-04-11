package dao;

import java.sql.*;
import java.util.*;

public class Cash {
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
}
