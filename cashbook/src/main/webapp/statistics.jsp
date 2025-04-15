<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태확인
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
    // 현재 년도 받아오기
    int Year = Calendar.getInstance().get(Calendar.YEAR);

    // choiceYear가 전달되지 않았을 경우 기본값으로 현재 연도 사용
    String choiceYearParam = request.getParameter("choiceYear");
    int choiceYear = (choiceYearParam != null) ? Integer.parseInt(choiceYearParam) : Year;

    System.out.println("선택된 year: " + choiceYear);
    
    CashDao cashDao = new CashDao();
    ArrayList<HashMap<String, Object>> statistics = cashDao.statisticsList(choiceYear);
	
    ArrayList<HashMap<String, Object>> totalStats = cashDao.yearStatistics(choiceYear);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=choiceYear%>년 통계</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        h2 {
            text-align: center;
        }
        form {
            text-align: center;
        }
    </style>
</head>
<body>
	<div>
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
    <h2><%=choiceYear%>년 월별 수입/지출 통계</h2>

    <form action="/cashbook/statistics.jsp" method="get">
        <select name="choiceYear">
            <% for (int y = Year; y >= Year - 10; y--) { 
            %>
                <option value="<%=y%>" <%= (y == choiceYear ? "selected" : "") %>><%=y%>년</option>
            <%
            	} 
            %>
        </select>
        <button type="submit">조회</button>
    </form>

    <table>
        <tr>
            <th>월</th>
            <th>수입/지출</th>
            <th>항목</th>
            <th>건수</th>
            <th>총합</th>
        </tr>
        <% 
        	for (HashMap<String, Object> row : statistics) { 
       	%>
            <tr>
                <td><%= row.get("month") %>월</td>
                <td><%= row.get("kind") %></td>
                <td><%= row.get("title") %></td>
                <td><%= row.get("count") %>건</td>
                <td><%= String.format("%,d", row.get("sum")) %>원</td>
            </tr>
        <%
        	} 
        
        %>
    </table>
    <table border="1" cellpadding="8" cellspacing="0">
	<tr>
		<th>구분</th>
		<th>건수</th>
		<th>합계</th>
	</tr>
	<%
		for (HashMap<String, Object> row : totalStats) {
	%>
	<tr>
		<td><%=row.get("kind")%></td>
		<td><%=row.get("count")%> 건</td>
		<td><%=String.format("%,d", row.get("sum"))%>원</td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>