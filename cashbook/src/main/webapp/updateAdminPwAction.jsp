<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	String beforPassword = request.getParameter("beforPassword");
	String newPassword = request.getParameter("newPassword");
	System.out.println("beforPassword:" + beforPassword);
	System.out.println("newPassword:" + newPassword);
	
	Cashbook cashbook = new Cashbook();
	int row = cashbook.updateAdminPw(adminId, beforPassword, newPassword);
	
	if (row == 1) {
	      System.out.println("수정 성공");
	      response.sendRedirect("/cashbook/index.jsp");
	   } else {
	       System.out.println("수정 실패");
	       response.sendRedirect("/cashbook/updateAdminPwForm.jsp");
	   }
%>
