<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태확인
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int year = request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) : Calendar.getInstance().get(Calendar.YEAR);
	int month = request.getParameter("month") != null ? Integer.parseInt(request.getParameter("month")) : Calendar.getInstance().get(Calendar.MONTH) + 1;

	Calendar cal = Calendar.getInstance();
	cal.set(year, month - 1, 1); // 해당 월의 1일로 설정

	int startBlank = cal.get(Calendar.DAY_OF_WEEK) - 1; // 1일의 요일 (일:1 ~ 토:7 → 0부터 시작하게 -1)
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 해당 월의 마지막 날짜
	int days = 1;
	int row = (int)Math.ceil((startBlank + end) / 7.0); // 한 주에 몇 줄이 필요한지
	
	// 이전 달 계산
	int prevYear = year;
	int prevMonth = month - 1;
	if (prevMonth < 1) {
		prevMonth = 12;
		prevYear--;
	}

	// 다음 달 계산
	int nextYear = year;
	int nextMonth = month + 1;
	if (nextMonth > 12) {
		nextMonth = 1;
		nextYear++;
	}
	
	// cash 데이터 조회 및 정리
	CashDao dao = new CashDao();
	List<HashMap<String, Object>> cashList = dao.cashList(year, month);

	HashMap<Integer, HashMap<String, Integer>> dayMap = new HashMap<>();
	for (HashMap<String, Object> entry : cashList) {
	int day = (Integer) entry.get("day");
	String kind = (String) entry.get("kind");
	int total = (Integer) entry.get("total");

	if (!dayMap.containsKey(day)) {
		dayMap.put(day, new HashMap<>());
	}
	dayMap.get(day).put(kind, total);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f8f8f8;
		margin: 20px;
	}
	div {
		text-align: center;
		margin-bottom: 20px;
	}
	table {
		width: 80%;
		margin: 0 auto;
		border-collapse: collapse;
		background-color: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	th, td {
		width: 14.28%;
		height: 100px;
		text-align: left;
		vertical-align: top;
		border: 1px solid #ccc;
		padding: 8px;
		box-sizing: border-box;
	}
	tr:first-child td {
		font-weight: bold;
		background-color: #f0f0f0;
		text-align: center;
	}
	td:nth-child(1) { color: red; } /* 일요일 */
	td:nth-child(7) { color: blue; } /* 토요일 */
	.amount-income { color: green; font-size: 12px; }
	.amount-expense { color: red; font-size: 12px; }
	a {
		margin: 0 20px;
		text-decoration: none;
		color: #333;
		font-weight: bold;
	}
	a:hover {
		color: #007bff;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<div>
		<a href="/cashbook/month/monthList.jsp?year=<%=prevYear%>&month=<%=prevMonth%>">이전달</a>
		<strong><%=year%>년 <%=month%>월</strong>
		<a href="/cashbook/month/monthList.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">다음달</a>
	</div>
	<table border="1">
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	<%
		for (int i = 0; i < row; i++) {
	%>
		<tr>
	<%
		for (int j = 0; j < 7; j++) {
			if (i == 0 && j < startBlank) {
	%>
			<td></td>
	<%
			} else if (days > end) {
	%>
			<td></td>
	<%
			} else {
	%>
			<td>
				<div>
					<a href="/cashbook/cash/cashOne.jsp?year=<%=year%>&month=<%=month%>&days=<%=days%>"><%=days%></a>
				</div>
				<%
					HashMap<String, Integer> cash = dayMap.get(days);
					if (cash != null) {
						if (cash.get("수입") != null) {
				%> 
						<div class="amount-income">
							 수입 합 : <%=String.format("%,d", cash.get("수입"))%>원
						</div>
				<%
						}
						if (cash.get("지출") != null) {
				%>	
						<div class="amount-expense"> 
							지출 합 :<%=String.format("%,d", cash.get("지출"))%>원
						</div>
				<%
						}
					}
					days++;
				%>
			</td>
	<%
			}
		}
	%>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>