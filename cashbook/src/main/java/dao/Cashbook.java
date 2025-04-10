package dao;

import java.io.IOException;
import java.net.ResponseCache;
import java.sql.*;

import org.apache.catalina.connector.Response;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Cashbook {	
    public boolean login(String adminId, String adminPw, HttpServletRequest request, HttpServletResponse response) 
            throws ClassNotFoundException, SQLException, IOException {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isLogin = false;

        String sql = "SELECT admin_id, admin_pw FROM admin WHERE admin_id=? AND admin_pw=?";
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, adminId);
        stmt.setString(2, adminPw);
        rs = stmt.executeQuery();

        if (rs.next()) {
            isLogin = true;
            System.out.println("로그인 성공");

            request.getSession().setAttribute("adminId", rs.getString("admin_id"));
        } else {
            System.out.println("로그인 실패");
        }
        
        rs.close();
        stmt.close();
        conn.close();

        return isLogin;
    }
    
    public int updateAdminPw(String adminId, String beforePassword, String newPassword) throws ClassNotFoundException, SQLException {
        int row = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        // SQL 쿼리 수정
        String sql = "UPDATE admin SET admin_pw = ? WHERE admin_id = ? AND admin_pw = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, newPassword);
        stmt.setString(2, adminId);
        stmt.setString(3, beforePassword);
        
        row = stmt.executeUpdate();
        
        // 리소스 닫기
        stmt.close();
        conn.close();
        
        return row;
    }
}