<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	String memo = request.getParameter("memo");
	int amount = Integer.parseInt(request.getParameter("amount"));
	String cashDate = request.getParameter("cashDate");
	System.out.println("cashNo:" + cashNo);
	System.out.println("memo:" + memo);
	System.out.println("amount:" + amount);
	System.out.println("cashDate:" + cashDate);
	
	CashDao cashDao = new CashDao();
	cashDao.updateCash(amount, memo, cashDate, cashNo);
	
	response.sendRedirect("/cashbook/month/monthList.jsp");
%>