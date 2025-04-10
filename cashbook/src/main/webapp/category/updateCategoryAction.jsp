<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	int categoryNO = Integer.parseInt(request.getParameter("categoryNo"));
	String kind = request.getParameter("kind");
	String title = request.getParameter("title");
	
	CategoryDAO categoryDao = new CategoryDAO();
	categoryDao.updateCategory(title, categoryNO);
	
	response.sendRedirect("/cashbook/category/categoryList.jsp");
%>