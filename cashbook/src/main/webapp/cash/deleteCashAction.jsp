<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" + cashNo);
	
	CashDao cashDao = new CashDao();
	cashDao.deleteCash(cashNo);
	
	int row = 0;
	
	if(row == 1) {
		System.out.println("캐시 정상 삭제");
		response.sendRedirect("/cashbook/month/monthList.jsp");
	} else {
		System.out.println("캐시 삭제 실패");
		response.sendRedirect("/cashbook/month/monthList.jsp");	
	}
%>