<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" + cashNo);
	
	ReceitDAO receitDao = new ReceitDAO();
	receitDao.deleteReceit(cashNo);
	
	response.sendRedirect("/cashbook/month/monthList.jsp");
%>