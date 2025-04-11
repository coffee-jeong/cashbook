<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%	
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	String kind = request.getParameter("kind");
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	String cashDate = request.getParameter("cashDate");
	int amount = Integer.parseInt(request.getParameter("amount"));
	String memo = request.getParameter("memo");
	
	System.out.println("kind:" + kind);
	System.out.println("categoryNo:" + categoryNo);
	System.out.println("cashDate:" + cashDate);
	System.out.println("amount:" + amount);
	System.out.println("memo:" + memo);
	
	CashDao cash =new CashDao();
	cash.insertCash(categoryNo, cashDate, amount, memo);
	
	response.sendRedirect("/cashbook/month/monthList.jsp");
	
%>