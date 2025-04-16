<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int categoryNO = Integer.parseInt(request.getParameter("categoryNo"));
	String kind = request.getParameter("kind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 수정</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f0f2f5;
		padding: 40px;
	}

	/* nav 영역 스타일 */
	.info {
		display: flex;
		justify-content: center;
		margin-bottom: 30px;
		background-color: #fff;
		padding: 15px;
		border-radius: 10px;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	}

	form {
		width: 60%;
		margin: 0 auto;
		background-color: #fff;
		padding: 25px;
		border-radius: 10px;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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

	input[type="text"] {
		width: 95%;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}

	input[type="radio"] {
		margin-right: 5px;
	}

	button {
		display: block;
		margin: 20px auto 0;
		padding: 10px 20px;
		background-color: #28a745;
		color: white;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}

	button:hover {
		background-color: #218838;
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<form action="/cashbook/category/updateCategoryAction.jsp">
		<table border="1">
		<tr>
			<th >번호</th>
			<td colspan="2"><input type="text" name="categoryNo" value="<%=categoryNO%>" readonly></td>
		</tr>
		<tr >
			<th>수입/지출</th>
			<td><input type="radio" name="kind" value="수입" checked="<%=kind.equals("수입") ? "checked" : "" %>" disabled>수입</td>
			<td><input type="radio" name="kind" value="지출" checked="<%=kind.equals("지출") ? "checked" : "" %>" disabled>지출</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2"><input type="text" name="title"></td>
		</tr>
	</table>
	<button type="submit">[수정하기]</button>
	</form>
</body>
</html>