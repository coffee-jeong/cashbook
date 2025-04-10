<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	/*  중복 타이틀 등록금지 
		select count(*) category where kind = ? and title = ?
		
		int  ckCount = categoryDao.selectCointTitle(category);
		if(ckCount > 0) {
			response.sendRedirect(// );
			return;
		}
	*/
	
	String kind = request.getParameter("kind");
	String title = request.getParameter("title");
	System.out.println("kind:" + kind);
	System.out.println("title:" + title);
	
	CategoryDAO categoryDao = new CategoryDAO();
	categoryDao.insertCategory(kind, title);
	
	response.sendRedirect("/cashbook/category/categoryList.jsp");
%>
