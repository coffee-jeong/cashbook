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
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
		<table border="1">
			<tr>
				<th>분류</th>
				<td>
					<input type="text" name="title" value="<%=title%>" readonly>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="20" name="memo"></textarea>
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="amount">
				</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td><%=cashDate%></td>
			</tr>
		</table>
		<a href="/cashbook/cash/updateCashAction.jsp?memo=<%=memo%>&amount=<%=amount%>&cashDate=<%=cashDate%>&cashNo=<%=cashNo%>">[수정하기]</a>
		<a href="/cashbook/cash/deleteCashAction.jsp?cashNo=<%=cashNo%>">[삭제하기]</a>
		<a href="/cashbook/receit/insertReceitForm.jsp?cashNo=<%=cashNo%>">[영수증등록]</a>
		<a href="/cashbook/receit/deleteReceitForm.jsp?cashNo=<%=cashNo%>">[영수증삭제]</a>
		
</body>
</html>