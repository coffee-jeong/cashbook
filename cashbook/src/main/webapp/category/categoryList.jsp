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
</head>
<body>
	<div>
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