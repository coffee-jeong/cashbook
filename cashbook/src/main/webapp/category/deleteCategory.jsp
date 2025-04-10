<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	
	CategoryDAO category = new CategoryDAO();
	category.deleteCategory(categoryNo);
	
	response.sendRedirect("/cashbook/category/categoryList.jsp");

%>