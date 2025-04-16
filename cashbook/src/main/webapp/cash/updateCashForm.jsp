<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	String memo = request.getParameter("memo");
	String title = request.getParameter("title");
	int amount = Integer.parseInt(request.getParameter("amount"));
	String cashDate = request.getParameter("cashDate");
	System.out.println("cashNo:" + cashNo);
	System.out.println("memo:" + memo);
	System.out.println("title:" + title);
	System.out.println("amount:" + amount);
	System.out.println("cashDate:" + cashDate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cash 수정</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f9f9f9;
		padding: 40px;
	}

	.info {
		display: flex;
		justify-content: center;
		margin-bottom: 30px;
		background-color: #ffffff;
		padding: 15px;
		border-radius: 10px;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	}

	form {
		width: 60%;
		margin: 0 auto;
		background-color: #fff;
		padding: 25px;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	th, td {
		padding: 14px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}

	th {
		background-color: #007bff;
		color: white;
		text-align: center;
		width: 150px;
	}

	input[type="text"],
	input[type="number"],
	textarea {
		width: 95%;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}

	input[type="submit"] {
		display: block;
		margin: 20px auto 0;
		padding: 10px 25px;
		background-color: #28a745;
		color: white;
		border: none;
		font-size: 16px;
		border-radius: 5px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}

	input[type="submit"]:hover {
		background-color: #218838;
	}

	a {
		display: inline-block;
		margin: 10px 10px 0 0;
		padding: 8px 16px;
		background-color: #6c757d;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		transition: background-color 0.3s ease;
	}

	a:hover {
		background-color: #5a6268;
	}
	
	.action-buttons {
	text-align: center;
	margin-top: 30px;
	}
	
	.action-buttons a {
		display: inline-block;
		margin: 0 10px;
		padding: 10px 20px;
		background-color: #6c757d;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 15px;
		transition: background-color 0.3s ease;
	}
	
	.action-buttons a:hover {
		background-color: #5a6268;
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>

	<form action="/cashbook/cash/updateCashAction.jsp" method="post">
		<input type="hidden" name="cashNo" value="<%=cashNo%>">
		<input type="hidden" name="cashDate" value="<%=cashDate%>">
		<input type="hidden" name="title" value="<%=title%>">
		<table border="1">
			<tr>
				<th>분류</th>
				<td><input type="text" name="title" value="<%=title%>" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="20" name="memo"><%=memo%></textarea></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="number" name="amount" value="<%=amount%>"></td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td><%=cashDate%></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="수정하기">
	</form>

	<div class="action-buttons">
		<a href="/cashbook/cash/deleteCashAction.jsp?cashNo=<%=cashNo%>">삭제하기</a>
		<a href="/cashbook/receit/insertReceitForm.jsp?cashNo=<%=cashNo%>">영수증 등록</a>
		<a href="/cashbook/receit/deleteReceitForm.jsp?cashNo=<%=cashNo%>">영수증 삭제</a>
	</div>
</body>
</html>