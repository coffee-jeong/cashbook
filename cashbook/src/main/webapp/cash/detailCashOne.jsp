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
<title></title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f8f9fa;
		margin: 0;
		padding: 30px;
		color: #333;
		text-align: center; /* 전체 중앙 정렬 기본값 */
	}

	.info {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 40px;
	padding: 15px 0;
	background-color: #ffffff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	border-radius: 10px;
	width: 100%;
	}
	
	.info nav {
		display: flex;
		gap: 20px;
	}
	
	.info a {
		color: #007bff;
		text-decoration: none;
		font-weight: 500;
		font-size: 16px;
		transition: color 0.2s ease;
	}
	
	.info a:hover {
		color: #0056b3;
		text-decoration: underline;
	}

	table {
		width: 60%;
		margin: 0 auto;
		border-collapse: collapse;
		background-color: #ffffff;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		overflow: hidden;
		text-align: left;
	}

	th, td {
		border: 1px solid #dee2e6;
		padding: 15px;
		font-size: 16px;
	}

	th {
		background-color: #007bff;
		color: #fff;
		width: 30%;
		text-align: center;
	}

	td {
		background-color: #fdfdfd;
	}

	.action-buttons {
		margin-top: 30px;
	}

	.action-buttons a {
		display: inline-block;
		margin: 10px 15px;
		padding: 10px 20px;
		text-decoration: none;
		background-color: #28a745;
		color: white;
		border-radius: 6px;
		transition: background-color 0.3s ease, transform 0.2s ease;
		font-size: 16px;
	}

	.action-buttons a:hover {
		background-color: #218838;
		transform: scale(1.03);
	}

	.action-buttons a:nth-of-type(2) {
		background-color: #dc3545;
	}

	.action-buttons a:nth-of-type(2):hover {
		background-color: #c82333;
	}

	@media (max-width: 768px) {
		table {
			width: 90%;
		}

		th, td {
			font-size: 14px;
			padding: 10px;
		}

		.action-buttons a {
			padding: 8px 16px;
			font-size: 14px;
		}
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
		<table border="1">
			<tr>
				<th>분류</th>
				<td><%=title%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=memo%></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><%=amount%></td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td><%=cashDate%></td>
			</tr>
		</table>
	<div class="action-buttons">
		<a href="/cashbook/cash/updateCashForm.jsp?title=<%=title%>&memo=<%=memo%>&amount=<%=amount%>&cashDate=<%=cashDate%>&cashNo=<%=cashNo%>">[수정하기]</a>
		<a href="/cashbook/cash/deleteCashAction.jsp?cashNo=<%=cashNo%>">[삭제하기]</a>
	</div>
</body>
</html>