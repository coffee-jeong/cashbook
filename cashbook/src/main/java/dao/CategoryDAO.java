package dao;

import java.sql.*;
import java.util.*;

import dto.Category;
import dto.Paging;

public class CategoryDAO {
	// 카데고리 추가 
	public void insertCategory(String kind, String title) throws ClassNotFoundException, SQLException {
		Connection conn = null;
        PreparedStatement stmt = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        // SQL 쿼리 수정
        String sql = "insert into category (kind, title, createdate) values (?, ?, now())";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, kind);
        stmt.setString(2, title);
        
        stmt.executeUpdate();
        
        conn.close();
	}
	
	//카데고리 리스트
	public ArrayList<Category> categoryList(Paging p) throws ClassNotFoundException, SQLException {
		ArrayList<Category> list = new ArrayList<>();
		Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        String sql = "SELECT * FROM category ORDER BY category_no desc limit ?, ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, p.getBiginRow());
        stmt.setInt(2, p.getRowPerPage());
        
        rs = stmt.executeQuery();
        
        while (rs.next()) {
        	Category c = new Category();
        	c.setCategoryNo(rs.getInt("category_no"));
        	c.setKind(rs.getString("kind"));
        	c.setTitle(rs.getString("title"));
        	c.setCreatedate(rs.getString("createdate"));
        	list.add(c);
        }
        conn.close();
		return list;
	}
	
	public void updateCategory(String title, int categoryNO) throws ClassNotFoundException, SQLException {
		int row = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        String sql = "update category set title = ? where category_no = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setInt(2, categoryNO);
        
        row = stmt.executeUpdate();
		
		if(row == 1) {
			System.out.println("정상 수정");
		}
		else {
			System.out.println("비정상 수정");
		}
		
		conn.close();
	}
	
	public void deleteCategory(int categoryNo) throws ClassNotFoundException, SQLException {
		int row = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        String sql = "delete from category where category_no = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, categoryNo);
        
        row = stmt.executeUpdate();
        
        if(row == 1) {
			System.out.println("정상 삭제");
		}
		else {
			System.out.println("삭제 실패");
		}
		
		conn.close();
	}
}
