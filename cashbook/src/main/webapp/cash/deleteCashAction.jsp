<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" + cashNo);
	
	CashDao cashDao = new CashDao();
	cashDao.deleteCash(cashNo);
	

	response.sendRedirect("/cashbook/month/monthList.jsp");	

%>