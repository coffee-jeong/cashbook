<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}

	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10;
	Paging paging = new Paging();
	paging.setCurrentPage(currentPage);
	paging.setRowPerPage(rowPerPage);
	
	CategoryDAO category = new CategoryDAO();
	ArrayList<Category> list = category.categoryList(paging);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f8f9fa;
		padding: 40px;
		color: #333;
	}

	/* nav 영역 중앙 정렬 */
	.info {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 30px;
		background-color: #fff;
		padding: 15px;
		border-radius: 10px;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	}

	table {
		width: 90%;
		margin: 0 auto;
		border-collapse: collapse;
		background-color: #ffffff;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
		border-radius: 8px;
		overflow: hidden;
	}

	th, td {
		padding: 14px;
		text-align: center;
		border-bottom: 1px solid #ddd;
	}

	th {
		background-color: #007bff;
		color: white;
		font-size: 16px;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	tr:hover {
		background-color: #e9ecef;
	}

	a {
		text-decoration: none;
		color: #007bff;
		margin: 0 5px;
		transition: color 0.2s ease;
	}

	a:hover {
		color: #0056b3;
	}

	@media (max-width: 768px) {
		table {
			width: 100%;
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
			<th>번호</th>
			<th>수입/지출</th>
			<th>내용</th>
			<th>수정/삭제</th>
			<th>날짜</th>
		</tr>
		
		<%
			for(Category c : list)	{	
		%>
		<tr>
			<td><%=c.getCategoryNo()%></td>
			<td><%=c.getKind()%></td>
			<td><%=c.getTitle()%></td>
			<td>
			<a href="/cashbook/category/updateCategoryTitleForm.jsp?categoryNo=<%=c.getCategoryNo()%>&kind=<%=c.getKind()%>">[수정하기]</a>
			<a href="/cashbook/category/deleteCategory.jsp?categoryNo=<%=c.getCategoryNo()%>">[삭제하기]</a>
			</td>
			<td><%=c.getCreatedate() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>