<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}

	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int days = Integer.parseInt(request.getParameter("days"));

	CashDao cash = new CashDao();
	ArrayList<Cash> list = cash.selectCashList(year, month, days);
	
	// 넘길 날짜 값을 묶어서 0000-00-00형태로 보내기
	String monthStr = (month < 10 ? "0" : "") + month;
	String dayStr = (days < 10 ? "0" : "") + days;
	String cashDate = year + "-" + monthStr + "-" + dayStr;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= year %>년 <%= month %>월 <%= days %>일 내역</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f4f4f4;
		padding: 20px;
	}

	h2 {
		background-color: #4CAF50;
        color: white;
        padding: 10px;
        border-radius: 5px;
        text-align: center;
        margin: 20px;
	}

	table {
		width: 80%;
		margin: 0 auto;
		border-collapse: collapse;
		background-color: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

	th, td {
		border: 1px solid #ddd;
		padding: 12px;
		text-align: center;
	}

	th {
		background-color: #007bff;
		color: white;
	}

	tr:hover {
		background-color: #f1f1f1;
	}

	td:last-child {
		text-align: right;
		padding-right: 20px;
	}
	
	.button {
		text-align: center; 
		margin-top: 30px;
	}
	.buttona {
		background-color: #28a745;
		color: white;
		padding: 10px 20px;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<h2><%= year %>년 <%= month %>월 <%= days %>일 수입/지출 내역</h2>
	<table>
		<tr>
			<th>수입/지출</th>
			<th>내용</th>
			<th>금액</th>
		</tr>
		<% for(Cash c : list) { %>
		<tr>
			<td><%= c.getCategory().getKind() %></td>
			<td><%= c.getMemo() %></td>
			<td><%= c.getAmount() %>원</td>
		</tr>
		<% } %>
	</table>
	<div class="button">
		<form method="post" action="/cashbook/cash/insertCashForm.jsp">
			<input type="hidden" name="cashDate" value="<%=cashDate%>">
			<button class="buttona" type="submit">작성하기</button>
		</form>
	</div>
</body>
</html>
