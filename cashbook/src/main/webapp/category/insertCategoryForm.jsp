<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카데로기 입력</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f2f2f2;
		margin: 0;
		padding: 40px;
		color: #333;
	}

	/* nav 포함 영역 중앙 정렬 및 스타일 */
	.info {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 30px;
		background-color: #ffffff;
		padding: 15px;
		border-radius: 10px;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	}

	form {
		width: 50%;
		margin: 0 auto;
		background-color: #ffffff;
		padding: 25px;
		border-radius: 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	th, td {
		padding: 15px;
		border: 1px solid #dee2e6;
		font-size: 16px;
		text-align: left;
	}

	th {
		background-color: #007bff;
		color: white;
		width: 30%;
	}

	input[type="text"] {
		width: 95%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 6px;
		font-size: 15px;
	}

	input[type="radio"] {
		margin-right: 6px;
	}

	button {
		margin-top: 20px;
		width: 100%;
		padding: 12px;
		background-color: #28a745;
		color: white;
		border: none;
		border-radius: 6px;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}

	button:hover {
		background-color: #218838;
	}

	@media (max-width: 768px) {
		form {
			width: 90%;
		}
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<form action="/cashbook/category/insertCategoryAction.jsp">
		<table border="1">
		<tr>
			<th>수입/지출</th>
			<td><input type="radio" name="kind" value="수입">수입</td>
			<td><input type="radio" name="kind" value="지출">지출</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2"><input type="text" name="title"></td>
		</tr>
	</table>
	<button type="submit">[작성하기]</button>
	</form>
</body>
</html>