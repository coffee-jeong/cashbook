<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		margin: 0;
		padding: 0;
		background: #eef1f5;
		color: #333;
	}

	/* 상단 네비게이션 */
	.info {
		position: sticky;
		top: 0;
		background-color: #2c3e50;
		color: white;
		padding: 15px 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
		z-index: 100;
	}

	.info span {
		font-size: 16px;
	}

	.info a {
		color: #f1f1f1;
		text-decoration: none;
		margin-left: 20px;
		font-weight: bold;
	}

	.info a:hover {
		text-decoration: underline;
	}

	h1 {
		text-align: center;
		margin-top: 50px;
		font-size: 36px;
		color: #2c3e50;
	}

	/* 카드 스타일 메뉴 */
	.menu {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		gap: 20px;
		max-width: 800px;
		margin: 40px auto;
		padding: 0 20px;
	}

	.menu li {
		list-style: none;
		background: white;
		padding: 30px 20px;
		border-radius: 10px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
		text-align: center;
		transition: transform 0.2s ease;
	}

	.menu li:hover {
		transform: translateY(-5px);
		box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
	}

	.menu li a {
		text-decoration: none;
		color: #27ae60;
		font-size: 18px;
		font-weight: bold;
	}

	.menu li a:hover {
		color: #219150;
	}
</style>
</head>
<body>
	<div class="info">
		<span><%=adminId%>님 반갑습니다</span>
		<div>
			<a href="/cashbook/logout.jsp">로그아웃</a>
			<a href="/cashbook/updateAdminPwForm.jsp">비밀번호 변경</a>
		</div>
	</div>

	<h1>📒 Cashbook 메뉴</h1>
	<ul class="menu">
		<li><a href="/cashbook/category/insertCategoryForm.jsp">카테고리 입력하기</a></li>
		<li><a href="/cashbook/category/categoryList.jsp">카테고리 리스트</a></li>
		<li><a href="/cashbook/month/monthList.jsp">달력</a></li>
		<li><a href="/cashbook/statistics.jsp">통계</a></li>
	</ul>
</body>
</html>
