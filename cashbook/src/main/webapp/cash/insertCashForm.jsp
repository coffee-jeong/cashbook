<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}

	// dateList.jsp -> 수입/지출 입력(0000-00-00)String cashDate -> 
	
	String cashDate = request.getParameter("cashDate");
	System.out.println("cashDate:" + cashDate);
	
	// insertCashForm.jsp  현페이지에서 선택하면 넘어와서 받는다
	String kind = request.getParameter("kind");
	ArrayList<Category> list = null;
	if(kind != null) { // insertCashForm.jsp에서 kind 선택 후 재 요청
		// DB에서 선택된 kind의 title 목록 받아온다 
		CategoryDAO categorydao = new CategoryDAO();
		list = categorydao.selectCategoryListByKind(kind);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<!-- 수입/지출 선택을 위한 form -->
	<form method="post" action="/cashbook/cash/insertCashForm.jsp">
		<input type="hidden" name="cashDate" value="<%=cashDate%>">
		kind
		<select name="kind">
			<option value="">::선택::</option>
			<option>수입</option>
			<option>지출</option>
		</select>
		<button type="submit">수입/지출 선택</button>
	</form>
	<hr>
	<!-- cash이력 추가를 위한 form -->
	<form method="post" action="/cashbook/cash/insertCashAction.jsp">
		날짜 : <input type="text" name="cashDate" value="<%=cashDate%>" readonly><br>
		카테고리 : 
		<select name="categoryNo">
			<%
				if(list != null) {
					for(Category c : list) {
			%>
					<option value="<%=c.getCategoryNo()%>"><%=c.getTitle()%></option>
			<%
					}
				}
			%>
		</select>
		<input type="hidden" name="kind" value="<%=kind%>">
		금액 : <input type="number" name="amount">
		내용 : <input type="text" name="memo">
		<button type="submit">수입/지출 입력</button>
	</form>
</body>
</html>