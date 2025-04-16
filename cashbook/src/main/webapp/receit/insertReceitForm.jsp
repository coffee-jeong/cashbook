<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" +cashNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영수증 등록</title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		margin: 0;
		padding: 20px;
	}

	table {
		border-collapse: collapse;
		width: 100%;
		max-width: 600px;
		margin: 20px auto;
		background-color: #fff;
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
	}

	th, td {
		padding: 15px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}

	th {
		background-color: #f2f2f2;
		font-size: 18px;
	}

	input[type="text"],
	input[type="file"] {
		width: 100%;
		padding: 10px;
		margin-top: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}

	button {
		display: block;
		width: 200px;
		margin: 20px auto;
		padding: 10px 20px;
		background-color: #4CAF50;
		color: white;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s;
	}

	button:hover {
		background-color: #45a049;
	}
	
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
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<form method="post" enctype="multipart/form-data" action="./insertReceitAction.jsp"> 
		<table>
			<tr>
				<th>영수증 등록</th>
				<td>
					<input type="hidden" name="cashNo" value="<%=cashNo%>">
					<input type="text" name="filename" placeholder="파일 이름을 입력하세요" />
					<input type="file" name="file" />
				</td>
			</tr>
		</table>
		<button type="submit">[등록하기]</button>
	</form>
</body>
</html>
