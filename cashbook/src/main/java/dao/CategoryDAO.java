package dao;

import java.sql.*;
import java.util.*;

import dto.Category;
import dto.Paging;

public class CategoryDAO {
	// 카데고리 추가 
	public void insertCategory(String kind, String title) throws SQLException, ClassNotFoundException {
        // 데이터베이스 연결 및 중복 체크
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = null;
        PreparedStatement stmt2 = null;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        conn.setAutoCommit(false);
        
        // 중복 검사 쿼리
        String sql2 = "select count(*) from category where kind = ? and title = ?";
        stmt2 = conn.prepareStatement(sql2);
        stmt2.setString(1, kind);
        stmt2.setString(2, title);
        
        ResultSet rs = stmt2.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            
            // 타이틀이 중복되지 않으면 추가
            if (count == 0) {
                String sql = "insert into category (kind, title, createdate) values (?, ?, now())";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, kind);
                stmt.setString(2, title);
                stmt.executeUpdate();
                conn.commit();
            }
        }
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
