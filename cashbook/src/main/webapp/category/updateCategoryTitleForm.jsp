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
</head>
<body>
	<div>
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
			<td><input type="radio" name="kind" value="수입" checked="<%=kind.equals("수입") ? "checked" : "" %>" readonly>수입</td>
			<td><input type="radio" name="kind" value="지출" checked="<%=kind.equals("지출") ? "checked" : "" %>" readonly>지출</td>
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