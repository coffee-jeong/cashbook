<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}

	String memo = request.getParameter("memo");
	String title = request.getParameter("title");
	int amount = Integer.parseInt(request.getParameter("amount"));
	String cashdate = request.getParameter("cashdate");
	System.out.println("memo:" + memo);
	System.out.println("title:" + title);
	System.out.println("amount:" + amount);
	System.out.println("cashdate:" + cashdate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
				<td><%=cashdate%></td>
			</tr>
		</table>
		<a href="/cashbook/cash/updateCashForm.jsp?title=<%=title%>&memo=<%=memo%>&amount=<%=amount%>&cashdate=<%=cashdate%>">[수정하기]</a>
		<a href="/cashbook/cash/deleteCashAction.jsp">[삭제하기]</a>
</body>
</html>